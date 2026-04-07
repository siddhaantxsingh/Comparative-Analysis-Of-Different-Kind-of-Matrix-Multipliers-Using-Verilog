# 🧮 Matrix Multiplier Architectures (VLSI Design)

[![Verilog](https://img.shields.io/badge/Language-Verilog-blue)]()
[![Cadence](https://img.shields.io/badge/Tools-Cadence%20Genus%20%7C%20Innovus-green)]()
[![Status](https://img.shields.io/badge/Project-Completed-brightgreen)]()

> 🚀 Comparative analysis of Serial, Parallel, and Pipelined Matrix Multipliers using Verilog HDL

---

## 📋 Project Overview

This project implements and compares three fundamental VLSI architectures for matrix multiplication:

- 🔁 Serial Architecture  
- ⚡ Parallel Architecture  
- 🚀 Pipelined Architecture  

### ✨ Highlights
- 📊 Area, Power, Timing comparison  
- ⚡ Synthesized using Cadence Genus  
- 🧱 Layout using Innovus  
- 📈 Scalable (2×2, 3×3, 4×4)

---

## 🧠 Theory

Matrix multiplication:

C[i][j] = Σ (A[i][k] × B[k][j])

- Requires N³ operations  
- Implemented differently in hardware for optimization  

---

## 🎞️ Architecture Flowcharts

### 🔁 Serial Architecture
```mermaid
flowchart LR
    A["A(i,k)"] --> M["Multiply"]
    B["B(k,j)"] --> M
    M --> ACC["Accumulator"]
    ACC --> ACC
    FSM["FSM Control"] --> ACC
    ACC --> OUT["C(i,j)"]
```

### ⚡ Parallel Architecture
```mermaid
flowchart TB
    A0["A(i,0)"] --> M0["Multiply"]
    B0["B(0,j)"] --> M0

    A1["A(i,1)"] --> M1["Multiply"]
    B1["B(1,j)"] --> M1

    A2["A(i,2)"] --> M2["Multiply"]
    B2["B(2,j)"] --> M2

    M0 --> S1["Adder"]
    M1 --> S1
    S1 --> S2["Adder"]
    M2 --> S2
    S2 --> OUT["C(i,j)"]
```

### 🚀 Pipelined Architecture
```mermaid
flowchart LR
    A["A(i,k)"] --> M["Multiply"]
    B["B(k,j)"] --> M

    M --> R["Pipeline Register"]
    R --> ADD["Adder"]
    ADD --> ACC["Accumulator"]

    ACC --> OUT["C(i,j)"]
```

---

## 🧠 Detailed Architecture Explanation

### 🔁 Serial
- Single MAC unit reused  
- FSM controls computation  
- Computes one element at a time  
- ✔ Low area  
- ❌ High latency  

### ⚡ Parallel
- All multipliers active simultaneously  
- Uses adder tree  
- ✔ Fastest  
- ❌ High area & power  

### 🚀 Pipelined
- Uses registers between stages  
- Overlaps operations  
- ✔ Balanced design  
- ✔ Improved timing  

---

## 📊 Architecture Comparison

| Parameter | Serial | Parallel | Pipelined |
|----------|--------|----------|------------|
| Multipliers | 1 | N³ | N² |
| Latency | N³ + N² | 1 | N |
| Area | Low | High | Medium |
| Power | Low | High | Medium |

---

## 🧩 Architecture Diagrams

### 🔁 Serial Architecture Diagram
![Serial Diagram](docs/serial.png)

### ⚡ Parallel Architecture Diagram
![Parallel Diagram](docs/parallel.png)

### 🚀 Pipelined Architecture Diagram
![Pipelined Diagram](docs/pipelined.png)

### 🧠 FSM Control Diagram
![FSM Diagram](docs/fsm.png)

---

## 📊 Performance Analysis

### 📈 Area Comparison Plot
![Area Plot](docs/area_plot.png)

### ⚡ Power Comparison Plot
![Power Plot](docs/power_plot.png)

### ⏱️ Timing (Slack) Plot
![Timing Plot](docs/timing_plot.png)

---

## 📊 Numerical Results

### 📐 Area

| Architecture | 2×2 | 3×3 | 4×4 |
|-------------|-----|-----|-----|
| Serial | 1780 | 3126 | 4787 |
| Pipelined | 3854 | 9024 | 16055 |
| Parallel | 3083 | 10218 | 23453 |

---

### ⚡ Power

| Architecture | 2×2 | 3×3 | 4×4 |
|-------------|-----|-----|-----|
| Serial | 418 | 769 | 1164 |
| Pipelined | 758 | 2233 | 3122 |
| Parallel | 528 | 1521 | 3119 |

---

### ⏱️ Timing

- All designs meet timing constraints  
- Best: Pipelined  
- Worst: Serial (large N)  

---

## 🛠️ Tools Used

- Verilog HDL  
- Cadence Genus  
- Cadence Innovus  
- NC Launch  

---

## 📁 Project Structure

```
matrix-multiplier-vlsi/
├── serial.v
├── parallel.v
├── pipelined.v
├── docs/
└── README.md
```

---

## 🎯 Applications

- AI accelerators  
- DSP systems  
- Image processing  
- Scientific computing  

---

## 💡 Key Insights

✔ Serial → Low resource usage  
✔ Parallel → Maximum speed  
✔ Pipelined → Best trade-off  

---

## 👨‍💻 Authors

- Siddhant Singh  
- Sai Akhilash  
- Anshika Gupta  
- Laveesh M Suvarna  

---

## ⭐ If you like this project

Give it a ⭐ on GitHub!

