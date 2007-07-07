package joshissexyDB::Users;

use base qw/DBIx::Class/;

__PACKAGE__->load_components(qw/PK::Auto Core/);
__PACKAGE__->table('users');
__PACKAGE__->add_columns(qw/id username password email_address first_name last_name active/);
__PACKAGE__->set_primary_key('id');

__PACKAGE__->has_many(map_user_role => 'joshissexyDB::UserRoles', 'user_id');

=head1 NAME

MyAppDB::Users - A model object representing a person with access to the system.

=head1 DESCRIPTION

This is an object that represents a row in the 'users' table of your application
database.  It uses DBIx::Class (aka, DBIC) to do ORM.

=cut

1;
