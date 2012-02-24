
use strict;
use warnings;
use Test::More tests => 3;

# setup library path
use FindBin qw($Bin);
use lib "$Bin/lib";

# make sure testapp works
use_ok('Catalyst::Test', 'TestApp');

# a live test against TestApp, the test application
use Test::WWW::Mechanize::Catalyst 'TestApp';
my $mech = Test::WWW::Mechanize::Catalyst->new;
$mech->get_ok('http://localhost/', 'get main page');
$mech->content_like(qr/PNG/i, 'see if it has our text');
