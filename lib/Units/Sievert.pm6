use Units::Unit;

class Units::Sievert is Units::SIUnit
{
  has Int %.si-signature  = %( :m(2), :s(-2) );
  has Str $.singular-name = "sievert";
  has Str $.plural-name   = "sieverts";
  has Str $.symbol        = "Sv";
}
