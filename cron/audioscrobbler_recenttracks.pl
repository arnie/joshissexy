#!/usr/bin/perl

use strict;
use warnings;

use joshissexyDB;
use joshissexy::XML::AudioScrobbler;

my $scrobbler = joshissexy::XML::AudioScrobbler->new( user => 'arnieb' );

my $tracks = $scrobbler->recent_tracks;

while( my $track = pop @$tracks) {
    print $track->name . "\n";
}

#TODO: Finish this
