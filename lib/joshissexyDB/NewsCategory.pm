package joshissexyDB::NewsCategory;

use base qw/DBIx::Class/;

#Load required DBIC stuff
__PACKAGE__->load_components(qw/PK::Auto Core/);

__PACKAGE__->table('news_category');
__PACKAGE__->add_columns(qw/news_category_id label/);
__PACKAGE__->set_primary_key(qw/news_category_id/);

# Set relationships
__PACKAGE__->has_many(news => 'joshissexyDB::News', {'foreign.news_category_id' => 'self.news_category_id'});

=head1 NAME

joshissexyDB::Category - A model object representing the category table

=head1 DESCRIPTION

No description

=cut

1;
