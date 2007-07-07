package joshissexyDB::Roles;

use base qw/DBIx::Class/;

__PACKAGE__->load_components(qw/PK::Auto Core/);
__PACKAGE__->table('roles');
__PACKAGE__->add_columns(qw/role_id role/);
__PACKAGE__->set_primary_key('role_id');

__PACKAGE__->has_many(map_user_role => 'joshissexyDB::UserRoles', 'role_id');

=head1 NAME

joshissexyDB::Roles - A model object representing a person with access to the system.

=head1 DESCRIPTION

This is an object that represents a row in the 'users' table of your application
database.  It uses DBIx::Class (aka, DBIC) to do ORM.

=cut

1;
