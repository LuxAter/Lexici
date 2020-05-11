[<EntryPoint>]
let main(argv) = 
  let k = if Array.length argv > 0 then argv.[0] |> int
          else 20
  let mutable multiple = 1
  let mutable i = 0
  let mutable check = true
  let limit = sqrt(k |> float) |> int
  let p = [| 2; 3; 5; 7; 11; 13; 17; 19; 23; 29; 31; 37; 41; 43; 47; 53; 59; 61; 67; 71; 73; 79; 83; 89; 97; 101; 103; 107; 109; 113; 127; 131; 137; 139; 149; 151; 157; 163; 167; 173; 179; 181; 191; 193; 197; 199; 211; 223; 227; 229 |]
  while p.[i] <= k do
    let mutable a = 1
    if check then
      if p.[i] <= limit then
        a <- (log (k |> float) / log (p.[i] |> float)) |> int
      else
        check <- false
    multiple <- multiple * (pown p.[i] a)
    i <- i + 1
  printfn "%i" multiple
  0
