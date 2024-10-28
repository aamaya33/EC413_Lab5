# EC413 Lab 6: Single-Cycle MIPS CPU Design and Enhancement

## Overview
This lab involves designing, simulating, and enhancing a single-cycle MIPS CPU to support various instructions. The primary objective is to deepen understanding of CPU operations and datapath modifications, enabling the addition of new instructions like SLT, ADDI, J, BNE, and LUI.

## Lab Tasks
### 1. Basic CPU Simulation
- **Goal:** Simulate the provided single-cycle CPU using a specific instruction sequence in `tb_cpu.v`.
- **Output:** Generate and analyze the CPU behavior based on simulation results.

### 2. Implement SLT (Set on Less Than) Instruction
- **Goal:** Modify the ALU and control logic to support the SLT instruction.
- **Note:** Additional hardware is not required for this task.

### 3. Implement ADDI (Add Immediate) Instruction
- **Goal:** Add support for the ADDI instruction by adjusting control logic.
- **Note:** New hardware should not be added, and general I-type ALU instructions are not required.

### 4. Implement J (Jump) Instruction
- **Goal:** Modify control logic and datapath to support the J instruction as per textbook specifications.

### 5. Implement BNE (Branch Not Equal) Instruction
- **Goal:** Update the control logic and datapath to support the BNE instruction.
- **Note:** Additional hardware components may be required.

### 6. Implement LUI (Load Upper Immediate) Instruction
- **Goal:** Modify the datapath and control logic to support the LUI instruction.

### Extra Credit: I-Type ALU Instructions
- **Goal:** Extend the CPU to support additional I-type instructions (e.g., ANDI, ORI) and ensure comprehensive testing.

## References
- Patterson, D. A., & Hennessy, J. L. *Computer Organization and Design: The Hardware/Software Interface*, 5th ed., Morgan Kaufmann, 2013.
