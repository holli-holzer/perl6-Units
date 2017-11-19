 use Units::Unit;

class Units::Atmosphere is Units::DerivedUnit
{
  has Cool $.si-factor     = 1013 * 10e5;
  has Str  $.si-class      = "Units::Pascal";
  has Str  $.singular-name = "atmosphere";
  has Str  $.plural-name   = "atmospheres";
  has Str  $.symbol        = "atm";
}
