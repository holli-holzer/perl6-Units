use Units::Unit;

class Units::Mile is Units::DerivedUnit
{
  has Cool $.si-factor     = 1_609.344;
  has Str  $.si-class      = "Units::Metre";
  has Str  $.singular-name = "mile";
  has Str  $.plural-name   = "miles";
  has Str  $.symbol        = "mi";
}
