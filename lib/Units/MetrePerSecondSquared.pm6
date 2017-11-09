use Units::Unit;

class Units::MetrePerSecondSquared is Units::SIUnit
{
  has Int %.si-signature  = %( :m(1), :s(-2) );
  has Str $.singular-name = "metre-per-second-squared";
  has Str $.plural-name   = "metres-per-second-squared";
  has Str $.symbol        = "㎨";
}
