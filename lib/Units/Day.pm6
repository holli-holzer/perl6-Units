 use Units::Unit;

class Units::Day is Units::DerivedUnit
{
  has Cool $.si-factor     = 86400;
  has Str  $.si-class      = "Units::Second";
  has Str  $.singular-name = "day";
  has Str  $.plural-name   = "days";
  has Str  $.symbol        = "day";
}
