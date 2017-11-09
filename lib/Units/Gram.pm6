use Units::Unit;

class Units::Gram is Units::SIUnit
{
  has Int %.si-signature  = %( :g(1) );
  has Str $.singular-name = "gram";
  has Str $.plural-name   = "grams";
  has Str $.symbol        = "g";
}
