package joshissexyDB::News;

use base qw/DBIx::Class/;

#Loan required DBIC stuff
__PACKAGE__->load_components(qw/PK::Auto Core/);

__PACKAGE__->table('news');
__PACKAGE__->add_columns(qw/news_id name topic message create_date/);
__PACKAGE__->set_primary_key(qw/news_id/);

# Set relationships
__PACKAGE__->has_many(comments => 'joshissexyDB::Comments', {'foreign.news_id' => 'self.news_id'});


=head1 NAME

joshissexyDB::News - A model object representing the news table

=head1 DESCRIPTION

No description

=cut

1;
