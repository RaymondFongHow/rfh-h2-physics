#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v latexmk >/dev/null 2>&1; then
  echo "latexmk not found. Install it first (e.g., via TeX Live or MacTeX)." >&2
  exit 1
fi

tex_files=()
pids=()
rescan_pid=""
rescan_interval=5

collect_tex_files() {
  local files=()
  while IFS= read -r -d '' tex; do
    files+=("$tex")
  done < <(find "$root_dir" -type f -name "*.tex" -not -path "*/.git/*" -print0)
  printf '%s\0' "${files[@]}"
}

contains_tex() {
  local target="$1"
  local tex
  for tex in "${tex_files[@]:-}"; do
    if [[ "$tex" == "$target" ]]; then
      return 0
    fi
  done
  return 1
}

cleanup_intermediates() {
  rm -f \
    *.aux *.log *.fls *.fdb_latexmk *.out *.synctex.gz \
    *.nav *.snm *.toc
}

get_mtime() {
  if stat -f %m "$1" >/dev/null 2>&1; then
    stat -f %m "$1"
  else
    stat -c %Y "$1"
  fi
}

build_tex() {
  local dir="$1"
  local base="$2"
  (
    cd "$dir"
    latexmk -pdf -interaction=nonstopmode -halt-on-error "$base"
  )
}

start_watcher() {
  local tex="$1"
  local dir base
  dir="$(dirname "$tex")"
  base="$(basename "$tex")"
  (
    cd "$dir"
    while [[ ! -f "$base" ]]; do
      sleep 1
    done
    last_mtime="$(get_mtime "$base")"
    while true; do
      sleep 1
      if [[ ! -f "$base" ]]; then
        continue
      fi
      current_mtime="$(get_mtime "$base")"
      if [[ "$current_mtime" != "$last_mtime" ]]; then
        if build_tex "$dir" "$base"; then
          cleanup_intermediates
        else
          echo "Build failed for: $base (watcher continuing...)" >&2
          cleanup_intermediates || true
        fi
        last_mtime="$current_mtime"
      fi
    done
  ) &
  pids+=("$!")
  tex_files+=("$tex")
  echo "  watching: $tex"
}

echo "Building existing .tex file(s) once..."
while IFS= read -r -d '' tex; do
  dir="$(dirname "$tex")"
  base="$(basename "$tex")"
  if build_tex "$dir" "$base"; then
    (cd "$dir" && cleanup_intermediates)
  else
    echo "Build failed for: $tex (continuing...)" >&2
    (cd "$dir" && cleanup_intermediates) || true
  fi
  start_watcher "$tex"
done < <(collect_tex_files)

if [[ ${#tex_files[@]} -eq 0 ]]; then
  echo "No .tex files found under $root_dir (will keep rescanning)." >&2
fi

echo "Watching ${#tex_files[@]} .tex file(s) for changes..."
echo "Auto-rescan enabled (every ${rescan_interval}s). Stop with Ctrl+C"
cleanup() {
  echo "Stopping watchers..."
  if [[ -n "${rescan_pid:-}" ]]; then
    if kill -0 "$rescan_pid" >/dev/null 2>&1; then
      kill "$rescan_pid" || true
    fi
  fi
  for pid in "${pids[@]:-}"; do
    if kill -0 "$pid" >/dev/null 2>&1; then
      kill "$pid" || true
    fi
  done
  for tex in "${tex_files[@]}"; do
    dir="$(dirname "$tex")"
    (cd "$dir" && cleanup_intermediates) || true
  done
}
trap cleanup INT TERM

(
  while true; do
    sleep "$rescan_interval"
    while IFS= read -r -d '' tex; do
      if ! contains_tex "$tex"; then
        echo "New .tex found: $tex"
        dir="$(dirname "$tex")"
        base="$(basename "$tex")"
        if build_tex "$dir" "$base"; then
          (cd "$dir" && cleanup_intermediates)
        else
          echo "Build failed for: $tex (continuing...)" >&2
          (cd "$dir" && cleanup_intermediates) || true
        fi
        start_watcher "$tex"
      fi
    done < <(collect_tex_files)
  done
) &
rescan_pid="$!"

wait
