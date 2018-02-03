use strict;
use warnings;

use FB11::Demo;

my $app = FB11::Demo->apply_default_middlewares(FB11::Demo->psgi_app);
$app;


# PODNAME: fb11_demo.psgi
# ABSTRACT: PSGI runs FB11::Demo app
