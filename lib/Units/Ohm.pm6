use Units::Unit;

class Units::Ohm is Units::SIUnit
{
  has Int %.si-signature  = %( :m(2), :g(1), :s(-3), :A(-2) );
  has Str $.singular-name = "ohm";
  has Str $.symbol        = "Ω";
}
