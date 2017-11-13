use Units::Unit;

class Units::Candela is Units::SIUnit
{
  has Int %.si-signature  = %( :cd(1) );
  has Str $.singular-name = "candela";
  has Str $.symbol        = "cd";
}
