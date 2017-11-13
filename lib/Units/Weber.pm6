use Units::Unit;

class Units::Weber is Units::SIUnit
{
  has Int %.si-signature  = %( :kg(1), :m(2), :A(-1), :s(-2) );
  has Str $.singular-name = "weber";
  has Str $.symbol        = "Wb";
}
