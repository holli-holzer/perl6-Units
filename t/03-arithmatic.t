use Test;
use Test::Color sub { :ok("0,255,0 on_64,64,255") };

plan 2;

use Units <m>;
use Units::Arithmatic;

ok (1m).negate.value == -1;
ok (-1m).value == -1;

done-testing;
