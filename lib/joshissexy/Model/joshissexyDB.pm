package joshissexy::Model::joshissexyDB;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config( 
    schema_class => 'joshissexyDB',
    connect_info => delete joshissexy->config->{connect_info},
 );

=head1 NAME

joshissexy::Model::joshissexyDB - Catalyst DBIC Schema Model
=head1 SYNOPSIS

See L<joshissexy>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<joshissexyDB>

=head1 AUTHOR

Josh Braegger, "arnie@geekahertz.org"

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
