use Units::Unit;

class Units::Pascal is Units::SIUnit
{
  has Int %.si-signature  = %( :m(-1), :kg(1), :s(-2) );
  has Str $.singular-name = "pascal";
  has Str $.symbol        = "pa";
}
