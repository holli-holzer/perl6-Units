use Units::Unit;

class Units::Hectare is Units::DerivedUnit
{
  has Cool $.si-factor     = 10_000;
  has Str  $.si-class      = "Units::MetreSquared";
  has Str $.singular-name  = "hectare";
  has Str $.plural-name    = "hectares";
  has Str $.symbol         = "ha";
}
