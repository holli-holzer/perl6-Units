use Units::Unit;

class Units::Watt is Units::SIUnit
{
  has Int %.si-signature  = %( :m(2), :kg(1), :s(-3) );
  has Str $.singular-name = "watt";
  has Str $.symbol        = "W";
}
