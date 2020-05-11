[<EntryPoint>]
let main(argv) = 
  let limit = if (Array.length argv > 0) then argv.[0] |> int
              else 100
  let sum = limit * (limit + 1) / 2
  let sum_sq = (2 * limit + 1) * (limit + 1) * limit / 6
  let diff = (pown sum 2) - sum_sq
  printfn "%i" diff
  0
