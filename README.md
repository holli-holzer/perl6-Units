NAME
====

Units 

SYNOPSIS
========

    use Units <m A Ω K ft in>;
    say 8A * 2Ω;          # Output: 8V
    say 0K.celsius.value; # Output: -273.15
    say 1ft > 1in;        # Output: True  

DESCRIPTION
===========

Implements all SI and a couple of derived and imperial Units as Operators. `Units` instances can be converted, compared and calculated with.

Please see the tests.

AUTHOR
======

    Markus "holli" Holzer

COPYRIGHT AND LICENSE
=====================

Copyright © holli.holzer@gmail.com

License GPLv3: The GNU General Public License, Version 3, 29 June 2007 <https://www.gnu.org/licenses/gpl-3.0.txt>

This is free software: you are free to change and redistribute it. There is NO WARRANTY, to the extent permitted by law.
