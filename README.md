# P12_Circuit_Simulator
 A SPICE-like circuit simulator.

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
    * EX: $
      \mathbf{v} = 
      \begin{bmatrix}
      \ v\_1 \\
      \ \vdots\\
      \ v\_n \\
      \end{bmatrix}
      $
* The $\mathbf{j}$ vector 
    * Each entry of the vector is the current flowing into the mth voltage source.
    * EX: $
      \mathbf{j} = 
      \begin{bmatrix}
      \ i\_1 \\
      \ \vdots\\
      \ i\_m \\
      \end{bmatrix}
      $
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

    