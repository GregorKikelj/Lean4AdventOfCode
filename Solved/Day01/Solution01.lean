



def solvePart1 (s : String) : IO String := do
    let input := IO.FS.lines s
    IO.println "Lean seems to be somewhat working right now"
    return "test"

#eval solvePart1 "Solved/Day01/small.txt"
