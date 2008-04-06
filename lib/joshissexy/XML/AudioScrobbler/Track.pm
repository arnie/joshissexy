package joshissexy::XML::AudioScrobbler::Track;

use Moose;

has streamable  => (is => 'rw');
has artist      => (is => 'rw', isa => 'HashRef');
has name        => (is => 'rw');
has album       => (is => 'rw', isa => 'HashRef');
has url         => (is => 'rw');
has date        => (is => 'rw', isa => 'DateTime');

1;
