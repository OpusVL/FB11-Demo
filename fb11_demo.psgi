use strict;
use warnings;

use FB11::Demo;

my $app = FB11::Demo->apply_default_middlewares(FB11::Demo->psgi_app);
$app;

