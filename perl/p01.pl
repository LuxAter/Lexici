#!/usr/bin/perl

sub SumDivisible {
  $p = int($_[1] / $_[0]);
  return (int($_[0] * ($p *( $p + 1 )) / 2));
}

$max = 999;

if (scalar(@ARGV) > 0){
  $max=$ARGV[0] - 1;
}

$sum = SumDivisible(3, $max) + SumDivisible(5, $max) - SumDivisible(15, $max);
printf $sum;
