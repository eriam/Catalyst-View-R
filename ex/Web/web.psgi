use strict;
use warnings;

use Web;

my $app = Web->apply_default_middlewares(Web->psgi_app);
$app;

