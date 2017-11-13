use Units::Unit;

class Units::Siemens is Units::SIUnit
{
  has Int %.si-signature  = %( :kg(-1), :m(-2), :A(2), :s(3) );
  has Str $.singular-name = "siemens";
  has Str $.symbol        = "S";
}
