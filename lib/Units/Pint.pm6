 use Units::Unit;

class Units::Pint is Units::DerivedUnit
{
  has Cool $.si-factor     = 2.11338;          # US Pint
  has Str  $.si-class      = "Units::Litre";
  has Str  $.singular-name = "pint";
  has Str  $.plural-name   = "pints";
  has Str  $.symbol        = "pt";
}
