use Units::Unit;

class Units::Newton is Units::SIUnit
{
  has Int %.si-signature  = %( :m(1), :kg(1), :s(-2) );
  has Str $.singular-name = "newton";
  has Str $.symbol        = "N";
}
