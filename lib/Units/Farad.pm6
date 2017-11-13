use Units::Unit;

class Units::Siemen is Units::SIUnit
{
  has Int %.si-signature  = %( :kg(-1), :m(-2), :A(2), :s(4) );
  has Str $.singular-name = "farad";
  has Str $.symbol        = "F";
}
