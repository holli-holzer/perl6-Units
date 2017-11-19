 use Units::Unit;

class Units::Year is Units::DerivedUnit
{
  has Cool $.si-factor     = 86400 * 365.25;
  has Str  $.si-class      = "Units::Second";
  has Str  $.singular-name = "year";
  has Str  $.plural-name   = "years";
  has Str  $.symbol        = "yr";
}
