use Units::Unit;

class Units::Parsec is Units::DerivedUnit
{
  has Cool $.si-factor     = 30_856_775_814_913_700;
  has Str  $.si-class      = "Units::Metre";
  has Str  $.singular-name = "parsec";
  has Str  $.symbol        = "pc";
}
