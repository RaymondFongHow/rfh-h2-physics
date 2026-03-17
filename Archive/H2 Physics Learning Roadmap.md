## Auto-Compile LaTeX PDFs on Save

Requirement: `latexmk` installed (via TeX Live or MacTeX).

Start the watcher from the repo root:

```bash
./watch-tex.sh
```

It will build all `.tex` files once at startup, then watch for changes.

Stop it with `Ctrl+C`. PDFs are generated alongside each `.tex` file, and
intermediate build files are removed automatically after each build.

---
# H2 Physics Learning Roadmap

---

## SECTION 0: MATHEMATICAL FOUNDATION

### Chapter 0: Quantities and Analysis

- Units
    - SI units: base units; derived units; unit prefixes
    - Non-SI unit system; e.g.: Gaussian units, natural units
    - Unit and estimation of quantities
    - Units and dimensions
        - Notation for quantity dimension
        - Homogeneity of physical equations
        - Dimensional analysis
- Measurements and Statistics
    - Random and systematic errors of measurements
    - Precision and accuracy of statistics
    - Uncertainty calculations: absolute, fractional, percentage
- Vector Algebra
    - 2D vectors in coordinate systems
        - Cartesian: x & y coordinates and orthogonal decomposition
        - Polar: angular and radial coordinates
    - Scalars as 1D vectors
    - Vector arithmetic
        - Addition, multiplication (scalar, dot, and cross product)
        - Mention: vector as an n*1 matrix, and the resulting algebra
    - Unit of vectors and vector products
    - Mention: Complex numbers
        - How are complex numbers similar to 2D vectors
        - How they are different
    - Mention: fields
        - Quantity as a function of spatial, or spatial and time, coordinates
        - Superposition as vector addition

---

## SECTION I: MECHANICS

### Chapter 1: Kinematics I

- Position and its time derivatives
    - Position, displacement, and distance
    - Velocity and speed
    - Acceleration and its magnitude
    - Mention: jerk and higher order derivatives and why they are less often used
- Graphs for 1D motions & analysis
    - gradients as the rate of change
    - areas as the accumulation
    - Time dependent graphs: x-t, v-t, a-t
        - Time derivative advances the curve
    - Briefly mention time independent graphs: v-x, a-v, a-x
        - What advances the curve here?
- 1D motion with constant **a** (forces not mentioned)
    - Equations of uniformly accelerated motion
        - Derivation based on non-uniform motion
        - Extra: Energy interpretation of the time independent equation
    - Example: Free fall (with constant gravitational acceleration)

### Chapter 2: Kinematics II

- 2D Motion overview
    - Independent analysis along orthogonal directions
    - With an interest over curvature: tangential and centripetal a by vector decomposition
- 2D motion with constant **a** (forces not mentioned)
    - Projectile motion
- 2D motion with constant centripetal |**a**|
    - Common misconception: **a** is not constant for circular motion. |**a**| is.
    - Centripetal acceleration (a = ω²r = v²/r)
- Constrained motion: kinematic relationships (without mentioning force) [This being here still feels a bit out of place… What do you think?]

### Chapter 2: Dynamics I

- Mass as inertia (a qualitative mention)
- N1L: F = 0 ⇒ a = 0
- N2L: **F** = m**a** (actually, **F**(t) = m(t)**a**(t) )
- N3L: **F_action** + **F_reaction** = **0**
- Free-body diagrams and vector triangles
- Moment of a force, torque of a couple
- Conditions for equilibrium (F_net = 0, τ_net = 0) — statics as special case

### Chapter 3: Dynamics II

- Types of forces: gravitational, electric, magnetic, normal, friction, viscous, buoyant
- centre of gravity
- buoyancy
- Friction (**f_k** = - mu_k F_N **v_hat**, f_s,max = - mu_s F_N **v_hat**)
- Drag (general model: polynomial with coefficients. more usually: linear / quadratic)
- Hooke’s law (**F** = - k **Delta-x**)
- Projectile and circular motion revisited
- Basic constrained motion — inclined planes, pulleys, connected bodies

