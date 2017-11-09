use Test;
use Test::Color sub { :ok("0,255,0 on_64,64,255") };

plan 4;

use Units <A s V Ω m mi ㎡ ㎥>;
use Units::Arithmatic;

subtest {
  lives-ok {
    $_ = 3m * 2;
    ok .value == 6 && .^name ~~ "Units::Metre", "3m * 2";
    $_ = 2 * 2m;
    ok .value == 4 && .^name ~~ "Units::Metre", "2 * 2m";
    $_ = (2m) ** 3;
    ok .value == 8 && .^name ~~ "Units::Metre", "2m ** 3";
    $_ = 5 ** 2m;
    ok .value == 25 && .^name ~~ "Units::Metre", "5 ** 2m";
  }, "dimensionless multiplication lives"
}, "dimensionless multiplication";

subtest {
  lives-ok {
    $_ = 8A * 2Ω;
    ok .value  == 16 && .^name ~~ "Units::Volt", "8A * 2Ω";

  }, "multiplication of si units lives";
}, "multiplication of si units";

subtest {
  lives-ok {
    $_ = 4m * 4m;
    ok .value  == 16 && .^name ~~ "Units::MetreSquared", "4m * 4m";
  }, "multiplication of same si unit lives";
}, "multiplication of same si unit";

subtest {
  lives-ok {
    $_ = (2㎥) ** (4㎡);
    ok .value  == 16 && .pretty-signature ~~ "m6", "(2㎥) ** (4㎡)";
  }, "multiplication of same si unit lives";
}, "multiplication of same si unit";


done-testing;
