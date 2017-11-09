use Test;
use Test::Color sub { :ok("0,255,0 on_64,64,255") };

plan 6;

use Units <A s V Ω m mi ft>;
use Units::Arithmatic;

subtest {
   lives-ok {
      $_ = 999s + 1s;
      ok .value == 1000 && .^name ~~ "Units::Second", "999s + 1s" ;
   }, "addition of same si unit lives";
}, "addition of same si unit";

subtest {
   lives-ok {
      $_ = 2mi + 3mi;
      ok .value == 5 && .^name ~~ "Units::Mile", "2mi + 3mi";
   }, "addition of same non si units lives";
}, "addition of same non si units";

subtest {
   lives-ok {
      $_ = 4mi + 5280ft;
      ok .value == 5 && .^name ~~ "Units::Mile", "4mi + 5280ft";
      $_ = 5280ft + 4mi;
      ok .value == 26400 && .^name ~~ "Units::Foot", "5280ft + 4mi";
   }, "addition of related non si units lives";
}, "addition of related non si units";


subtest {
   lives-ok {
      $_ = 2mi + 1609.344m;
      ok .value == 3 && .^name ~~ "Units::Mile", "2mi + 1609.344m" ;
      $_ = 1609.344m + 2mi;
      ok .value == 4828.032 && .^name ~~ "Units::Metre", "1609.344m + 2mi" ;
   }, "addition of related and si units lives";
}, "addition of related and si units";


throws-like { 2mi / 0mi }, Exception, message => /by \s zero/, "division by zero dies";
throws-like { 2m + 2A }, Exception, message => /incompatible \s units/, "incompatible add dies";

done-testing;
