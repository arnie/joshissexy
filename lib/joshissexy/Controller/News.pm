package joshissexy::Controller::News;

use strict;
use warnings;
use base 'Catalyst::Controller::FormBuilder';
use Data::Dumper;

=head1 NAME

joshissexy::Controller::News - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

sub breadcrumb {
    my ( $self, $c ) = @_;

    my $url = $c->req->path;
    my @t = split '/', $url;

    my $titles = {
        news => 'Home',
        
    };

    my @breadcrumb;

    # This can sometimes throw an error, we don't really care though
    eval {
    while ( my $i = shift @t ) {

        if ($i eq 'news') {
            push @breadcrumb, ['Home', $c->uri_for('/news')];

            while (my $i = shift @t) {
                if ($i eq 'page') {
                    my $page = shift @t;
                    push @breadcrumb, ["News (page $page)", $c->uri_for("/news/page/$page")];
                }
                elsif ($i =~ /^(\d+)$/) {
                    my $news = $c->model('joshissexyDB::News')->single({ news_id => $1});
                    push @breadcrumb, [$news->topic, $c->uri_for("/news/$1")] if $news->topic;

                    my $directives = {
                        post_comment => ['Post Comment', $c->uri_for("/news/$1/post_comment")],
                    };

                    my $directive = $directives->{ shift @t };
                    push @breadcrumb, $directive if $directive;

                }
                elsif ($i eq 'create_news') {
                    push @breadcrumb, ['Admin', $c->uri_for("/admin")];
                    push @breadcrumb, ['Create News', $c->uri_for("/news/create_news")];
                }
                elsif ($i eq 'delete_news') {
                    push @breadcrumb, ['Admin', $c->uri_for("/admin")];
                    push @breadcrumb, ['Delete News', $c->uri_for("/news/delete_news")];
                }

            }

        }
    }
    };

    if (scalar @breadcrumb <= 1) {
        return '';
    }

    my $last = pop @breadcrumb;
    @breadcrumb = map { "<a href=\"$_->[1]\">$_->[0]</a>" } @breadcrumb;
    my $text = join ' &gt; ', (@breadcrumb, $last->[0]);


    return $text;
}

sub auto : Private {
    my ( $self, $c ) = @_;

    # Generate breadcrumb
    my $bc = $self->breadcrumb($c);
    $c->stash->{breadcrumb} = $bc if $bc;
    1;
}

=head2 index 

=cut

sub index : Private {
    my ( $self, $c ) = @_;

    $self->news_page($c);
}

sub news_detail : LocalRegex('^(\d+)(\/\w+)?$') Form {
    my ( $self, $c) = @_;

    my $news_id = $c->req->captures->[0];

    my $news = $c->model('joshissexyDB::News')->single({ news_id => $news_id})
        or joshissexy::Exception::FileNotFound->throw('Could not find \'' . $c->req->uri . '\'');

    $c->stash->{news} = $news;

    my $c_form = $self->formbuilder;
    $c_form->action("/news/$news_id/post_comment");

    if ($c_form->submitted) {
        if(!$c_form->validate) {
            $c->stash->{error_msg} = 'Validation errors!';
        }
        else {
            # Insert the shiz
            my $name    = $c_form->field('name');
            my $email   = $c_form->field('email');
            my $message = $c_form->field('message');
            my $ip      = $c->req->address;

            $c->model('joshissexyDB::Comments')->create({
                    name    => $name,
                    news_id => $news_id,
                    email   => $email,
                    message => $message,
                    ip      => $ip
                });

            $c->stash->{form_submitted} = 1;
            $c->stash->{status_msg} = 'Comment created!';
        }
    }

    $c->stash->{template} = 'news/news_detail.tt2';
}

=head2 news_page

HTML for a specific news page

=cut

sub news_page : LocalRegex('^page\/(\d+)$') {
    my ($self, $c) = @_;
    my $news_page = $c->req->captures->[0];

    my $news = $c->model('joshissexyDB::News')->news_with_comments_count($news_page)
        or joshissexy::Exception::FileNotFound->throw("No news found!");

    $c->stash->{news_page} = $news->pager();
    $c->stash->{news} = [$news->all()];
    $c->stash->{template} = 'index.tt2';
}

=head2 create_news

HTML to create a new post.  Admin roles only

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

HTML to delete a news post.  Admin roles only

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

=head1 AUTHOR

Josh Braegger, "arnie@geekahertz.org"

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
