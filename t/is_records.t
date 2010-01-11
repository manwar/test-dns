#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 4;
use Test::DNS;

my $dns = Test::DNS->new();

# the PTR record of an IP
$dns->is_ptr( '74.125.148.13' => 's9b1.psmtp.com' );
$dns->is_ptr( '74.125.148.13' => [ 's9b1.psmtp.com' ] );

# the NS record of a domain
$dns->is_ns( 'google.com' => [ map { "ns$_.google.com" } 1 .. 4 ] );

# the A record of NS records of a domain
$dns->is_a( 'ns1.google.com' => '216.239.32.10' );
