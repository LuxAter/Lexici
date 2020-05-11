#!/usr/bin/perl

sub IsPrime {
  $n = int($_[0]);
  if ($n == 1){
    return 0;
  }elsif ($n < 4){
    return 1;
  }elsif ($n % 2 == 0){
    return 0;
  }elsif ($n < 9){
    return 1;
  }elsif ($n % 3 == 0){
    return 0;
  }else{
    $r = int(sqrt($n));
    $f = 5;
    while ($f <= $r){
      if ($n % $f == 0){
        return 0;
      }elsif ($n % ($f + 2) == 0){
        return 0
      }
      $f = $f + 6;
    }
  }
  return 1;
}

$limit = 10001;
if(scalar(@ARGV) > 0){
  $limit = $ARGV[0];
}
$count = 1;
$val = 1;
while($count < $limit){
  $val = $val + 2;
  if(IsPrime($val)){
    $count = $count + 1;
  }
}
printf "%d\n", $val;
