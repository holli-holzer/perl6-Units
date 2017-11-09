use Test;
use Test::Color sub { :ok("0,255,0 on_64,64,255") };

use Units::Unit :helper;

plan 40;

my @nv = (
  [ .001, 1, -3 ],
  [ .02, 2, -2 ],
  [ .3, 3, -1 ],
  [ 4, 4, 0],
  [ 55, 5.5, 1],
  [666, 6.66, 2],
  [7777, 7.777, 3],
  [88888, 8.8888, 4],
  [999999, 9.99999, 5],
);

for @nv -> $nv {
  my ($v, $e) = nv( $nv[0] );
  ok $v == $nv[1], "normalize value ({$nv[0]}), value is correct ($v)";
  ok $e == $nv[2], "normalize value ({$nv[0]}), exponent is correct ($e)";
}

my @nv3 = (
  [ .001, 1, -3 ],         #nf 3 mod 0
  [ .02, 20, -3 ],         #nf = 2 mod 2
  [ .3, 0.3, 0 ],          #nf = 1 mod -1
  [ 4, 4, 0],              #nf = 0, mod 0
  [ 55, 55, 0],            #nf = 1, mod 1
  [666, 0.666, 3],         #nf = 2, mod 2
  [7777, 7.777, 3],        #nf = 3, mod 0
  [88888, 88.888, 3],      #nf = 4, mod 1
  [999999, 0.999999, 6],   #nf = 5, mod 2
  [1010101, 1.010101, 6],
  [20202020, 20.202020, 6],
);

for @nv3 -> $nv {
  my ($v, $e) = nv3( $nv[0] );
  ok $v == $nv[1], "normalize value ({$nv[0]}), value is correct ($v)";
  ok $e == $nv[2], "normalize value ({$nv[0]}), exponent is correct ($e)";
}

done-testing;
