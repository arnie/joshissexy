package joshissexyDB::Comments;

use base qw/DBIx::Class/;

#Loan required DBIC stuff
__PACKAGE__->load_components(qw/PK::Auto Core/);

__PACKAGE__->table('comments');
__PACKAGE__->add_columns(qw/comments_id news_id name email ip message create_date/);
__PACKAGE__->set_primary_key(qw/comments_id/);

# Set relationships
__PACKAGE__->belongs_to(news => 'joshissexyDB::News', {'foreign.news_id' => 'self.news_id'});

=head1 NAME

joshissexyDB::Comments - A model object representing the comments table

=head1 DESCRIPTION

No description

=cut

1;
