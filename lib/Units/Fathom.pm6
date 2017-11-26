use Units::Unit;

class Units::Fathom is Units::DerivedUnit
{
  has Cool $.si-factor     = 1.853184;
  has Str  $.si-class      = "Units::Metre";
  has Str  $.singular-name = "fathom";
  has Str  $.plural-name   = "fathoms";
  has Str  $.symbol        = "ftm";
}
