let sumdivisible a max =
  let p = max / a in
  a * (p * (p + 1 )) / 2;;

let () =
  let max = if Array.length Sys.argv > 1 then (int_of_string (Array.get Sys.argv
    1)) - 1 else 999 in
  let sum = sumdivisible 3 max + sumdivisible 5 max - sumdivisible 15 max in
  Printf.printf "%d\n" sum
