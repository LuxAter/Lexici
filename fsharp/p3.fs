[<EntryPoint>]
let main(argv) =
  let mutable n:int64 = if Array.length argv > 0 then argv.[0] |> int64
                        else 600851475143L
  let mutable last_factor:int64 = 1L
  if n % 2L = 0L then
    last_factor <- 2L
    n <- n / 2L
    while n % 2L = 0L do
      n <- n / 2L
  let mutable factor:int64 = 3L
  let mutable max_factor:int64 = sqrt (n |> float) |> int64
  while n > 1L && factor <= max_factor do
    if n % factor = 0L then
      n <- n / factor
      last_factor <- factor
      while n % factor = 0L do
        n <- n / factor
      max_factor <- sqrt (n |> float) |> int64
    factor <- factor + 2L
  if n <> 1L then
    last_factor <- n
  printfn "%i" last_factor
  0
