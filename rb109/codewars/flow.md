# Algorithm

find the minimum substring in the string

- for each char, add it to a new variable unless it encounters a letter with the same value as first char in substring
- if it encounters a letter with the same value as first char in substring (and then second and on until the length is done)
- add these values to a new variable
- if var1 == var2
  - add +1 to k

```mermaid

flowchart TB
  node_1["k = 0"]
  node_2["t = #39;#39;"]
  node_3["new_node"]
  node_1 --> node_2
  node_2 --> node_3

```
