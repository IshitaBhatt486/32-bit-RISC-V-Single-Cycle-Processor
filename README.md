# 32-bit RISC-V Single-Cycle Processor

This directory contains a structural Verilog implementation of a single-cycle
RISC-V processor. `Instantiation.v` provides the `top` module that connects the
program counter, instruction memory, register file, immediate generator,
control logic, ALU, data memory, and write-back multiplexers.

## Source files

- `Instantiation.v` — top-level module.
- `ProgramCounter.v`, `InstructionMemory.v`, `RegisterFile.v`, and `DataMemory.v` — processor state and memories.
- `ControlUnit.v`, `ALU_ControlUnit.v`, `ALU.v`, and `ImmediateGenerator.v` — instruction decode and execution.
- `Misc.v` — adders, multiplexers, and branch gate used by the top level.

## Implemented instruction subset

The supplied program and test bench exercise `add`, `sub`, `and`, `or`, `addi`,
`andi`, `ori`, `lw`, `sw`, and `beq`. Memories are word-addressed internally;
their external addresses follow RISC-V byte-addressing semantics.

## Simulation

Install [Icarus Verilog](https://steveicarus.github.io/iverilog/) and run:

```powershell
iverilog -g2012 -s processor_tb -o processor_tb.vvp *.v
vvp processor_tb.vvp
```

`processor_tb.v` checks the bundled program's register, memory, and branch
results and writes a `processor_tb.vcd` waveform.
