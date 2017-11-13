use Units::Unit;

class Units::Siemen is Units::SIUnit
{
  has Int %.si-signature  = %( :kg(-1), :m(-2), :A(2), :s(3) );
  has Str $.singular-name = "siemen";
  has Str $.symbol        = "S";
}
