#!/usr/bin/perl

use Test::More tests => 12;
use Test::Exception;

my $class = 'joshissexy::XML::AudioScrobbler';
BEGIN {
    use_ok('joshissexy::XML::AudioScrobbler');
}

my $i = $class->new( user => 'arnieb' );

my $tracks;
lives_ok(
    sub { $tracks = $i->recent_tracks },
    'recent_tracks() lived ok'
);

foreach my $track (@$tracks) {
    isa_ok($track, 
        'joshissexy::XML::AudioScrobbler::Track', 
        'recent_tracks() returned tracks'
    );
}
