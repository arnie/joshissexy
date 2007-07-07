package joshissexyDB;

=head1 NAME

joshissexyDB - DBIC Schema class

=cut

use base qw/DBIx::Class::Schema/;

__PACKAGE__->load_classes({
	joshissexyDB => [qw/
            News 
            Comments 

            Users
            Roles
            UserRoles
    /]
});

1;
