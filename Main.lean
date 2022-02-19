import Solution01
import Solution02

def main : IO Unit := do
  let s1 <- solvePart11 "Solved/Day01/input.txt"
  IO.println s1;
  let s2 <- solvePart12 "Solved/Day01/input.txt"
  IO.println s2;

-- #eval main