use Units::Unit;

class Units::Lightyear is Units::DerivedUnit
{
  has Cool $.si-factor     = 9_460_730_472_580_800;
  has Str  $.si-class      = "Units::Metre";
  has Str  $.singular-name = "lightyear";
  has Str  $.plural-name   = "lightyears";
  has Str  $.symbol        = "ly";
}
