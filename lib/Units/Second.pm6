use Units::Unit;

class Units::Second is Units::SIUnit
{
  has Int %.si-signature  = %( :s(1) );
  has Str $.singular-name = "second";
  has Str $.plural-name   = "seconds";
  has Str $.symbol        = "s";
}
