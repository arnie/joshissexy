package joshissexy::XML::AudioScrobbler;

use strict;
use warnings;
use LWP::UserAgent;
use XML::XPath;
use XML::Simple;
use Data::Dumper;
use joshissexy::XML::AudioScrobbler::Track;
use DateTime;
use DateTime::Format::HTTP;

sub new {
    my ($class, %opt) = @_;

    my $opt = {
        user => $opt{user}
    };
    return bless $opt, $class;
}

sub last_modified {
    my ($self, $last_modified) = @_;
    $self->{last_modified} = $last_modified if $last_modified;
    return $self->{last_modified};
}

sub recent_tracks {
    my ($self) = @_;

    my $url = 'http://ws.audioscrobbler.com/1.0/user/' 
        . $self->{user} . '/recenttracks.xml';

    my %headers;

    if ($self->last_modified) {
        my $class = 'DateTime::Format::HTTP';
        my $date = $class->format_datetime( $self->last_modified );
        $headers{'If-Modified-Since'} = $date;
    }

    my $ua = LWP::UserAgent->new;
    my $res = $ua->get( $url, %headers );

    if ($res->code == 304) {
        die "No changes dude\n";
    }

    if (! $res->is_success) {
        die "Couldn't get feed: " . $res->status_line;
    }

    my $data = XML::XPath->new( xml => $res->content );
    my $tracks = $data->find('/recenttracks/track');

    my @ret_tracks;
    foreach my $context ($tracks->get_nodelist) {
        my $track = joshissexy::XML::AudioScrobbler::Track->new;

        my $streamable = $context->getAttribute('streamable');
        $track->streamable( $streamable eq 'true' ? 1 : 0 );

        my $artist = $data->findnodes('./artist', $context)->[0];
        $track->artist({
            name => $artist->string_value,
            mbid => $artist->getAttribute( 'mbid' )
        });

        my $name = $data->findvalue('./name', $context);
        $track->name($name);

        my $album = $data->findnodes('./album', $context)->[0];
        $track->album({
            name => $artist->string_value,
            mbid => $artist->getAttribute( 'mbid' )
        });

        my $url = $data->findvalue('./url', $context);
        $track->url($url);

        my $date = $data->findnodes('./date', $context)->[0]->getAttribute('uts');
        my $d = DateTime->from_epoch( epoch => $date, time_zone => 'UTC' );
        $track->date( $d );

        push @ret_tracks, $track;
    }

    return \@ret_tracks;
}

1;
=pod

=head1 Name

joshissexy::XML::AudioScrobbler

=head1 SYNOPSIS

=head1 METHODS

=cut
