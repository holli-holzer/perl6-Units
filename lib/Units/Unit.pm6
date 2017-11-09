use Singleton;

class Units::Unit
does Singleton[]
{
  subset SI    is export of Units::Unit where *.si;
  subset NonSI is export of Units::Unit where not *.si;

  # to-do: Performance
  subset StrArray
    is export
      of List
        where { $_.grep(Str).elems == $_.elems };

  # to-do: Performance
  subset UnitArray
    is export
      of List
        where { $_.grep(Units::Unit).elems == $_.elems };


  our @UNIT-PREFIXES =
    { :name<exa>,   :symbol<E>,  :exponent(18) },
    { :name<peta>,  :symbol<P>,  :exponent(15) },
    { :name<tera>,  :symbol<T>,  :exponent(12) },
    { :name<giga>,  :symbol<G>,  :exponent(9) },
    { :name<mega>,  :symbol<M>,  :exponent(6) },
    { :name<kilo>,  :symbol<k>,  :exponent(3) },
    { :name<hecto>, :symbol<h>,  :exponent(2) },
    { :name<deca>,  :symbol<da>, :exponent(1) },
    { :name<deci>,  :symbol<d>,  :exponent(−1) },
    { :name<centi>, :symbol<c>,  :exponent(−2) },
    { :name<milli>, :symbol<mi>, :exponent(−3) },
    { :name<micro>, :symbol<μ>,  :exponent(−6) },
    { :name<nano>,  :symbol<n>,  :exponent(-9) },
    { :name<pico>,  :symbol<p>,  :exponent(−12) },
    { :name<femto>, :symbol<f>,  :exponent(−15) },
    { :name<atto>,  :symbol<a>,  :exponent(−18) }
  ;

  has @.UNITS = [];
  has Bool         $.si = False;
  has Cool         $.value;
  has Str          $.symbol;
  has Str          $.singular-name;
  has Str          $.plural-name;
  has Str          $.singular-display-name;
  has Str          $.plural-display-name;
  has Int          %.si-signature;

  method display-name returns Str {
    return self.value == 1|0 ?? $.singular-display-name !! ($.plural-display-name || $.singular-display-name);
  }

  method name returns Str {
    my $singular = !self.value.defined  || self.value == 1|0;
    return $singular ?? $.singular-name !! ($.plural-name || $.singular-name);
  }

  method pretty-name returns Str {
    return self.display-name || self.name;
  }

  multi method Str returns Str {
    return self.value ~ " " ~ self.pretty-name;
  }

  multi method Str( Str $prefix ) returns Str
  {
    my $unit-prefix   = self.find-unit-prefix( $prefix );

    die "Unknown prefix" unless $unit-prefix;

    my $name          = $unit-prefix<name>;
    my $factor        = 10**$unit-prefix<exponent>;

    return "{self.value / $factor} {$name}{self.name}";
  }

  method gist returns Str
  {
    try {
      return "*e*{self.symbol||''}"
        unless self.value.defined;

      my ( $v, $e ) = nv( self.value );
      return "{$v}e{$e}{self.symbol||self.pretty-signature}";
      CATCH { die "Argh {self.^name}" }
    }

  }

  method signature returns Hash {
    return %.si-signature;
  }

  method pretty-signature {
    return %.si-signature.map({
      $_.key ~ $_.value;
    }).join("");
  }

  #my @uni-super =
  #<ᵃ ᵇ ᶜ ᵈ ᵉ ᶠ ᵍ ʰ ⁱ ʲ ᵏ ˡ ᵐ ⁿ ᵒ ᵖ  ʳ ˢ ᵗ ᵘ ᵛ ʷ ˣ ʸᶻ>

  method find-unit-prefix( $lookup ) returns Hash
  {
    return
      @UNIT-PREFIXES.first({ $_<symbol> ~~ $lookup}) ||
      @UNIT-PREFIXES.first({ $_<name> ~~ $lookup});
  }

  multi method find-unit( Str $lookup ) returns Units::Unit
  {
    my $instance = Units::Unit.instance;
 
    return
      $instance.UNITS.first({ .symbol ~~ $lookup}) ||
      $instance.UNITS.first({ .name ~~ $lookup});
  }

  multi method find-unit( Int %signature ) returns Units::Unit {
    #ay "find-unit( Int {%signature} )";
    return Units::Unit.instance.UNITS.first({ .si-signature eqv %signature });
  }

  multi method create-instance( :$value, :$si-signature ) returns Units::Unit {
    say "create-instance( :$value, :$si-signature )";
    my $unit =
      self.find-unit( %$si-signature ).new( :$value ) ||
      Units::Unit.new( :$value, :$si-signature );
      # cases where there is no distinct unit
  }

  multi method FALLBACK( $method, *@a  ) {
    #say "FALLBACK( $method )";
    return self.convert( $method )
      || die "No such method '$method' for invocant of type '{self.^name}'";
  }

  multi method convert( Str:D $to-name ) returns Units::Unit
  {
    #say "convert( $to-name )";
    my $to-unit = Units::Unit.instance.find-unit( $to-name );

    return unless $to-unit;
    return self.convert( $to-unit );
  }

  multi method convert( Units::Unit:D $to-unit ) returns Units::Unit
  {
    #say "convert to ({$to-unit.^name})";

    die "Signature mismatch"
      unless self.signature eqv $to-unit.signature;

    return conv( self, $to-unit );
  }

  multi method divide( Units::Unit:D $value )  {
    die "Attempt to divide {$value.gist} by zero using .divide or infix:</>"
      if $value.value == 0;

    return self.create-instance(
      :value( self.value / $value.value ),
      :si-signature( divide-signature( self.signature, $value.signature ) )
    );
  }

  multi method divide( Cool $value ) returns Units::Unit {
    return return self.new( :value( self.value / $value ) );
  }

  multi method multiply( Units::Unit:D $value ) returns Units::Unit {
    return self.create-instance(
      :value( self.value * $value.value ),
      :si-signature( multiply-signature( self.signature, $value.signature ) )
    );
  }

  multi method multiply( Cool $value ) returns Units::Unit {
    return return self.new( :value( self.value * $value ) );
  }

  method square returns Units::Unit {
    return self.pow(2);
  }

  multi method pow( Int:D $value ) returns Units::Unit {
    return self.new( :value( self.value ** $value ) );
  }

  multi method pow( Units::Unit:D $value ) returns Units::Unit {
    say "POW";
    return self.create-instance(
      :value( self.value ** $value.value ),
      :si-signature( pow-signature( self.signature, $value.signature ) )
    );
  }

  method greater-than( Units::Unit:D $value ) returns Bool {
    die-incompatible( self, $value )
      unless self.signature eqv $value.signature;

    return self.si-value.value > $value.si-value.value;
  }

  method smaller-than( Units::Unit:D $value ) returns Bool {
    die-incompatible( self, $value )
      unless self.signature eqv $value.signature;

    return self.si-value.value < $value.si-value.value;
  }

  method equal-to( Units::Unit:D $value ) returns Bool {
    die-incompatible( self, $value )
      unless self.signature eqv $value.signature;

    return self.si-value.value == $value.si-value.value;
  }

  sub die-incompatible ( Units::Unit:D $self, Units::Unit:D $value )  {
    die "Attempt to add incompatible units ({$self.^name} + {$value.^name})";
  }

  method sqrt returns Units::Unit {
    return self.new( :value(self.value.sqrt) );
  }

  method add( Units::Unit:D $value ) returns Units::Unit {
    die-incompatible( self, $value )
      unless self.signature eqv $value.signature;

    return x-add( self, $value );
  }

  multi sub x-add( SI $self, SI $value ) returns Units::Unit {
    return $self.new( :value( $self.value + $value.value) );
  }

  multi sub x-add( SI $self, NonSI $value ) returns Units::Unit  {
    return x-add( $self, $value.si-value );
  }

  multi sub x-add( NonSI $self, SI $value ) returns Units::Unit  {
    return $self.new( :value(
      $self.value + $value.convert($self).value
    ));
  }

  multi sub x-add( NonSI $self, NonSI $value ) returns Units::Unit {
    my $si-value = $self.si-unit.new( :value(
      $self.si-value.value + $value.si-value.value  ));

    return conv( $si-value, $self );
  }

  method negate {
    return self.new( :value($.value * -1) );
  }

  method subtract( Units::Unit:D $value ) returns Units::Unit  {
    die-incompatible( self, $value )
      unless self.signature eqv $value.signature;

    return x-add( self, $value.negate );
  }

  sub pow-signature( $sig-a, $sig-b ) is export
  {
    return my Int % =
      ( |$sig-a.keys, |$sig-b.keys )
      .unique
      .map( -> $unit { $unit => _mult( $sig-a{$unit}, $sig-b{$unit} ) })
    ;
  }

  sub divide-signature( $sig-a, $sig-b ) is export
  {
    return my Int % =
      ( |$sig-a.keys, |$sig-b.keys )
      .unique
      .map( -> $unit { $unit => _diff( $sig-a{$unit}, $sig-b{$unit} ) } )
    ;
  }

  sub multiply-signature( $sig-a, $sig-b ) is export
  {
    return my Int % =
      ( |$sig-a.keys, |$sig-b.keys )
      .unique
      .map( -> $unit { $unit => _sum( $sig-a{$unit}, $sig-b{$unit} ) })
    ;
  }

  multi sub conv( SI $from, NonSI $to )
    is export( :convert )
      returns Units::Unit
  {
    #say "convert(1) {$from.name} to {$to.name}";
    my $new-value =
      $to.si-factor ?? $from.value / $to.si-factor !!
      $to.from-si   ?? &($to.from-si)($from.value) !!
      die-cannot-convert($from.name, $to.name);

    #say "value: $new-value";
    #say "object:", $to.new( :value($new-value) );
    return $to.new( :value($new-value) );
  }

  multi sub conv( NonSI $from, SI $to )
    is export( :convert )
      returns Units::Unit
  {
      #say "convert(2) {$from.name} to {$to.name}";
      my $new-value =
        $from.si-factor ?? $from.value * $from.si-factor !!
        $from.to-si   ?? &($from.to-si)($from.value) !!
        die-cannot-convert($from.name, $to.name);

      #say "value: $new-value";

      return $to.new( :value($new-value) );
  }

  multi sub conv( NonSI $from, NonSI $to )
    is export( :convert )
      returns Units::Unit
  {
      #say "convert(3) {$from.name} to {$to.name}";
      return conv( $from.si-value, $to );
  }

  sub die-cannot-convert() {
    die "Cannot convert, don't know how. No si-factor nor from-si method.";
  }

  # normalize a number to a value 0 <= x < 10
  # return the number and the exponent
  sub nv( Cool $value ) is export( :helper )
    is export( :helper )
      returns Cool
  {
    return 0, 0 if $value == 0;
    my $exp = nexp( $value );
    return $value / 10**$exp, $exp;
  }

  # see unit-helper.t
  our sub nv3( Cool $value ) is export( :helper )
    is export( :helper )
      returns Cool
  {
    my $exp = exp3( nexp( $value ) );
    return $value / 10**$exp, $exp;
  }

  our sub nexp( Cool $value ) is export( :helper )
    is export( :helper )
      returns Int
  {
    my $log = log10($value.abs);
    return $log < 0 ?? $log.Int - 1 !! $log.Int;
  }

  our sub exp3( Int $nexp ) is export( :helper )
    is export( :helper )
      returns Int
  {
    return $nexp + (-1, 1, 0, -1, 1)[ ($nexp % 3) + 2];
  }

  sub _div( $a is copy, $b is copy ) is export  { ($a //= 0) / ($b //= 0); }
  sub _mult( $a is copy, $b is copy ) is export  { ($a //= 0) * ($b //= 0); }
  sub _sum( $a is copy, $b is copy ) is export  { ($a //= 0) + ($b //= 0); }
  sub _diff( $a is copy, $b is copy ) is export { ($a //= 0) - ($b //= 0); }

}

class Units::SIUnit is Units::Unit
{
  has Bool $.si = True;
  method si-value returns Units::SIUnit { self }
  method si-unit { self }
}

class Units::DerivedUnit is Units::Unit
{
  has Str         $.si-class;
  has Cool        $.si-factor;
  has Callable    $.to-si;
  has Callable    $.from-si;
  has Units::Unit $!_si-unit;

  method si-unit {
    return $!_si-unit ||= ::($.si-class).new.si-unit;
  }

  method signature returns Hash {
    return %.si-signature ||= ::($.si-class).new.si-signature;
  }

  method si-value {
    return self.convert( self.si-unit );
  }
}
