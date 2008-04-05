#!/usr/bin/perl

use strict;
use warnings;

use joshissexy;
use Data::Dumper;

my $schema = joshissexyDB->connect(@{ joshissexy->config->{connect_info} });

my $t = joshissexy::XML::xkcd->new;
my $url = $t->get_latest_image_url();

my $rs = $schema->resultset('FrontpageImages')->search(
    undef,
    {
        select   => [qw/ url /],
        order_by => [ 'create_date DESC' ],
    }
)->slice(0, 0);

my $old_url = '';
if ( my $row = $rs->first ) {
    $old_url = $row->url;
}

if ($old_url ne $url) {
    $schema->resultset("FrontpageImages")->create({ 
        url => $url 
    });
}
