let rec loop a b sum max = 
  let c = a + b in
  if c > max then sum
  else if (c mod 2) = 0 then loop b c (sum + c) max
  else loop b c sum max

let () =
  let limit = if Array.length Sys.argv > 1 then int_of_string (Array.get
  Sys.argv 1) else 4000000 in
  Printf.printf "%d\n" (loop 1 1 0 limit)
