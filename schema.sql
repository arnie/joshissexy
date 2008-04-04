CREATE SEQUENCE news_category_id_seq;

CREATE TABLE news_category (
    news_category_id INTEGER PRIMARY KEY DEFAULT nextval('news_category_id_seq'),
    label VARCHAR(64) NOT NULL
);

ALTER TABLE news 
ADD COLUMN news_category_id INTEGER REFERENCES news_category (news_category_id);
