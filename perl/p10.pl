#!/usr/bin/perl

$limit = 2000000;
if(scalar($ARGV) > 0){
  $limit = $ARGV[0];
}
$cross_limit = int(sqrt($limit));
@sieve = ();
for($n = 4; $n < $limit; $n += 2){
  $sieve[$n] = 1;
}
for($n = 3; $n <= $cross_limit; $n += 2){
  if ($sieve[$n] == 0){
    for($m = $n * $n; $m < $limit; $m += (2 * $n)){
      $sieve[$m] = 1;
    }
  }
}
$sum = 0;
for($n = 2; $n < $limit; $n++){
  if($sieve[$n] == 0){
    $sum += $n;
  }
}
printf "%llu\n", $sum;
