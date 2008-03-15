package joshissexy::XML::xkcd;

use strict;
use XML::Atom;
use XML::Atom::Client;

sub new {
    my $class = shift;
    my $args = {
        feed_url => 'http://xkcd.com/atom.xml',
    };
    return bless $args, $class;
}

sub _get_feed {
    my $self = shift;
    return $self->{feed} if $self->{feed};

    my $api = XML::Atom::Client->new;
    my $feed = $api->getFeed( $self->{feed_url} );
    $self->{feed} = $feed;

    return $self->{feed}
}

sub get_feed {
    my $self = shift;
}

sub get_latest_image_url {
    my $self = shift;
    my $feed = $self->_get_feed;
   
    my @entries = $feed->entries;
    if (@entries) {

        my $text = $entries[0]->elem->childNodes->[4]->childNodes->[0]->textContent;
        my $src;
        $text =~ /src="([^"]+)"/ and $src = $1;
        return $src;
    }
    return;
}

1;
