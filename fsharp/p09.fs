[<EntryPoint>]
let main(argv) = 
  let sum = if Array.length argv > 0 then argv.[0] |> int
            else 1000
  let mutable prod = 0
  for a in 3 .. (sum - 3) / 3 do
    for b in (a+1) .. (sum-1-a) / 2 do
      let c = sum - a - b
      if (c*c) = (a*a+b*b) then
        prod <- a*b*c
  printfn "%i" prod
  0
