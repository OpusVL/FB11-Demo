#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

use Catalyst::Test 'FB11::Demo';

FB11::Demo->model('FB11AuthDB')->schema->deploy({add_drop_table => 1});

ok( request('/login')->is_success, 'Request should succeed' );

done_testing();
