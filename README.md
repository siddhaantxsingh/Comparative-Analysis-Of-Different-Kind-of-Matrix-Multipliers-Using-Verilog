# Comparative-Analysis-Of-Different-Kind-of-Matrix-Multipliers-Using-Verilog
To design, implement, and comparatively analyze three distinct hardware architectures — Serial, Parallel, and Pipelined — for NxN square matrix multiplication using Verilog.matrix sizes (2×2, 3×3, and 4×4) to study the trade-offs between area, power consumption, and timing performance across different architectural approaches.
# 🧮 Matrix Multiplier Architectures (VLSI Design)

[![Verilog](https://img.shields.io/badge/Language-Verilog-blue)]()
[![Cadence](https://img.shields.io/badge/Tools-Cadence%20Genus%20%7C%20Innovus-green)]()
[![License](https://img.shields.io/badge/License-Academic-orange)]()

> 🚀 High-performance hardware implementations of matrix multiplication using Serial, Parallel, and Pipelined architectures

---

## 📋 Project Overview

This project implements and compares three fundamental VLSI architectures for matrix multiplication using **Verilog HDL**.

### ✨ Highlights
- 🔁 Three architectures implemented from scratch
- 📊 Full comparison: Area, Power, Timing
- ⚡ Synthesized using Cadence Genus
- 🧱 Physical layouts using Innovus
- 📈 Scalable design (2×2, 3×3, 4×4)

---

## 🧠 Problem Statement

Matrix multiplication is a core operation in:
- AI accelerators 🤖
- DSP systems 📡
- Graphics & vision 🎥

The challenge is optimizing:
> ⚖️ **Speed vs Area vs Power**

---

## 🎞️ Animated Architecture (Mermaid)

### 🔁 Serial (FSM + MAC)
```mermaid
flowchart LR
    A[A[i][k]] --> M((×))
    B[B[k][j]] --> M
    M --> ACC[Accumulator]
    ACC -->|feedback| ACC
    FSM[[FSM Controller]] --> ACC
    ACC --> C[C[i][j]]
```

### ⚡ Parallel (Fully Combinational)
```mermaid
flowchart TB
    subgraph Row i
      A0[A[i][0]] --> M0((×))
      B0[B[0][j]] --> M0
      A1[A[i][1]] --> M1((×))
      B1[B[1][j]] --> M1
      A2[A[i][2]] --> M2((×))
      B2[B[2][j]] --> M2
    end
    M0 --> S1((+))
    M1 --> S1
    S1 --> S2((+))
    M2 --> S2
    S2 --> C[C[i][j]]
```

### 🚀 Pipelined (k-stage)
```mermaid
flowchart LR
    A[A[i][k]] --> M((×))
    B[B[k][j]] --> M
    M --> R1[Reg mul_reg]
    R1 --> ADD((+))
    ADD --> ACC[acc]
    ACC -->|k_reg==0 reset/else accumulate| ACC
    ACC -->|k_reg==N-1| C[C[i][j]]
```

---

Matrix multiplication is a core operation in:
- AI accelerators 🤖
- DSP systems 📡
- Graphics & vision 🎥

The challenge is optimizing:
> ⚖️ **Speed vs Area vs Power**

---

## 🏗️ Architectures Implemented

### 🔁 Serial Architecture
- Single MAC unit
- FSM-controlled
- 🟢 Lowest area & power
- 🔴 Highest latency

### ⚡ Parallel Architecture
- N³ multipliers
- Fully combinational
- 🟢 Fastest (1 cycle)
- 🔴 Highest area & power

### 🚀 Pipelined Architecture
- N² multipliers
- Staged computation
- 🟢 Best trade-off design

---

## 📊 Architecture Comparison

| Metric | Serial | Parallel | Pipelined |
|------|--------|----------|------------|
| Multipliers | 1 | N³ | N² |
| Latency | N³ + N² | 1 | N |
| Area | 🟢 Low | 🔴 High | 🟡 Medium |
| Power | 🟢 Low | 🔴 High | 🟡 Medium |

---

## 🧩 Architecture Diagrams

### ⚡ Parallel Architecture
![Parallel Architecture](docs/parallel.png)

---

### 🚀 Pipelined Architecture
![Pipelined Architecture](docs/pipelined.png)

---

### 🔁 Serial Architecture (Datapath)
![Serial Architecture](docs/serial.png)

---

### 🧠 FSM Control (Serial)
![FSM](docs/fsm.png)

---

## 📊 Results

### 📈 Performance Plots (add images)

> Save these generated plots in `docs/` to visualize trends.

- Area vs Matrix Size → `docs/area_plot.png`
- Power vs Matrix Size → `docs/power_plot.png`
- Slack vs Matrix Size → `docs/timing_plot.png`

```md
![Area Plot](docs/area_plot.png)
![Power Plot](docs/power_plot.png)
![Timing Plot](docs/timing_plot.png)
```

---

### 📐 Area (Library Units)

### 📐 Area (Library Units)
| Architecture | 2×2 | 3×3 | 4×4 |
|-------------|-----|-----|-----|
| Serial | 1780 | 3126 | 4787 |
| Pipelined | 3854 | 9024 | 16055 |
| Parallel | 3083 | 10218 | 23453 |

### ⚡ Power (µW)
| Architecture | 2×2 | 3×3 | 4×4 |
|-------------|-----|-----|-----|
| Serial | 418 | 769 | 1164 |
| Pipelined | 758 | 2233 | 3122 |
| Parallel | 528 | 1521 | 3119 |

### ⏱️ Timing
- ✅ All designs meet timing
- 🥇 Best: Pipelined
- ⚠️ Tightest: Serial (large N)

---

## 🛠️ Tech Stack

| Category | Tools |
|--------|------|
| HDL | Verilog |
| Simulation | Cadence NC Launch |
| Synthesis | Cadence Genus |
| Physical Design | Cadence Innovus |

---

## 🚀 How to Run

### Simulation
```bash
ncvlog *.v
ncsim testbench
```

### Synthesis
- Import RTL into **Cadence Genus**
- Apply constraints
- Generate reports

---

## 📁 Project Structure

```
matrix-multiplier-vlsi/
├── serial.v
├── parallel.v
├── pipelined.v
├── testbench/
├── docs/
├── reports/
└── README.md
```

---

## 📸 How to Extract Images (IMPORTANT)

From your report PDF:

1. Open PDF
2. Right-click on diagram → Save image
3. Save inside `docs/`

### Required Images:
- parallel.png
- pipelined.png
- serial.png
- fsm.png
- waveform.png
- layout.png

---

## 🎯 Applications

- AI hardware accelerators
- Signal processing systems
- Image processing pipelines
- Scientific computing

---

## 💡 Key Insights

✔ Serial → Efficient but slow  
✔ Parallel → Fast but expensive  
✔ Pipelined → Best balance  

---

## 👨‍💻 Authors

- Siddhant Singh
- Sai Akhilash
- Anshika Gupta
- Laveesh M Suvarna

---

## ⭐ If you like this project

Give it a star ⭐ and use it in your VLSI portfolio 🚀

