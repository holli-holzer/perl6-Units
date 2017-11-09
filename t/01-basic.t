use v6;

use Test;

plan 3;

lives-ok {
  use Units <m>;
  ok @Units::UNITS.elems > 0;
  ok (0m).defined;
}

done-testing;
