use Test;
use Test::Color sub { :ok("0,255,0 on_64,64,255") };

plan 3;

use Units <A s V Ω m mi ㎡ ㎥>;
use Units::Arithmatic;

subtest {
  lives-ok {
    $_ = 12m / 2;
    ok .value == 6 && .^name ~~ "Units::Metre", "12m / 2";
    #to-do
    #$_ = 12 / 2m;
    #ok .value == 4 && .pretty-signature ~~ "s-1", "12 / 2m";
  }, "dimensionless division lives"
}, "dimensionless division";

subtest {
  lives-ok {
    $_ = 10m / 2s;
    ok .value  == 5 && .^name ~~ "Units::MetrePerSecond", "10m / 2s";
  }, "division of si units lives";
}, "division of si units";

subtest {
  lives-ok {
    $_ = 16㎥ / 2㎡;
    ok .value  == 8  && .^name ~~ "Units::Metre", "16㎥ / 2㎡";
  }, "division of same si unit lives";
}, "division of same si unit";


done-testing;
