use Units::Unit;

class Units::MetreCubed is Units::SIUnit
{
  has Int %.si-signature  = %( :m(3) );
  has Str $.singular-name = "metre-cubed";
  has Str $.plural-name   = "metres-cubed";
  has Str $.symbol        = "㎥"; #㎡
}
