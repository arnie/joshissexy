package joshissexyDB::UserRoles;

use base qw/DBIx::Class/;

__PACKAGE__->load_components(qw/PK::Auto Core/);
__PACKAGE__->table('user_roles');
__PACKAGE__->add_columns(qw/user_id role_id/);
__PACKAGE__->set_primary_key(qw/user_id role_id/);

__PACKAGE__->belongs_to(user => 'joshissexyDB::Users', 'user_id');
__PACKAGE__->belongs_to(role => 'joshissexyDB::Roles', 'role_id');

=head1 NAME

MyAppDB::UserRoles - A model object representing a person with access to the system.

=head1 DESCRIPTION

This is an object that represents a row in the 'users' table of your application
database.  It uses DBIx::Class (aka, DBIC) to do ORM.

=cut

1;
