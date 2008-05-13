#!/usr/bin/perl

use strict;
use warnings;

use lib '/home/joshissexy/joshissexy/lib';

use joshissexyDB;
use joshissexy::XML::AudioScrobbler;
use YAML;

my $config = YAML::LoadFile( '/home/joshissexy/joshissexy/joshissexy.yml' );
my $schema = joshissexyDB->connect(@{ $config->{connect_info} });

my $scrobbler = joshissexy::XML::AudioScrobbler->new( user => 'arnieb' );

# Get most recent track
my $rs = $schema->resultset('LastFMTracks')->search(
    undef,
    {
        select => [qw/date_listened/],
        order_by => [ 'date_listened DESC' ],
    }
)->slice(0, 0);
my $last_date = '';
if ( my $row = $rs->first ) {
    $last_date = $row->date_listened;
}

$scrobbler->last_modified( $last_date );
my $tracks = $scrobbler->recent_tracks;

if ($tracks) {
        while( my $track = pop @$tracks) {
            my $d = $track->date;
            $d->set_time_zone('local');

            if (DateTime->compare( $last_date, $d ) < 0) {
                print 'Adding "' 
                    . $track->artist->{name} . ' - '
                    . $track->name 
                    . '" to the database.' . "\n";

                $schema->resultset('LastFMTracks')->create({
                    artist          => $track->artist->{name},
                    artist_mbid     => $track->artist->{mbid},
                    name            => $track->name,
                    album           => $track->album->{name},
                    album_mbid      => $track->album->{mbid},
                    url             => $track->url,
                    date_listened   => $d,
                });
            }
        }
}
