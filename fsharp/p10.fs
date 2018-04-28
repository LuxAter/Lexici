[<EntryPoint>]
let main(argv) = 
  let limit = if Array.length argv > 0 then argv.[0] |> int64
              else 2000000L
  let cross_limit = sqrt (limit |> float) |> int64
  let sieve = [| for i in 1L .. limit -> false |]
  for n in 4L .. 2L .. (limit - 1L) do
    sieve.[n |> int] <- true
  for n in 3L .. 2L .. cross_limit do
    if sieve.[n |> int] = false then
      for m in (n*n) .. (2L*n) .. (limit - 1L) do
        sieve.[m |> int] <- true
  let mutable sum : int64 = 0L
  for n in 2L .. (limit - 1L) do
    if sieve.[n |> int] = false then
      sum <- sum + n
  printfn "%i" sum
  0
