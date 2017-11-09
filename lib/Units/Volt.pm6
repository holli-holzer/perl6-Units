use Units::Unit;

class Units::Volt is Units::SIUnit
{
  has Int %.si-signature  = %( :m(2), :g(1), :s(-3), :A(-1) );
  has Str $.singular-name = "volt";
  has Str $.symbol        = "V";
}
