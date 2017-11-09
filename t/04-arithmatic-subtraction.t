use Test;
use Test::Color sub { :ok("0,255,0 on_64,64,255") };

plan 6;

use Units <A s V Ω m mi ft>;
use Units::Arithmatic;

subtest {
   lives-ok {
      $_ = 1001s - 1s;
      ok .value == 1000 && .^name ~~ "Units::Second", "1001s - 1s" ;
   }, "subtraction of same si unit lives";
}, "subtraction of same si unit";

subtest {
   lives-ok {
      $_ = 4mi - 2mi;
      ok .value == 2 && .^name ~~ "Units::Mile", "4mi - 2mi";
   }, "subtraction of same non si units lives";
}, "subtraction of same non si units";

subtest {
   lives-ok {
      $_ = 4mi - 5280ft;
      ok .value == 3 && .^name ~~ "Units::Mile", "4mi - 5280ft";

      $_ = 10560ft - 1mi;
      ok .value == 5280 && .^name ~~ "Units::Foot", "10560ft - 1mi";

   }, "subtraction of related non si units lives";
}, "subtraction of related non si units";

subtest {
   lives-ok {
      $_ = 2mi - 1609.344m;
      ok .value == 1 && .^name ~~ "Units::Mile", "2mi - 1609.344m" ;

      $_ = 3218.688m - 2mi;
      ok .value == 0 && .^name ~~ "Units::Metre", "3218.688m - 2mi" ;
   }, "subtraction of related non si and si units lives";
}, "subtraction of related non si and si units";

throws-like { 2mi / 0mi }, Exception, message => /by \s zero/, "division by zero dies";
throws-like { 2m + 2A }, Exception, message => /incompatible \s units/, "incompatible add dies";

done-testing;
