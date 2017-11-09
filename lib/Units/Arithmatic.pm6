module Units::Arithmatic
{
  use Units::Unit;

  multi sub infix:«<»(Units::Unit $a, Units::Unit $b)
  is export
  is default
  returns Bool { $a.smaller-than($b) }

  multi sub infix:«>»(Units::Unit $a, Units::Unit $b)
  is export
  returns Bool { $a.greater-than($b) }

  multi sub infix:«<=»(Units::Unit $a, Units::Unit $b)
  is export
  is default
  returns Bool { $a.smaller-than($b) || $a.equal-to($b) }

  multi sub infix:«>=»(Units::Unit $a, Units::Unit $b)
  is export
  returns Bool { $a.greater-than($b) || || $a.equal-to($b) }

  multi sub infix:<==>(Units::Unit $a, Units::Unit $b)
  is export
  returns Bool { $a.equal-to($b) }

  multi sub infix:<!=>(Units::Unit $a, Units::Unit $b)
  is export
  returns Bool { !( $a eqv $b ) }

  multi sub infix:<*>(Units::Unit $a, Units::Unit $b)
  is export
  returns Units::Unit { $a.multiply($b) }

  multi sub infix:<*>(Units::Unit $a, Cool $b)
  is export
  returns Units::Unit { $a.multiply($b) }

  multi sub infix:<*>(Cool $a, Units::Unit $b)
  is export
  returns Units::Unit { $b.multiply($a) }

  multi sub infix:</>(Units::Unit $a, Units::Unit $b)
  is export
  returns Units::Unit { $a.divide($b) }

  multi sub infix:</>(Cool $a, Units::Unit $b)
  is export
  returns Units::Unit { die "nyi" }

  multi sub infix:</>(Units::Unit $a, Cool $b)
  is export
  returns Units::Unit { $a.divide($b) }

  multi sub infix:<+>(Units::Unit $a, Units::Unit $b)
  is export
  returns Units::Unit { $a.add($b) }

  multi sub infix:<->(Units::Unit $a, Units::Unit $b)
  is export
  returns Units::Unit { $a.subtract($b) }

  multi sub infix:<**>(Units::Unit $a, Units::Unit $b)
  is export
  returns Units::Unit { $a.pow($b) }

  multi sub infix:<**>(Units::Unit $a, Cool $b)
  is export
  returns Units::Unit { $a.pow($b) }

  multi sub infix:<**>(Cool $a, Units::Unit $b)
  is export
  returns Units::Unit { $b.new( :value($a) ).pow( $b.value ) }
}
