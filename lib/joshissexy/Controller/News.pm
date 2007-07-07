package joshissexy::Controller::News;

use strict;
use warnings;
use base 'Catalyst::Controller';
use Data::Dumper;

=head1 NAME

joshissexy::Controller::News - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index 

=cut

sub index : Private {
    my ( $self, $c ) = @_;

    $self->news_page($c);
}

sub news_detail : LocalRegex('^(\d+)$') {
    my ( $self, $c) = @_;
   
    my $news_id = $c->req->captures->[0];

    my $news = $c->model('joshissexyDB::News')->single({ news_id => $news_id});
    $c->stash->{news} = $news;

    my $w = $self->make_comment_widget($c, $news_id);
    $w->action($c->req->uri);

    my $result;
    unless ($c->req->params->{ok}) {
        $result = $w->result;
    }
    else {
        $result = $w->process($c->req);

        if($result->has_errors) {
            $c->stash->{error_msg} = 'Validation errors!';
        }
        else {
            # Insert the shiz
            my $name    = $c->req->params->{name};
            my $email   = $c->req->params->{email};
            my $message = $c->req->params->{message};
            my $ip      = $c->req->address;

            $c->model('joshissexyDB::Comments')->create({
                    name    => $name,
                    news_id => $news_id,
                    email   => $email,
                    message => $message,
                    ip      => $ip
                });

            $c->stash->{status_msg} = 'Comment created!';
        }
    }

    $c->stash->{add_comment_form} = $result;
    $c->stash->{template} = 'news/news_detail.tt2';
}


sub news_page : LocalRegex('^page\/(\d+)$') {
    my ($self, $c) = @_;
    my $news_page = $c->req->captures->[0];

    my $news = $c->model('joshissexyDB::News')->search(undef, { 
        +select   => [ qw/me.news_id me.topic me.create_date me.message/,
                    { count => 'comments.comments_id' }
        ],
        as       => [qw/news_id topic create_date message comments_count/],
        join     => 'comments',
        order_by => 'me.create_date DESC',
        group_by => [qw/me.news_id me.topic me.create_date me.message /],

        rows     => 4,
        page     => $news_page || 1
    });

    $c->stash->{news_page} = $news->pager();
    $c->stash->{news} = [$news->all()];
    $c->stash->{template} = 'index.tt2';
}

sub make_comment_widget {
    my ( $self, $c, $news_id) = @_;


    my $w = $c->widget('comment_form')->method('post');

    $w->element('Hidden','news_id'  )->value($news_id);
    $w->element('Textfield','name'  )->label('Name')->size(25);
    $w->element('Textfield','email' )->label('Email')->size(25);
    $w->element('Textarea','message')->label('Comment')->cols(50)->rows(6);
    $w->element('Submit','ok')->value('Submit');

    $w->constraint(All => qw/name message/)->message('Required');

    for my $column (qw/name email message/) {
        $w->filter( TrimEdges => $column );
    }

    return $w;
}

=head2 create_news

HTML to create a new post

=cut

sub create_news : Local {

    my ($self, $c) = @_;

    if(!$c->check_user_roles('admin')) {
        $c->response->redirect($c->uri_for('/admin'));
        return;
    }

    if($c->request->params->{submit}) {

        my $topic   = $c->request->params->{topic};
        my $message = $c->request->params->{message};

        my $news = $c->model('joshissexyDB::News')->create({
            name    => 'arnie',
            topic   => $topic,
            message => $message,
        });

        $c->stash->{status_msg} = 'Creation of news successful!';
    }

    $c->stash->{template} = 'news/create_news.tt2';
}

=head2 delete_news

HTML to delete a news post

=cut

sub delete_news : Local {
    my ($self, $c, $news_id) = @_;


    if(!$c->check_user_roles('admin')) {
        $c->response->redirect($c->uri_for('/admin'));
        return;
    }

    if($news_id) {
        my $news = $c->model('joshissexyDB::News')->single({ news_id => $news_id});
        $news->delete if $news;
        if ($news) {
            $c->stash->{status_msg} = 'News deleted successfully';
        }
        else {
            $c->stash->{error_msg} = 'That news doesn\'t exist';
        }
    }

    $c->stash->{news_list} = [$c->model('joshissexyDB::News')->all];

    $c->stash->{template} = 'news/delete_news.tt2';
}

=pod
#sub end : Private {
#    my ($self, $c) = @_;
#    $c->forward('joshissexy::View::TT');
#}
=cut


=head1 AUTHOR

Josh Braegger, "arnie@geekahertz.org"

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
