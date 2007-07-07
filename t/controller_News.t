use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'joshissexy' }
BEGIN { use_ok 'joshissexy::Controller::News' }

ok( request('/news')->is_success, 'Request should succeed' );


