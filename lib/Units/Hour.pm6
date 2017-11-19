 use Units::Unit;

class Units::Hour is Units::DerivedUnit
{
  has Cool $.si-factor     = 3600;
  has Str  $.si-class      = "Units::Second";
  has Str  $.singular-name = "hour";
  has Str  $.plural-name   = "hours";
  has Str  $.symbol        = "hr";
}
