use Units::Unit;

class Units::Tesla is Units::SIUnit
{
  has Int %.si-signature  = %( :kg(1), :A(-1), :s(-2) );
  has Str $.singular-name = "Tesla";
  has Str $.symbol        = "T";
}
