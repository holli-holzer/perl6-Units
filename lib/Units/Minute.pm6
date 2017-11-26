 use Units::Unit;

class Units::Minute is Units::DerivedUnit
{
  has Cool $.si-factor     = 60;
  has Str  $.si-class      = "Units::Second";
  has Str  $.singular-name = "minute";
  has Str  $.plural-name   = "minutes";
  has Str  $.symbol        = "min";
}
