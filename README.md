# CEL-Case_study_2_23BME041
# 🚀 IoT-Enabled Dynamic Synchronization of Coupled Conveyor Systems using PINN

## 📌 Overview

This project models and analyzes the synchronization of two coupled conveyor systems in a smart manufacturing environment. The system is governed by second-order differential equations derived from Newton’s Second Law and enhanced using proportional feedback control.

A Physics-Informed Neural Network (PINN) is implemented to learn system dynamics and predict synchronization behavior.

---

## 🎯 Objectives

* Develop mathematical models for coupled conveyor systems
* Solve system dynamics using numerical methods
* Implement proportional feedback control for synchronization
* Apply PINN to predict system behavior using physics constraints

---

## ⚙️ Governing Equations

m ẍ₁ + c ẋ₁ = F₁
m ẍ₂ + c ẋ₂ = F₁ + k(x₁ − x₂)

With proportional control:

m ẍ₂ + c ẋ₂ = F₁ + (k + Kp)(x₁ − x₂)

---

## 🧠 Methodology

### 1. System Modeling

* Lumped mass-damper system
* Two conveyors coupled via stiffness term

### 2. Numerical Solution

* Solved using MATLAB ODE45 solver
* Initial mismatch introduced to test synchronization

### 3. Control Strategy

* Proportional controller minimizes position error
* Error = x₁ − x₂

### 4. PINN Implementation

* Neural network predicts x₁(t), x₂(t)
* Automatic differentiation computes derivatives
* Loss function enforces:

  * Physics constraints
  * Initial conditions

---

## 📊 Results

* Conveyor systems successfully synchronize over time
* Higher proportional gain reduces synchronization time
* PINN accurately approximates system dynamics
* Comparison with numerical solution shows close agreement

---

## 🤖 Machine Learning Insight

* PINN eliminates need for large datasets
* Learns directly from governing equations
* Suitable for real-time IoT-based prediction systems

---

## 📁 Project Structure

PINN-Conveyor-System/
│── pinn_main.m
│── modelLoss.m
│── conveyorODE.m
│── comparison_plot.m
│── README.md

---

## 🔧 Tools Used

* MATLAB
* Deep Learning Toolbox

---

## 🌐 Applications

* Smart manufacturing systems
* Automated conveyor synchronization
* Industrial IoT monitoring
* Predictive maintenance

---

## 📌 Conclusion

This project demonstrates the integration of mechanical system modeling, control systems, and machine learning. The use of PINN provides a modern approach to solving differential equations while enabling predictive capabilities in IoT-enabled environments.

---
