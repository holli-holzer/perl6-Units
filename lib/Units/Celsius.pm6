use Units::Unit;

class Units::Celsius is Units::DerivedUnit
{
  has Callable $.to-si             = sub ($celsius) { $celsius + 273.15 };
  has Callable $.from-si           = sub ($kelvin)  { $kelvin - 273.15 };
  has Str $.si-class               = "Units::Kelvin";
  has Str $.singular-name          = "celsius";
  has Str $.singular-display-name  = "°celsius";
  has Str $.symbol                 = "°C";
}
