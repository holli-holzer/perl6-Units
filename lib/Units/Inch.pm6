use Units::Unit;

class Units::Inch is Units::DerivedUnit
{
  has Cool $.si-factor    = 0.0254;
  has Str  $.si-class      = "Units::Metre";
  has Str  $.singular-name = "inch";
  has Str  $.plural-name   = "inches";
  has Str  $.symbol        = "in";
}
