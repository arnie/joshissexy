package joshissexy::Controller::Admin;

use strict;
use warnings;
use base 'Catalyst::Controller::FormBuilder';
use Data::Dumper;

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

    my $form = $self->formbuilder;

    if ($c->check_user_roles('admin')) {
        $c->forward('main');
        return;
    }

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

sub breadcrumb {
    my ( $self, $c ) = @_;

    my $url = $c->req->path;
    my @t = split '/', $url;

    # Remove any digit / id arguments
    @t = grep !/^\d+$/, @t;

    my $titles = {
        admin       => 'Admin', 
        main        => 'Main', 
        news        => 'News', 
        create_news => 'Create News',
        delete_news => 'Delete News',
        edit_news   => 'Edit News',
        'delete'    => 'Delete',
        'page'      => 'Browse',
    };


    my @breadcrumb;
    my $current_url = '';

    while ( my $b = shift @t ) {
        $current_url .= '/' . $b;
        push @breadcrumb, [$titles->{$b}, $c->uri_for($current_url)];
    }

    my $last = pop @breadcrumb;
    @breadcrumb = map { "<a href=\"$_->[1]\">$_->[0]</a>" } @breadcrumb;
    my $text = join ' &gt; ', (@breadcrumb, $last->[0]);

    return $text;

}

sub auto : Private {
    my ( $self, $c ) = @_;

    # Check for access
    unless ($c->check_user_roles('admin') or $c->req->path eq 'admin') {
        $c->response->redirect($c->uri_for('/admin'));
        return;
    }

    # Generate breadcrumb
    my $bc = $self->breadcrumb($c);
    $c->stash->{breadcrumb} = $bc if $bc;
    
}

sub news : Local Form('/admin/create_news') {
    my ( $self, $c ) = @_;

    my $directive = shift @{ $c->req->args };

    $c->forward( $directive || 'main' );
}

sub main : Local {
    my ( $self, $c ) = @_;

    $c->stash->{links} = [
        { title => 'Post News', url => $c->uri_for('/admin/news/create_news') },
        { title => 'Delete News', url => $c->uri_for('/admin/news/delete_news') },
    ];
    $c->stash->{template} = 'admin/main.tt2';
}

=head2 create_news

Simply logs a user out, and redirects to the previous page

=cut

sub logout : Local {
    my ( $self, $c ) = @_;
    
    $c->logout;

    $c->response->redirect($c->req->referer || '/');
}

=head2 create_news

HTML to create a new post.  Admin roles only

=cut

sub create_news : Private {

    my ($self, $c) = @_;

    my $form = $self->formbuilder;

    if($form->submitted and $form->validate) {

        my $topic   = $form->field('topic');
        my $message = $form->field('message');

        my $news = $c->model('joshissexyDB::News')->create({
            name    => 'arnie',
            topic   => $topic,
            message => $message,
        });

        $c->stash->{status_msg} = 'Creation of news successful!';
    }

    $c->stash->{template} = 'admin/create_news.tt2';
}

=head2 delete_news

HTML to delete a news post.  Admin roles only

=cut

sub delete_news : Local {
    my ($self, $c) = @_;


    my ($news_id, $page);

    # See just what exactly we're doing
    my @args = @{ $c->req->args };

    while (my $directive = shift @args) {
        if ($directive eq 'page') {
            $page = shift @args;
        }
        if ($directive eq 'delete') {
            $news_id = shift @args;
        }
    }

    $c->log->debug("news id: $news_id");
    $c->log->debug("page: $page");

    if($news_id) {
        my $news = $c->model('joshissexyDB::News')->search( news_id => $news_id)->single();
        #$news->delete if $news;
        if ($news) {
            $c->stash->{status_msg} = 'News deleted successfully';
        }
        else {
            $c->stash->{error_msg} = 'That news doesn\'t exist';
        }
    }

    my $news = $c->model('joshissexyDB::News')->news_with_comments_count($page, 10);
    $c->stash->{news_page} = $news->pager();
    $c->stash->{news_list} = [$news->all()];

    $c->stash->{template} = 'admin/delete_news.tt2';
}

sub delete_comment: Local {
    my ($self, $c) = @_;

    my ($directive, $id) = @{ $c->req->args };

    if ($directive eq 'delete' && $id) {
        my $comment = $c->model('joshissexyDB::Comment')->search( comments_id => $id)->single();
        $comment->delete if $comment;
        if ($comment) {
            $c->flash->{status_msg} = 'Comment deleted successfully!';
        }
        else {
            $c->flash->{error_msg} = 'That comment doesn\'t exist';
        }
    }
    elsif( $directive eq 'delete' ) {
        my @ids = $c->req->param('comment_id');
        my $success;
        foreach my $id (@ids) {
            my $comment = $c->model('joshissexyDB::Comment')->search( comments_id => $id)->single();
            if ($comment) {
                $comment->delete;
                $success++;
            }
        }
        if ($success) {
            $c->flash->{status_msg} = 'Comments deleted successfully!';
        }
        else {
            $c->flash->{error_msg} = 'Those comments doesn\'t exist';
        }
    }
    else {
            $c->flash->{error_msg} = 'No comments to delete';
    }
    $c->response->redirect($c->req->referer || '/');
}

=head1 AUTHOR

Josh Braegger, <arnie@geekahertz.org>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
