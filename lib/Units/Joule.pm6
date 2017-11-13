use Units::Unit;

class Units::Joule is Units::SIUnit
{
  has Int %.si-signature  = %( :m(2), :kg(1), :s(-2) );
  has Str $.singular-name = "joule";
  has Str $.symbol        = "J";
}
