
def parse(cmd:String)(n:Int):(Int × Int) :=
  if cmd=="forward" then
    (n, 0)
  else if cmd=="down" then
    (0, n)
  else
    (0, -n)

def parseCommands(comds:List String)(pos:Int × Int) : (Int × Int) :=
  match comds with
  | [] => pos
  | h::t => 
    match String.splitOn h with
    | [cmd, num] => let (x, y) := parse cmd (String.toInt! num)
                    parseCommands t (pos.fst+x, pos.snd+y)
    | _ => panic "Split failure"


def solvePart21 (s : String) : IO String := do
    let input ← IO.FS.lines s
    let pos := parseCommands input.toList (0,0)
    return s!"{pos.fst*pos.snd}"

#eval solvePart21 "Solved/Day02/small.txt"
