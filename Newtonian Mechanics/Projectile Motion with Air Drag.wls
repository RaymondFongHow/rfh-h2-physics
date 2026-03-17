(*
  Projectile Motion in 2D with Air Drag (Wolfram Language script)
  Run:
    wolframscript -file "Projectile Motion with Air Drag.wls"
  Outputs:
    - projectile_drag.png  (static comparison plot)
    - projectile_drag.gif  (simple animation of the drag case)
*)

If[$InputFileName =!= "", SetDirectory[DirectoryName[$InputFileName]]];

ClearAll[simulateProjectile];
Options[simulateProjectile] = {
  "g" -> 9.81,          (* m/s^2 *)
  "m" -> 0.145,         (* kg, baseball-ish *)
  "c" -> 0.02,          (* drag coefficient, tuned for demo *)
  "DragLaw" -> "quadratic",
  "tmax" -> 20
};

simulateProjectile[v0_, thetaDeg_, opts : OptionsPattern[]] := Module[
  {
    g = OptionValue["g"],
    m = OptionValue["m"],
    c = OptionValue["c"],
    dragLaw = OptionValue["DragLaw"],
    tmax = OptionValue["tmax"],
    θ, drag, sol, rfun, tEnd
  },

  θ = thetaDeg Degree;

  drag[v_] := Which[
    dragLaw === "linear", -c v,
    dragLaw === "quadratic", -c v Norm[v],
    True, -c v Norm[v]
  ];

  sol = NDSolve[
    {
      r''[t] == drag[r'[t]]/m + {0, -g},
      r[0] == {0, 0},
      r'[0] == v0 {Cos[θ], Sin[θ]},
      WhenEvent[r[t][[2]] <= 0 && t > 0, "StopIntegration"]
    },
    r,
    {t, 0, tmax},
    MaxStepFraction -> 1/200
  ];

  rfun = r /. First@sol;
  tEnd = Last@rfun["Domain"][[1]];

  <|"Solution" -> rfun, "tEnd" -> tEnd|>
];

(* Parameters for the demo *)
v0 = 35;         (* m/s *)
theta = 50;      (* degrees *)

simDrag = simulateProjectile[v0, theta, "c" -> 0.02, "DragLaw" -> "quadratic"];
simNoDrag = simulateProjectile[v0, theta, "c" -> 0.0, "DragLaw" -> "quadratic"];

trajDrag = ParametricPlot[
  Evaluate[simDrag["Solution"][t]],
  {t, 0, simDrag["tEnd"]},
  PlotStyle -> {Thick, RGBColor[0.85, 0.2, 0.1]},
  PlotRange -> All
];

trajNoDrag = ParametricPlot[
  Evaluate[simNoDrag["Solution"][t]],
  {t, 0, simNoDrag["tEnd"]},
  PlotStyle -> {Dashed, Thick, RGBColor[0.1, 0.3, 0.8]},
  PlotRange -> All
];

comparisonPlot = Show[
  trajDrag,
  trajNoDrag,
  Frame -> True,
  FrameLabel -> {"x (m)", "y (m)"},
  PlotRange -> All,
  ImageSize -> 700,
  PlotLegends -> Placed[LineLegend[{"Quadratic drag", "No drag"}], {0.75, 0.8}]
];

Export["projectile_drag.png", comparisonPlot];

(* Simple animation for the drag case *)
frames = Table[
  Show[
    trajDrag,
    Graphics[{RGBColor[0.85, 0.2, 0.1], PointSize[Large], Point[simDrag["Solution"][t]]}],
    Frame -> True,
    FrameLabel -> {"x (m)", "y (m)"},
    PlotRange -> All,
    ImageSize -> 700
  ],
  {t, 0, simDrag["tEnd"], simDrag["tEnd"]/60}
];

Export["projectile_drag.gif", frames, "DisplayDurations" -> 0.05];

Print["Done. Outputs written to:"];
Print[FileNameJoin[{Directory[], "projectile_drag.png"}]];
Print[FileNameJoin[{Directory[], "projectile_drag.gif"}]];
