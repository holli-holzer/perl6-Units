 use Units::Unit;

class Units::Foot is Units::DerivedUnit
{
  has Cool $.si-factor    = 0.3048;
  has Str  $.si-class      = "Units::Metre";
  has Str  $.singular-name = "foot";
  has Str  $.plural-name   = "feet";
  has Str  $.symbol        = "ft";
}
