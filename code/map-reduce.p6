#!/usr/bin/env perl6

use v6;

say [+] Bool.pick xx 65536 ==> map( *.so );
say (Bool.pick xx 65536).rotor(4).map( so *.sum == 0|4 ).sum;
say <1 1 1 1 0 0 0 0 1 0 1 0>.rotor(4).map( so *.sum == 0|4 ).sum;
