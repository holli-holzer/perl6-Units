use Test;
use Test::Color sub { :ok("0,255,0 on_64,64,255") };
use Units <A m ft in ly pc>;
use Units::Arithmatic;

plan 6;

subtest {
  lives-ok {
    ok 5A < 6A, "5A < 6A";
    ok 6A > 5A, "6A > 6A";
    ok 5A == 5A, "5A == 5A";
  }, "comparisons of same si unit lives";
}, "comparisons of same si unit";

subtest {
  lives-ok {
    ok 5ly < 6ly, "5ly < 6ly";
    ok 6ly > 5ly, "6A > 6A";
    ok 5ly == 5ly, "5A == 5A";
  }, "comparisons of same non si unit lives";
}, "comparisons of same non si unit";

subtest {
  lives-ok {
    ok 1in < 1m, "1in < 1m";
    ok 1m < 1ly, "1m < 1ly";

    ok 1ly > 1m, "1ly > 1m";
    ok 1m > 1ft, "1m > 1ft";

    #say 1ly;
    #say 1ly.m;


    #ok 1ly.m.value == 9_460_730_472_580_800, "1ly ~~ 9.4e15";
    ok 1ly.m == 9_460_730_472_580_800m, "1ly ~~ 9.4e15";
  }, "comparisons of related non si and si units lives";
}, "comparisons of related non si and si units";

subtest {
  lives-ok {
    ok 1in < 1ft, "1in < 1ft";
    ok 1ly < 1pc, "1m < 1ly";

    ok 1ft > 1in, "1ft > 1in";
    ok 1pc > 1ly, "1pc > 1ly";
    ok 12in.ft == 1ft, "12in == 1ft";
  }, "comparisons of related non si units lives";
}, "comparisons of related non si units";

throws-like { 2m <= 2A }, Exception, message => /incompatible \s units/, "2m < 2A dies";
throws-like { 2m < 2A }, Exception, message => /incompatible \s units/, "2m <= 2A dies";
throws-like { 2m > 2A }, Exception, message => /incompatible \s units/, "2m > 2A dies";
throws-like { 2m >= 2A }, Exception, message => /incompatible \s units/, "2m >= 2A dies";
throws-like { 2m == 2A }, Exception, message => /incompatible \s units/, "2m == 2A dies";


done-testing;
