
import numpy as np
# note:
# number of node and voltage source are provided at the beginning of the net list file
# first node of voltage source in net list is the positive terminal
# current source flows into the first node in the net list
# array index = node index - 1
# n = row, m = col

def fill_array(A_matrix, z_vector, line, n, m):
    component = line[0][0]
    component_num = int(line[0][1:]) - 1
    node_A = int(line[1]) - 1 #correct index
    node_B = int(line[2]) - 1 
    match component:
        case 'V':
            voltage = int(line[3])
            # e vector
            z_vector[n + component_num] = voltage
            # B and C matrix
            if node_A >= 0:
                A_matrix[node_A][n + component_num] = 1
                A_matrix[n + component_num][node_A] = 1
            if node_B >= 0:
                A_matrix[node_B][n + component_num] = -1
                A_matrix[n + component_num][node_B] = -1
        case 'I':
            # i vector
            current = int(line[3])
            if node_A >= 0:
                z_vector[node_A] += current
            if node_B >= 0:
                z_vector[node_B] -= current
        case 'R':
            conductance = 1/int(line[3])
            # G matrix
            if node_A >= 0:
                A_matrix[node_A][node_A] += conductance
            if node_B >= 0:
                A_matrix[node_B][node_B] += conductance
            if node_A >= 0 and node_B >= 0:
                A_matrix[node_A][node_B] -= conductance
                A_matrix[node_B][node_A] -= conductance
        case _:
            print("Error")

with open("netlist.txt", "r") as file:
    lines = file.readlines()
    n = int(lines[0][5])
    m = int(lines[1][7])

    A_matrix = np.zeros(shape=(n + m, n + m), dtype=float)
    z_vector = np.zeros(shape=(n + m, 1))
    
    for line_num in range(3, len(lines)):
        processed_line = lines[line_num].split()
        print(processed_line)
        fill_array(A_matrix, z_vector, processed_line, n, m)
    print(A_matrix)
    print(z_vector)

    print(np.linalg.solve(A_matrix, z_vector))
    