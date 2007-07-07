package joshissexy;

use strict;
use warnings;

use Catalyst::Runtime '5.70';

# Set flags and add plugins for the application
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a YAML file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root 
#                 directory
#        StackTrace 

use Catalyst qw/
        -Debug 
        ConfigLoader 
        Static::Simple 


        Authentication
        Authentication::Store::DBIC
        Authentication::Credential::Password
        Authorization::Roles

        Session
        Session::Store::FastMmap
        Session::State::Cookie

        HTML::Widget/;

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
__PACKAGE__->setup;


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
