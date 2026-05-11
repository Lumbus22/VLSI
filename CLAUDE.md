# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

University VLSI design course repository using **Electric VLSI Design System v9.08** with TSMC 0.18um CMOS process technology (MOSIS foundry). Circuits are designed as schematics/layouts in Electric and simulated via SPICE netlists.

## Repository Structure

- `ElectricVLSI/Libraries/` — Primary working directory with `.jelib` libraries and exported SPICE/simulation files
- `ElectricVLSI/Inverter/` — Earlier standalone inverter lab (Lab 1 files duplicated here)
- `ElectricVLSI/TransistorSpecs/` — TSMC 018 process models (`tsmc018.lib`, `.asy` symbols)

## Lab Progression

- **Lab 1** (`LAB1.jelib`) — NMOS/PMOS transistors, CMOS inverter
- **Lab 2** (`LAB-2.jelib`) — NAND and NOR gates (transistor-level and icon/subcircuit versions)
- **Lab 3** (`Lab3.jelib`) — Icon-based hierarchical designs
- **Lab 4** (`4BitAdder.jelib`) — Full adder → 4-bit adder (current work; uses global labels)

## SPICE Conventions

- Technology: `mocmos` layout, MOSIS foundry
- Supply voltage: 3V (`vdd vdd 0 DC 3`)
- Transistor sizing: NMOS W=0.3U L=0.2U, PMOS W=0.6U L=0.2U (2:1 P/N ratio)
- `.include` paths reference `ElectricVLSI/TransistorSpecs/tsmc018.lib` — these paths are Windows-absolute in exported files and need updating for other platforms
- Simulation: transient analysis (`.tran`), with `.meas` statements for rise/fall time and propagation delay
- Subcircuits use library-prefixed names (e.g., `LAB-2__NAND`)

## Key Notes

- The `.jelib` files are Electric's native format (text-based, editable but fragile — prefer editing in Electric GUI)
- `.spi` files are SPICE netlists exported from Electric; `.raw` files are simulation results; `.db`/`.op.raw` are intermediate
- The `tsmc018.lib` is a binary SPICE model library — do not attempt to read/edit it directly
