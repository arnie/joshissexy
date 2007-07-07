package joshissexy::Controller::Admin;

use strict;
use warnings;
use base 'Catalyst::Controller';

=head1 NAME

joshissexy::Controller::Admin - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index 

=cut

sub index : Private {
    my ( $self, $c ) = @_;

    if($c->check_user_roles('admin')) {
        $c->response->redirect($c->uri_for('/admin/main'));
        return;
    }

    my $result;
    my $username = $c->req->params->{username};
    my $password = $c->req->params->{password};

    my $w = $self->_make_login_widget($c);

    if ($username or $password) {
        if($c->login($username, $password)) {
            $c->flash->{status_msg} = "Welcome $username!";
            $c->response->redirect($c->uri_for('/admin/main'));
            return;
        } 

        $c->stash->{error_msg} = 'Bad username or password.';
        $result = $w->process($c->req);
    }
    else {
        $result = $w->result;
    }

    $c->stash->{login_form} = $result;
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

sub _make_login_widget {
    my ( $self, $c) = @_;

    my $w = $c->widget('comment_form')->method('post');
    $w->action($c->req->uri);
    $w->element('Textfield','username')->label('Username')->size(25);
    $w->element('Password','password' )->label('Password')->size(25);
    $w->element('Submit','ok')->value('Submit');

    $w->constraint(All => qw/name message/)->message('Required');

    for my $column (qw/name email message/) {
        $w->filter( TrimEdges => $column );
    }

    return $w;

}


=head1 AUTHOR

Josh Braegger, <arnie@geekahertz.org>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
