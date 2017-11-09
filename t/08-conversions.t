use Test;
use Test::Color sub { :ok("0,255,0 on_64,64,255") };
use Units <ft ly K °C °F>;

plan 6;

$_ = 1ft.in;
ok .value ~~ 12 && .^name ~~ "Units::Inch", "feet to inches";

$_ = (3.261563777167436ly).pc;
ok .value.round(0.0000000000001) == 1 && .^name ~~ "Units::Parsec", "light years to parsec";

$_ = 0K.celsius;
ok .value == -273.15 && .^name ~~ "Units::Celsius", "kelvin to celsius";

$_ = (-273.15°C).kelvin;
ok .value == 0 && .^name ~~ "Units::Kelvin", "celsius to kelvin";

$_ = 32°F.kelvin;
ok .value == 273.15 && .^name ~~ "Units::Kelvin", "fahrenheit to kelvin";

$_ = 32°F.celsius;
ok .value == 0 && .^name ~~ "Units::Celsius", "fahrenheit to celsius";

done-testing;
