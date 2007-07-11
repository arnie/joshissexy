package joshissexyDB::News;

use base qw/DBIx::Class/;

#Load required DBIC stuff
__PACKAGE__->load_components(qw/PK::Auto ResultSetManager Core/);

__PACKAGE__->table('news');
__PACKAGE__->add_columns(qw/news_id name topic message create_date news_category_id/);
__PACKAGE__->set_primary_key(qw/news_id/);

# Set relationships
__PACKAGE__->has_many(comments => 'joshissexyDB::Comments', {'foreign.news_id' => 'self.news_id'});
__PACKAGE__->belongs_to(news_category => 'joshissexyDB::NewsCategory', {'foreign.news_category_id' => 'self.news_category_id'});


sub news_with_comments_count : ResultSet {
    my ($self, $page, $rows) = @_;

   return $self->search(undef, {
        +select   => [ qw/me.news_id me.topic me.create_date me.message/,
                    { count => 'comments.comments_id' }
        ],
        as       => [qw/news_id topic create_date message comments_count/],
        join     => 'comments',
        order_by => 'me.create_date DESC',
        group_by => [qw/me.news_id me.topic me.create_date me.message /],

        rows     => $rows || 4,
        page     => $page || 1
    });
}


=head1 NAME

joshissexyDB::News - A model object representing the news table

=head1 DESCRIPTION

No description

=cut

1;
