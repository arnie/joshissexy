package joshissexy::Controller::Root;

use strict;
use warnings;
use base 'Catalyst::Controller';

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

=head1 NAME

joshissexy::Controller::Root - Root Controller for joshissexy

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 base

=cut

sub index : Public {
    my ( $self, $c ) = @_;
    $c->res->redirect('/news');
}


=head2 default

=cut

sub default : Private {
    my ( $self, $c ) = @_;

    # Hello World
    #$c->response->body( $c->welcome_message);
    $c->response->status(404);
    $c->response->body("OMG! Page not found!");
}

=head2 end

Attempt to render a view, if needed.

=cut 

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Josh Braegger, "arnie@geekahertz.org"

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
