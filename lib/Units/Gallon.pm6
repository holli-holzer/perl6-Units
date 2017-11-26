 use Units::Unit;

class Units::Gallon is Units::DerivedUnit
{
  has Cool $.si-factor     = 3.785412;
  has Str  $.si-class      = "Units::Litre";
  has Str  $.singular-name = "gallon";
  has Str  $.plural-name   = "gallons";
  has Str  $.symbol        = "gal";

  # cw: Include methods for setting and converting to imperial gallons?
}
