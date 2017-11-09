use Units::Unit;

class Units::Metre is Units::SIUnit
{
  has Int %.si-signature  = %( :m(1) );
  has Str $.singular-name = "metre";
  has Str $.plural-name   = "metres";
  has Str $.symbol        = "m";
}
