#!/usr/bin/perl

sub ReverseInteger {
  $val = int($_[0]);
  $reversed = 0;
  while ($val > 0){
    $reversed = ($reversed * 10) + ($val % 10);
    $val = int($val / 10);
  }
  return $reversed;
}

sub IsPalindrome {
  return $_[0] == ReverseInteger($_[0]);
}

$count = 3;
if (scalar(@ARGV) > 0){
  $count=$ARGV[0];
}
$tmp = $count;
$max=0;
while($tmp > 0){
  $max = ($max * 10) + 9;
  $tmp -= 1;
}
$a = $max;
$largest = 0;
while($a >= (10 * $count)){
  $b = 0;
  $db = 0;
  if($a % 11 == 0){
    $b = $max;
    $db = 1;
  }else{
    $b = 11 * ($max / 11);
    $db  = 11;
  }
  while($b >= $a){
    if($a * $b <= $largest){
      break;
    }elsif(IsPalindrome($a * $b)){
      $largest = $a * $b;
    } 
    $b -= $db;
  }
  $a -= 1;
}

printf $largest;
