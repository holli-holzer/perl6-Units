use Units::Unit;

class Units::Henry is Units::SIUnit
{
  has Int %.si-signature  = %( :kg(1), :m(2), :A(-2), :s(-2) );
  has Str $.singular-name = "henry";
  has Str $.symbol        = "H";
}
