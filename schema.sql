CREATE SEQUENCE news_category_id_seq;

CREATE TABLE news_category (
    news_category_id INTEGER PRIMARY KEY DEFAULT nextval('news_category_id_seq'),
    label VARCHAR(64) NOT NULL
);

ALTER TABLE news 
ADD COLUMN news_category_id INTEGER REFERENCES news_category (news_category_id);

CREATE SEQUENCE frontpage_images_id_seq;
CREATE TABLE frontpage_images (
    frontpage_images_id INTEGER PRIMARY KEY DEFAULT nextval('frontpage_images_id_seq'),
    url varchar(64) NOT NULL,
    create_date timestamp NOT NULL DEFAULT 'now'
);

CREATE SEQUENCE lastfm_tracks_id_seq;
CREATE TABLE lastfm_tracks (
    last_fm_tracks_id INTEGER PRIMARY KEY DEFAULT nextval('lastfm_tracks_id_seq'),
    artist varchar(128) NOT NULL,
    artist_mbid varchar(37),
    name varchar(128),
    album varchar(128) NOT NULL,
    album_mbid varchar(37),
    url varchar(256),
    date_listened timestamp,
    create_date timestamp NOT NULL DEFAULT 'now'
);
