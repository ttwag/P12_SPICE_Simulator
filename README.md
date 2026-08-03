# P12_Circuit_Simulator
 A SPICE-like circuit simulator.

For a non-reactive circuit like
```text
                I1 (1A)
          ------( -> )------
          |                |
 Node 1   |    R1 (1Ω)     |   Node 2       V2 (6V)       Node 3
   o----------/\/\/\/\/\---------o---------(-   +)----------o
   |                             |                          |
  (+)                            |                          |
  ( ) V1                        _|_ R2                     _|_ R3
  (-) (4V)                      \_/ (4Ω)                   \_/ (2Ω)
   |                             |                          |
   |                             |                          |
   +-----------------------------+--------------------------+
                                 |
                                ===  GND (Node 0)
                                 -
```

the netlist would be:

```text
NODE 3
SOURCE 2

V1 1 0 4   # positive terminal at node 1, negative terminal at node 0, and is 4V
V2 3 2 6   
R1 1 2 1   # positive terminal at node 1, negative terminal at node 2, and is 1Ω
R2 2 0 4
R3 3 0 2
I1 2 1 1   # positive terminal at node 2, negative terminal at node 1, and is 1A
```

and feeding the netlist to our solver.py (hardcoded netlist path for simplicity) yields

```
$ python solver.py
... some other output

x Vector:
[[ 4.        ]
 [ 1.14285714]
 [ 7.14285714]
 [-3.85714286]
 [-3.57142857]]
```

Therefore, 

$v_1$ = 4V: node 1 voltage is 4V

$v_2 \approx$ 1.14V: node 2 voltage is 8/7 V

$v_3 \approx$ 7.14V: node 3 voltage is 50/7 V

$i_{V1} \approx$ -3.86A: current flows from positive to negative terminal of V1 and is 27/7 A

$i_{V2} \approx$ -3.57A: current flows from positive to negative terminal of V2 and is 25/7 A

## Circuit Notation

For a circuit with n nodes and m voltage sources and k independent current source:

| Circuit Component | Symbol |
| --:|--:|
| Ground | 0 |
| Node | 1 $\to$ n |
| Nodal Voltage | v_1 $\to$ v_n |
| Independent Voltage Source | V1 $\to$ Vm |
| Current through Independent Voltage Source | i_1 $\to$ i_m|
| Independent Current Source | I1 $\to$ Ik |

## Modified Nodal Analysis (MNA)

MNA will reduce circuits that only have passive components and independent voltage or current sources into the form:

$$\mathbf{Ax} = \mathbf{z}$$

For a circuit with n nodes and m voltage sources:

### $\mathbf{A}$ matrix
* Size: $(n + m) \times (n + m)$
* Contains **4 sub-matrices**: the conductance matrix ($\mathbf{G}$), the voltage source matrices ($\mathbf{B}$ and $\mathbf{C}$), and the dependent source matrix ($\mathbf{D}$).

$$
\begin{bmatrix}
\mathbf{G} &  \mathbf{B}\\
\mathbf{C} & \mathbf{D} \\
\end{bmatrix}
$$

* The $\mathbf{G}$ matrix:
    * Size: $(n \times n)$
    * Each diagonal term is equal to the sum of the conductance of elements connected to the corresponding node. EX: The first diagonal term is the sum of conductances connected to node 1.
    * Each off-diagonal term is the negative conductance of the element connected to the pair of corresponding nodes. EX: A resistor connected to nodes 2 and 3 will go into $\mathbf{G}$ matrix position (2, 3) and (3, 2).
* The $\mathbf{B}$ matrix 
    * Size: $(n \times m)$
    * Contains only the value, -1, 0, 1.
    * If the nth node is connected to the mth voltage source's positive terminal, then the element at (n, m) is 1.
    * If the nth node is connected to the mth voltage source's negative terminal, then the element at (n, m) is -1.
    * Otherwise, the entry is 0.
    <!-- need to change the C and D matrix when considering dependent source -->
* The $\mathbf{C}$ matrix
    * $(m \times n)$
    * Transpose of the $\mathbf{B}$ matrix.
* The $\mathbf{D}$ matrix
    * $(m \times m)$
    * Contains all 0.

### $\mathbf{x}$ vector
* Size: $(n + m) \times 1$
* Contains **2 vectors**: $\mathbf{v}$ and $\mathbf{j}$

$$
\mathbf{x} = 
\begin{bmatrix}
\mathbf{v} \\
\mathbf{j} \\
\end{bmatrix}
$$

* The $\mathbf{v}$ vector
    * Each entry of the vector is the node voltage of the nth node (No entry for ground, node 0).
    * EX: 
    
$$
\mathbf{v} = 
\begin{bmatrix}
v_1 \\
\vdots\\
v_n \\
\end{bmatrix}
$$

* The $\mathbf{j}$ vector 
    * Each entry of the vector is the current flowing into the mth voltage source.
    * EX: 
    
$$
\mathbf{j} = 
\begin{bmatrix}
\ i_1 \\
\ \vdots\\
\ i_m \\
\end{bmatrix}
$$

### $\mathbf{z}$ vector:
* Size: $(n + m) \times 1$
* Contains **2 vectors**: $\mathbf{i}$ and $\mathbf{e}$

$$
\mathbf{z} = 
\begin{bmatrix}
\mathbf{i} \\
\mathbf{e} \\
\end{bmatrix}
$$

* The $\mathbf{i}$ vector
    * Size: $(n \times 1)$
    * The nth element is the sum of the current source into the nth node (Node 0 isn't included). If no current source is connected to the nth node, (n, 1) = 0.

 * The $\mathbf{e}$ vector
    * Size: $(m \times 1)$
    * The mth entry contains the value of the mth voltage source

    
