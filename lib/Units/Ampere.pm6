use Units::Unit;

class Units::Ampere is Units::SIUnit
{
  has Int %.si-signature  = %( :A(1) );
  has Str $.singular-name = "ampere";
  has Str $.symbol        = "A";
}
