#include <stdio.h>

//O(line)
// Iterate through the net list:
// Find the number of nodes (n) and voltage source (m)
// Group the components into resistor, voltage source, and current source linked list.

// O(#component)
// Create the A matrix by creating the G, B, C, D matrices
// Iterate through the linked list to stamp each components in
// Create the z vector by creating the i and e vector
// Iterate through the linked list to stamp each components in

int main() {
    //Open file
    FILE* netlist_file = fopen("../netlist.txt", "r");
    if (netlist_file == NULL) {
        perror("Error opening the file");
        return 1;
    }
    char line_text[10];

    // fgets stores a line from .txt into the line_text buffer ending with the \0
    fgets(line_text, sizeof(line_text), netlist_file);
    
    
    int i = 0;
    while (line_text[i] != '\0') {
        printf("%c", line_text[i]);
        i++;
    }
    if (line_text[8] == '\n') {
        printf("true");
    }

    fclose(netlist_file);
    //    printf("Hello World");
    return 0;
}
