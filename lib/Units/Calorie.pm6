 use Units::Unit;

class Units::Calorie is Units::DerivedUnit
{
  has Cool $.si-factor     = 4184;
  has Str  $.si-class      = "Units::Joule";
  has Str  $.singular-name = "calorie";
  has Str  $.plural-name   = "calories";
  has Str  $.symbol        = "cal";
}
