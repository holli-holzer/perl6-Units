use Units::Unit;

class Units::Hectare is Units::SIUnit
{
  has Cool $.si-factor    = 10_000;
  has Int %.si-signature  = %( :m(2) );
  has Str $.singular-name = "hectare";
  has Str $.symbol        = "ha";
}
