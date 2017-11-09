use Units::Unit;

class Units::MetrePerSecond is Units::SIUnit
{
  has Int %.si-signature  = %( :m(1), :s(-1) );
  has Str $.singular-name = "metre-per-second";
  has Str $.plural-name   = "metres-per-second";
  has Str $.symbol        = "㎧";
}
