let factors n =
  let rec loop i n factors =
    if i > (int_of_float (sqrt (float_of_int n))) then n :: factors
    else if (n mod i) = 0 then loop i (n / i) (i :: factors)
    else loop (i + 1) n factors in
  loop 2 n []

let () =
  let n = if Array.length Sys.argv > 1 then int_of_string (Array.get Sys.argv 1)
  else 600851475143 in
  Printf.printf "%d\n" (List.hd (factors n))
