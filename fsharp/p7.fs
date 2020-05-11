let IsPrime n : bool = 
  if n = 1 then
    false
  elif n < 4 then
    true
  elif n % 2 = 0 then
    false
  elif n < 9 then
    true
  elif n % 3 = 0 then
    false
  else
    let r = sqrt (n |> float) |> int
    let mutable f = 5
    let mutable ret = true
    while f <= r && ret = true do
      if n % f = 0 then
        ret <- false
      elif (n % (f+2)) = 0 then
        ret <- false
      f <- f + 6
    ret

[<EntryPoint>]
let main(argv) = 
  let limit = if (Array.length argv > 0) then argv.[0] |> int
              else 10001
  let mutable count = 1
  let mutable v = 1
  while count < limit do
    v <- v + 2
    if IsPrime v then
      count <- count + 1
  printfn "%i" v
  0
