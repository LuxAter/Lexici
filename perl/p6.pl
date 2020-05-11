#!/usr/bin/perl

$limit = 100;
if (scalar(@ARGV) > 0){
  $limit = $ARGV[0];
}
$sum = $limit * ($limit + 1) / 2;
$sum_sq = (2 * $limit + 1) * ($limit + 1) * $limit / 6;
$diff = ($sum ** 2) - $sum_sq;
printf "%d\n", $diff;
