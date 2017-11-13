 use Units::Unit;

class Units::Yard is Units::DerivedUnit
{
  has Cool $.si-factor    = 0.9144;
  has Str  $.si-class      = "Units::Metre";
  has Str  $.singular-name = "yard";
  has Str  $.plural-name   = "yards";
  has Str  $.symbol        = "yd";
}
