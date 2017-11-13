use Units::Unit;

class Units::Coulomb is Units::SIUnit
{
  has Int %.si-signature  = %( :A(1), :s(1) );
  has Str $.singular-name = "coulomb";
  has Str $.symbol        = "C";
}
