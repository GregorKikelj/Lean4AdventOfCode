import Lake
open System Lake DSL

package solver where 
  dependencies := #[
    { name := `solution01, src := Source.path (FilePath.mk "Solved" / "Day01") }
  ]