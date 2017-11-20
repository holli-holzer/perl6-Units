use Units::Unit;

class Units::Litre is Units::SIUnit
{
  has Cool $.si-factor     = 0.001;
  has Int %.si-signature  = %( :m(3) );
  has Str $.singular-name = "litre";
  has Str $.plural-name   = "litres";
  has Str $.symbol        = "L";
}
