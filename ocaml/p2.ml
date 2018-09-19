let rec loop a b sum limit = 
  let c= a + b in
  if c > limit then sum
  else loop (b + c) (c + a) (sum + c) limit

let () =
  let limit = if Array.length Sys.argv > 1 then int_of_string (Array.get Sys.argv 1) else 4000000 in
  Printf.printf "%d\n" (loop 1 1 0 limit)
