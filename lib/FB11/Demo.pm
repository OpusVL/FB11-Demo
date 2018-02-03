package FB11::Demo;

use strict;
use warnings;
use FB11::Demo::Builder;

our $VERSION = '0.001';

my $builder = FB11::Demo::Builder->new(
    appname => __PACKAGE__,
    version => $VERSION,
);

$builder->bootstrap;

1;

=head1 NAME

FB11::Demo - Brand new FB11 site

=head1 DESCRIPTION

=head1 METHODS

=head1 ATTRIBUTES


=head1 LICENSE AND COPYRIGHT

Copyright 2015 OpusVL.

This software is licensed according to the "IP Assignment Schedule" provided with the development project.

=cut
