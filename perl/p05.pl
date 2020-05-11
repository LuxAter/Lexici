#!/usr/bin/perl

$k = 20;
if (scalar(@ARGV) > 0){
  $k = $ARGV[0];
}
$multiple = 1;
$i = 0;
$check = 1;
$limit = sqrt($k);
@p = (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229 );
while ($p[$i] <= $k){
  $a = 1;
  if($check == 1){
    if($p[$i] <= $limit){
      $a = int(log($k) / log($p[$i]));
    }else{
      $check = 0;
    }
  }
  $multiple = $multiple * (($p[$i]) ** $a);
  $i = $i + 1;
}
printf "%d\n", $multiple;
