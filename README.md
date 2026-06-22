# single-channel-sim

A Monte Carlo simulator for AMPA receptor ion channels, intended for educational use. Based on Arnd Roth's Colquhoun-Hawkes package.

Live at [www.melkyway.ca/single-channel-sim](https://www.melkyway.ca/single-channel-sim).

## Overview

The simulator models a single AMPA receptor channel with four kinetic states: three closed states (C1, C2, C3) and one open state (O). It runs a Monte Carlo simulation using the Colquhoun-Hawkes algorithm to generate stochastic single-channel traces, then aggregates them to compute ensemble statistics.

The four plots shown are:

- Single trace sweeps: individual stochastic current traces stacked vertically
- Sum trace: the sum of all single channel currents over time
- Variance and mean current vs. time: used for non-stationary fluctuation analysis
- Variance vs. mean (Alvarez plot): fits the parabolic model `sigma^2 = i*I - (1/N)*I^2` to estimate single channel current `i` and channel count `N`

## Parameters

| Parameter | Description |
|---|---|
| N | number of single channels in the simulation |
| E - E_rev | driving force in volts |
| gamma | single channel conductance in pS |
| Excitation duration | duration of the transmitter pulse in ms |
| Measurement duration | total recording time in ms |
| Ensemble size | number of independent runs used to compute variance statistics |
| Noise std dev | standard deviation of Gaussian noise added to each trace |
| Random seed | seed for the random number generator, for reproducibility |

## Development

Install dependencies and start the dev server:

```
npm install
npm run dev
```

Build for production (outputs to the repo root for GitHub Pages):

```
npm run build
```

The build script cleans previous build artifacts before rebuilding, so old hashed files are removed automatically.

## Architecture

- Vue 3 (via CDN) for reactivity
- Chart.js with chartjs-plugin-zoom for plots
- Parcel for bundling
- Web Worker for off-thread simulation
- MathJax for equation rendering
