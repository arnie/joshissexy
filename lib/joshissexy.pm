package joshissexy;

use strict;
use warnings;

use Catalyst::Runtime '5.70';
use joshissexy::Exceptions;

# Set flags and add plugins for the application
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a YAML file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root 
#                 directory
#        StackTrace 

use Catalyst qw/
        ConfigLoader 
        Static::Simple 


        Authentication
        Authentication::Store::DBIC
        Authentication::Credential::Password
        Authorization::Roles

        Session
        Session::Store::FastMmap
        Session::State::Cookie
/;

our $VERSION = '0.01';

# Configure the application. 
#
# Note that settings in joshissexy.yml (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with a external configuration file acting as an override for
# local deployment.

# See joshissexy.yml

# Start the application
__PACKAGE__->setup( qw/Cache::FileCache PageCache/ );

sub finalize {
    my ( $c ) = shift;
    $c->handle_exception if @{ $c->error };
    $c->NEXT::finalize( @_ );
}

sub handle_exception {
    my( $c )  = @_;
    my $error = $c->error->[ 0 ];

    if( !Scalar::Util::blessed( $error ) or !$error->isa( 'joshissexy::Exception' ) ) {
        $error = joshissexy::Exception->new( message => "$error" );
    }

    # handle debug-mode forced-debug from RenderView
    if( $c->debug && $error->message =~ m{^forced debug} ) {
        return;
    }

    $c->clear_errors;

    if ( $error->is_error ) {
        $c->response->headers->remove_content_headers;
    }

    if ( $error->has_headers ) {
        $c->response->headers->merge( $error->headers );
    }

    # log the error
    if ( $error->is_server_error ) {
        $c->log->error( $error->as_string );
    }
    elsif ( $error->is_client_error ) {
        $c->log->warn( $error->as_string ) if $error->status =~/^40[034]$/;
    }

    if( $error->is_redirect ) {
        # recent Catalyst will give us a default body for redirects

        if( $error->can( 'uri' ) ) {
            $c->response->redirect( $error->uri( $c ) );
        }

        return;
    }

    $c->response->status( $error->status );
    $c->response->content_type( 'text/html; charset=utf-8' );
    $c->response->body(
        $c->view( 'TT' )->render( $c, 'error.tt2', { error => $error } )
    );

    # processing the error has bombed. just send it back plainly.
    $c->response->body( $error->as_public_html ) if $@;
}

$SIG{ __DIE__ } = sub {
    return if Scalar::Util::blessed( $_[ 0 ] );
    joshissexy::Exception->throw( message => join '', @_ );
};


=head1 NAME

joshissexy - Catalyst based application

=head1 SYNOPSIS

    script/joshissexy_server.pl

=head1 DESCRIPTION

The root of joshissexy.com

=head1 SEE ALSO

L<joshissexy::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Josh Braegger, "arnie@geekahertz.org"

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
