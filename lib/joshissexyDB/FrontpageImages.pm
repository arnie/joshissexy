package joshissexyDB::FrontpageImages;

use base qw/DBIx::Class/;

#Loan required DBIC stuff
__PACKAGE__->load_components(qw/PK::Auto Core/);

__PACKAGE__->table('frontpage_images');
__PACKAGE__->add_columns(qw/frontpage_images_id url create_date/);
__PACKAGE__->set_primary_key(qw/frontpage_images_id/);

# Set relationships

=head1 NAME

joshissexyDB::Comments - A model object representing the comments table

=head1 DESCRIPTION

No description

=cut

1;
