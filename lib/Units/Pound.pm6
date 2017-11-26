 use Units::Unit;

class Units::Pound is Units::DerivedUnit
{
  has Cool $.si-factor     = 220_400
  has Str  $.si-class      = "Units::Gram";
  has Str  $.singular-name = "pound";
  has Str  $.plural-name   = "pounds";
  has Str  $.symbol        = "lb";
}
