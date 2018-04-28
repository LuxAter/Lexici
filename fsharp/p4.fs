let ReverseInt n : int =
  let mutable reversed = 0
  let mutable va = n
  while va > 0 do
    reversed <- (10 * reversed) + (va % 10)
    va <- va / 10
  reversed

let IsPalindrome n: bool =
  n = ReverseInt n

[<EntryPoint>]
let main(argv) = 
  let count = if(Array.length argv > 0) then argv.[0] |> int
              else 3
  let mutable tmp = count
  let mutable max = 0
  while tmp > 0 do
    max <- (max * 10) + 9
    tmp <- tmp - 1
  let mutable a = max
  let mutable largest = 0
  while a >= (10 * count) do
    let mutable b = 0
    let mutable db = 0
    if a % 11 = 0 then
      b <- max
      db <- 1
    else
      b <- 11 * (max / 11)
      db <- 11
    while b >= a && (a*b) > largest do
      if IsPalindrome (a*b) then
        largest <- a * b
      b <- b - db
    a <- a - 1
  printfn "%i" largest
  0
