use Units::Unit;

class Units::Mole is Units::SIUnit
{
  has Int %.si-signature  = %( :mol(1) );
  has Str $.singular-name = "mole";
  has Str $.plural-name   = "moles";
  has Str $.symbol        = "mol";
}
