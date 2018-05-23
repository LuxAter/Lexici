#!/usr/bin/perl

$limit = 4000000;
$sum = 0;
$a = 1;
$b = 1;
$c = 2;

if (scalar(@ARGV) > 0){
  $limit=$ARGV[0];
}

while($c < $limit){
  $sum += $c;
  $a = $b + $c;
  $b = $c + $a;
  $c = $a + $b;
}

printf $sum;
