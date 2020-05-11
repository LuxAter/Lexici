let SumDivisible n max : int =
  let p = max / n
  n * (p * (p + 1)) / 2

[<EntryPoint>]
let main(argv) =
  let max = if (Array.length argv > 0) then argv.[0] |> int
            else 999
  let sum = SumDivisible 3 max + SumDivisible 5 max - SumDivisible 15 max
  printfn "%i" sum
  0
