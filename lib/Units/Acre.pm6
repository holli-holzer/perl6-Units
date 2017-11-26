 use Units::Unit;

class Units::Acre is Units::DerivedUnit
{
  has Cool $.si-factor     = 0.4047;
  has Str  $.si-class      = "Units::Hectare";
  has Str  $.singular-name = "acre";
  has Str  $.plural-name   = "acres";
  has Str  $.symbol        = "acre";
}
