package joshissexy::Controller::Admin;

use strict;
use warnings;
use base 'Catalyst::Controller::FormBuilder';

=head1 NAME

joshissexy::Controller::Admin - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index 

=cut

sub index : Local Form('/admin/login') {
    my ( $self, $c ) = @_;

    if($c->check_user_roles('admin')) {
        $c->response->redirect($c->uri_for('/admin/main'));
        return;
    }

    my $form = $self->formbuilder;

    my $result;
    my $username = $form->field('username');
    my $password = $form->field('password');

    if ($form->submitted and $form->validate) {
        if ($c->login($username, $password)) {
            $c->flash->{status_msg} = "Welcome $username!";
            $c->response->redirect($c->uri_for('/admin/main'));
            return;
        } else { 
            $c->stash->{error_msg} = 'Bad username or password.';
        }
    }

    $c->stash->{template} = 'admin/login.tt2';
	
}

sub auto : Private {
    my ( $self, $c ) = @_;

    unless ($c->check_user_roles('admin') or $c->req->path eq 'admin') {
        $c->response->redirect($c->uri_for('/admin'));
        return;
    }
    
}

sub main : Local {
    my ( $self, $c ) = @_;

    $c->stash->{links} = [
        { title => 'Post News', url => $c->uri_for('/news/create_news') },
        { title => 'Delete News', url => $c->uri_for('/news/delete_news') },
    ];
    $c->stash->{template} = 'admin/main.tt2';
}

sub logout : Local {
    my ( $self, $c ) = @_;
    
    $c->logout;

    $c->response->redirect($c->req->referer || '/');
}


=head1 AUTHOR

Josh Braegger, <arnie@geekahertz.org>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
