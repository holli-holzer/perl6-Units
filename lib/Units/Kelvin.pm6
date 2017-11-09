use Units::Unit;

class Units::Kelvin is Units::SIUnit
{
  has Int %.si-signature  = %( :K(1) );
  has Str $.singular-name = "kelvin";
  has Str $.symbol        = "K";
}
