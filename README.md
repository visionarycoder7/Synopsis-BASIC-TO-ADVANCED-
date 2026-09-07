# Synopsis-BASIC-TO-ADVANCED-
Daily Synopsys practice covering VLSI circuit design and simulation from basic to advanced concepts. Documenting hands-on implementations, experiments, simulations, and continuous learning to strengthen my understanding of CMOS circuits, VLSI design, and EDA workflows.
# Synopsys: Basic to Advanced

A structured, hands-on VLSI learning series focused on understanding concepts and workflows commonly encountered with Synopsys EDA tools.

> **Note:** This repository is created for educational and self-practice purposes. Since commercial Synopsys EDA licenses are not financially accessible to me as an individual student, I am using open-source tools such as **Verilator** to implement and practice relevant concepts wherever applicable.

---

## 🎯 Objective

The goal of this repository is to build a strong practical understanding of digital VLSI design through consistent hands-on practice.

The series will progress from fundamental RTL concepts to more advanced design, verification, simulation, and synthesis-related workflows.

Rather than simply following tutorials, I will document my implementations, experiments, errors, debugging process, and learning outcomes.

---

## 🛠️ Tools & Technologies

### Primary Open-Source Tool

- **Verilator** – Verilog/SystemVerilog linting, compilation and simulation
- **Git & GitHub** – Version control and documentation

### Additional Tools

As the series progresses, additional open-source VLSI tools may be incorporated, including:

- Yosys – RTL synthesis
- GTKWave – Waveform visualization
- OpenROAD – Digital RTL-to-GDSII flow
- KLayout – Layout viewing and analysis
- Icarus Verilog – Verilog/SystemVerilog simulation

The toolset may evolve depending on the requirements of each experiment.

---

## 📚 Learning Roadmap

### 01. Verilog Fundamentals
- Module design
- Ports and data types
- Continuous assignments
- Procedural blocks
- Combinational logic
- Sequential logic
- Parameters
- Generate constructs

### 02. Digital Logic Design
- Multiplexers
- Encoders and decoders
- Adders and subtractors
- Comparators
- ALU
- Registers
- Counters
- Shift registers

### 03. RTL Design
- RTL modelling
- Combinational RTL
- Sequential RTL
- Finite State Machines
- Clocked logic
- Reset strategies
- Parameterized designs

### 04. Verification & Simulation
- Testbenches
- Stimulus generation
- Assertions
- Functional verification
- Waveform analysis
- Debugging simulation failures
- Linting and warnings

### 05. SystemVerilog
- SystemVerilog syntax
- `logic`
- `always_comb`
- `always_ff`
- Enumerations
- Structures
- Interfaces
- Basic verification constructs

### 06. Synthesis
- RTL synthesis concepts
- Technology-independent synthesis
- Logic optimization
- Gate-level representation
- Timing considerations
- Synthesis reports

### 07. Digital VLSI Flow
- RTL
- Simulation
- Synthesis
- Floorplanning
- Placement
- Clock Tree Synthesis
- Routing
- Physical verification
- GDSII

### 08. Advanced Practice
- Larger RTL designs
- Reusable modules
- Parameterized architectures
- Design optimization
- Timing analysis
- Verification strategies
- End-to-end digital design projects

---

## 🔬 Practice Methodology

Each experiment will generally follow this workflow:

```text
Concept
   ↓
RTL Design
   ↓
Testbench
   ↓
Linting
   ↓
Simulation
   ↓
Waveform Analysis
   ↓
Debugging
   ↓
Documentation
