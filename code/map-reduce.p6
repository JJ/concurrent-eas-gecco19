#!/usr/bin/env perl6

say [+] Bool.pick xx 65536 ==> map( *.so );
say (Bool.pick xx 65536).rotor(4).map( ! (0 < *.sum < 4) ).sum;
say <1 1 1 1 0 0 0 0 1 0 1 0>.rotor(4).map( ! (0 < *.sum < 4) ).sum;

