use Units::Unit;

class Units::Hertz is Units::SIUnit
{
  has Int %.si-signature  = %( :s(-1) );
  has Str $.singular-name = "hertz";
  has Str $.symbol        = "Hz";
}
