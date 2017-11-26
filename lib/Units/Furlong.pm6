use Units::Unit;

class Units::Furlong is Units::DerivedUnit
{
  has Cool $.si-factor     = 201.168;
  has Str  $.si-class      = "Units::Metre";
  has Str  $.singular-name = "furlong";
  has Str  $.plural-name   = "furlongs";
  has Str  $.symbol        = "fur";
}
