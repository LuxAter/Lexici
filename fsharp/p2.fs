[<EntryPoint>]
let main(argv) = 
  let limit = if Array.length argv > 0 then argv.[0] |> int
              else 4000000
  let mutable sum = 0
  let mutable a = 1
  let mutable b = 1
  let mutable c = 2
  while c < limit do
    sum <- sum + c
    a <- b + c
    b <- c + a
    c <- a + b
  printfn "%i" sum
  0
