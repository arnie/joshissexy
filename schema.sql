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
    create_date timestamp NOT NULL DEFAULT 'now'::date
);
