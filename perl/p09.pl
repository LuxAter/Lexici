#!/usr/bin/perl

$sum = 1000;
if (scalar($ARGV) > 0){
  $sum = $ARGV[0];
}
$prod = 0;

for($a = 3; $a < ($sum - 3) / 3 && $prod == 0; $a++){
  for($b = ($a + 1); $b < ($sum - 1 - $a) && $prod == 0; $b++){
    $c = $sum-$a-$b;
    if($c*$c==$a*$a+$b*$b){
      $prod = $a*$b*$c;
    }
  }
}
printf "%d\n", $prod;
