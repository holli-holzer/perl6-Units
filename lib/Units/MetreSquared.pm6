use Units::Unit;

class Units::MetreSquared is Units::SIUnit
{
  has Int %.si-signature  = %( :m(2) );
  has Str $.singular-name = "metre-squared";
  has Str $.plural-name   = "metres-squared";
  has Str $.symbol        = "㎡";
}