---

### Chapter 4: Energy

- Energy stores and transfers, conservation of energy
- Work done by a force (dW = **F**.d**l = |F| |**d**l|** cosθ)
- Kinetic energy — derivation from work, Ek = ½m|**v|**²
- Gravitational potential energy near Earth (ΔEp = mgΔh)
- Elastic potential energy — area under force-extension graph
- Power (P = E/t, P = Fv)
- Energy transmission in constrained systems
- Efficiency

---

### Chapter 5: Momentum

- Momentum - **p** = m **v**
- Impulse — **J** = Delta-**p**, ****area under force-time graph
- Conservation of momentum (Linear & Angular)
- Elastic and inelastic collisions in one dimension
    - Relative speed of approach = relative speed of separation (perfectly elastic)
    - Perfectly inelastic
    - Kinetic energy changes in collisions
- Extra: non-heads-on collisions

---

## SECTION II: OSCILLATIONS AND WAVES

### Chapter 6: Oscillations

- Free oscillations, experimental investigation
- Amplitude, period, frequency, angular frequency, phase, phase difference
- Defining equation of SHM (a = -ω²x)
- General solution: …
- Particular Solutions: x = x₀ sin ωt, v = v₀ cos ωt, v = ±ω√(x₀² – x²)
- Graphical relationships (x-t, v-t, a-t, v-x, a-v, a-x)
- Energy interchange in SHM
- Damped oscillations (light, critical, heavy), critical damping applications
- Forced oscillations and resonance — amplitude response, sharpness, practical examples

---

### Chapter 7: Waves I

- General wave equation
- Sinusoidal 1D wave as a function of x and t
- Displacement, amplitude, period, frequency, wavelength, speed (v = fλ)
- Graphical representation — transverse and longitudinal
- Energy transfer by waves, intensity (I ∝ amplitude²)
- Inverse square law for point sources
- Polarisation (transverse waves), Malus’ law (I = I₀ cos²θ)

---

### Chapter 8: Waves II

- Principle of superposition in 1D
- Standing waves for a general wave — formation, nodes, antinodes (pressure vs displacement for sound)
- Examples: microwaves, strings, air columns, wavelength determination
- Qualitative understanding: Huygens’ Principle
- Diffraction, interference, coherence, phase and path difference
- Two-source interference — conditions, double-slit (ax/D = λ)
- Diffraction grating (a sinθ = nλ), wavelength determination
- Single-slit diffraction — first minima (b sinθ = λ)
- Rayleigh criterion for resolution (θ ≈ λ/b)

---

## SECTION III: Gravity

### Chapter 9: Gravity

- Concept of field: quantity as a function of coordinates
- Newton’s law of gravitation (F = Gm₁m₂/r²) [change it to vector form]
- Gravitational field strength — definition (g = F/m) and point mass formula (g = GM/r²)
- Field lines — uniform and radial
- Gravitational potential (φ = –GM/r) and potential energy (U = –GMm/r)
- Field strength as negative potential gradient
- Escape velocity — energy considerations
- Circular orbits — equating gravitational force to centripetal force
- Geostationary satellites — characteristics and applications

---

## SECTION IV: Electricity & Magnetism

### Chapter 10: Electrostatics

- Electric field strength — definition (E = F/Q) [Change everything to vector form]
- Coulomb’s law (F = (1/4πε₀)(Q₁Q₂/r²))
- Field strength for point charge (E = (1/4πε₀)(Q/r²))
- Field lines and equipotentials
- Electric potential (V = (1/4πε₀)(Q/r)) and potential energy (U = (1/4πε₀)(Q₁Q₂/r))
- Field strength as negative potential gradient
- Uniform fields between parallel plates (E = V/d), force on charge, motion of charged particles
- Capacitance (C = Q/V)
- Energy stored in a capacitor — U = ½QV = ½Q²/C = ½CV², area under V-Q graph
- Capacitors in series and parallel

---

### Chapter 11: Circuit

