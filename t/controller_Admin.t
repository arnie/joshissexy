use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'joshissexy' }
BEGIN { use_ok 'joshissexy::Controller::Admin' }

ok( request('/admin')->is_success, 'Request should succeed' );


