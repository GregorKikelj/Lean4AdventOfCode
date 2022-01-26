import Lake
open System Lake DSL

package grekiki where 
  dependencies := #[
    { name := `a, src := Source.path (FilePath.mk "solved" / "day01") }
  ]