- Electric current (I = Q/t), drift velocity (I = nAvq)
- Potential difference (V = W/Q)
- Electrical power (P = VI = I²R = V²/R)
- Distinguishing e.m.f. and p.d.
- Resistance (R = V/I), resistivity (R = ρl/A)
- I-V characteristics — ohmic resistor, diode, filament lamp, NTC thermistor
- Temperature dependence of resistivity — metals (drift velocity), semiconductors (number density)
- Internal resistance — effect on terminal p.d. and output power
- Resistors in series and parallel
- Potential divider circuits — including thermistors and LDRs
- Charging and discharging a capacitor — Q = Q₀[1 – e^(–t/τ)], Q = Q₀e^(–t/τ), time constant τ = RC

### Chapter 12: Magnetostatics

- Magnetic field from currents and permanent magnets
- Field lines — long straight wire, flat circular coil, long solenoid
- Biot-Savart Law
- Magnetic flux density formulas: B = μ₀I/(2πd), B = μ₀NI/(2r), B = μ₀nI
- Force on current-carrying conductor (F = BIl sinθ), Fleming’s left-hand rule
- Definition of magnetic flux density (B = F/Il for ⊥)
- Force between two current-carrying conductors
- Force on moving charge (F = BQv sinθ)
- Deflection of charged particles in electric and magnetic fields
- Velocity selection — crossed fields

---

### Chapter 13: Electromagnetic Induction

- Magnetic flux (Φ = BA), flux linkage (NΦ)
- Experimental evidence — changing flux induces e.m.f.
- Faraday’s law and Lenz’s law — direction opposes change
- Simple applications
- Alternating current — period, frequency, peak value, r.m.s.
- Sinusoidal AC: x = x₀ sin ωt, I_rms = I₀/√2, V_rms = V₀/√2
- Mean power in resistive load — half peak power for sine wave

---

### Chapter 14: Electrical Appliances

- Half-wave rectification using a single diode
- Ideal transformer — Nₛ/Nₚ = Vₛ/Vₚ = Iₚ/Iₛ, principle of operation

---

## SECTION VI: THERMAL PHYSICS

### Chapter 15: Thermal Physics

- Thermodynamic temperature scale, absolute zero, conversion °C to K
- Ideal gas equation: pV = NkT
- Avogadro constant, molar gas constant, Boltzmann constant
- Kinetic theory assumptions
- Derivation of pV = ⅓Nm⟨c²⟩
- Mean translational KE = ³⁄₂kT
- Internal energy — sum of microscopic KE and PE, determined by macroscopic state
- Temperature — proportional to mean KE
- Thermal contact, thermal equilibrium, Zeroth law
- Work done by a gas (W = pΔV at constant pressure)
- First law of thermodynamics (ΔU = Q + W)
- Specific heat capacity and specific latent heat

---

## SECTION VII: MODERN PHYSICS

### Chapter 16: Quantum Physics

- Photoelectric effect — threshold frequency, evidence for particle nature
- Photon energy (E = hf) and momentum (p = h/λ)
- Electron diffraction — evidence for wave nature of particles
- de Broglie wavelength (λ = h/p)
- Uncertainty principle
- Discrete electronic energy levels in atoms (e.g. hydrogen)
- Emission and absorption line spectra
- Photon transitions between energy levels

---

### Chapter 17: Nuclear Physics

- Rutherford α‑scattering — existence and small size of nucleus
- Nucleon number (A), proton number (Z), isotopes, notation ^A_Z X
- Spontaneous and random nature of decay, fluctuations in count rate
- Background radiation — origin and significance
- α, β, γ radiations — nature and properties
- Activity (A = λN), decay constant
- Exponential decay: x = x₀e^(–λt) (activity, undecayed nuclei, count rate)
- Half-life: t_½ = ln2/λ
- Applications and hazards of radioactivity (based on half-life, penetration, ionising ability)
- Nuclear equations and conservation laws (nucleon number, charge, mass-energy)
- Prediction of (anti)neutrino in β decay (conservation of momentum and energy)
- Mass defect, binding energy, E = mc²
- Binding energy per nucleon vs nucleon number — graph and relevance to fusion and fission

---
