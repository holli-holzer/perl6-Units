use Units::Unit;

class Units::Katal is Units::SIUnit
{
  has Int %.si-signature  = %( :mol(1), :s(-1) );
  has Str $.singular-name = "katal";
  has Str $.symbol        = "kat";
}
