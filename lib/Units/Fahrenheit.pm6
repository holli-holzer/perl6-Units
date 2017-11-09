use Units::Unit;

class Units::Fahrenheit is Units::DerivedUnit
{
  has Callable $.to-si            = sub ($fahrenheit) { ($fahrenheit - 32) * (5/9) + 273.15 };
  has Callable $.from-si          = sub ($kelvin)     { ($kelvin - 273.15) * (9/5) + 32 };
  has Str $.si-class              = "Units::Kelvin";
  has Str $.singular-name         = "fahrenheit";
  has Str $.singular-display-name = "°fahrenheit";
  has Str $.symbol                = "°F";
}
