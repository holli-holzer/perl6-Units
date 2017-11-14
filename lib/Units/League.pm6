use Units::Unit;

class Units::League is Units::DerivedUnit
{
  has Cool $.si-factor     = 4_828.032;
  has Str  $.si-class      = "Units::Metre";
  has Str  $.singular-name = "league";
  has Str  $.plural-name   = "leagues";
  has Str  $.symbol        = "lea";
}
