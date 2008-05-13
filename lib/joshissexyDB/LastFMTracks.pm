package joshissexyDB::LastFMTracks;

use base qw/DBIx::Class/;

#Loan required DBIC stuff
__PACKAGE__->load_components(qw/InflateColumn::DateTime PK::Auto Core/);

__PACKAGE__->table('lastfm_tracks');
__PACKAGE__->add_columns(qw/last_fm_tracks_id artist artist_mbid name album album_mbid 
        url/);
__PACKAGE__->add_columns(
        date_listened => { data_type => 'datetime', extra => { timezone => 'local' } },
        create_date   => { data_type => 'datetime', extra => { timezone => 'local' } },
);
__PACKAGE__->set_primary_key(qw/last_fm_tracks_id/);

# Set relationships

=head1 NAME

joshissexyDB::LastFMTracks - A model object representing the lastfm_tracks table

=head1 DESCRIPTION

No description

=cut

1;
