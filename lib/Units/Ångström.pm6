use Units::Unit;

class Units::Ångström is Units::DerivedUnit
{
  has Cool $.si-factor     = 10**-10;
  has Str  $.si-class      = "Units::Metre";
  has Str  $.singular-name = "ångström";
  has Str  $.symbol        = "Å";
}
