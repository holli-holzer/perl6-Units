use Units::Unit;

module Units
{
  use Pluggable;

  register-units;

  sub register-units
  {
    say "register-units";

    for find-plugins() -> $plugin
    {
      say "registering ", $plugin.^name;
      try {
        Units::Unit.instance.UNITS.push( $plugin.new );
        CATCH { die "Cannot register unit <{ $plugin.^name }>\n$_" }
      }
    }

    say "done registering";
  }

  sub find-plugins returns UnitArray
  {
    my $plugins-namespace = '';
    my $name-matcher      = -> $a { $a ~~ "Units::Unit"|"Units::DerivedUnit"|"Units::SIUnit" ?? Any !! $a };
    #my $name-matcher      = -> $a { $a !~~ "Units::Lightyear" ?? Any !! $a };

    return
      plugins( "Units", :$plugins-namespace, :$name-matcher )
      .grep({ .HOW.^name ~~ "Perl6::Metamodel::ClassHOW" })
      .grep({ .isa(<Units::Unit>) })
      .Array;
  }

  our sub UNITS
    is export
      returns UnitArray
  {
    Units::Unit.instance.UNITS;
  }
}

sub EXPORT ( *@unit-selection ) returns Hash {
  say "EXPORT";
  return %(
    |unit-operators( @unit-selection, Units::Unit.instance.UNITS )
  );
}

sub unit-operators( StrArray $unit-selection, UnitArray $units ) returns Hash
{
  my @short-units = @$units.grep( -> $unit { $unit.symbol ∈ @$unit-selection } );
  my @long-units  = @$units.grep( -> $unit { $unit.singular-name|$unit.plural-name ∈ @$unit-selection } );

  return %(
    |short-unit-operators(@short-units),
    |long-unit-operators(@long-units)
  );
}

sub short-unit-operators( UnitArray $units ) returns Hash {
  return %( |@$units.map( -> $unit {
    |make-unit-postfix( $unit, [$unit.symbol] )
  }));
}

sub long-unit-operators( UnitArray $units ) returns Hash {
  return %( |@$units.map( -> $unit {
    |make-unit-postfix( $unit, [$unit.singular-name, $unit.plural-name] )
  }));
}

sub make-unit-postfix( Units::Unit $unit, StrArray $operator) returns Hash {
  return %( |@$operator
    .map({ "&postfix:<$_>" })
    .map({ $_ =>
      sub ($value) is looser(&prefix:<->) {
        $unit.new( :$value );
      }
    })
  );
}
