-- adding a genre
INSERT INTO genre (genre)
VALUES ('Rock'),
('Hard Rock'),
('Indie Rock'),
('Pop Punk'),
('Alternative')
;

-- adding performers
INSERT INTO IF NOT EXISTS artist (name)
VALUES ('Nirvana'),
('Guns N Roses'),
('AC/DC'),
('Rammstein'),
('The Rolling Stones'),
('Pornofilmy'),
('Bon Jovi'),
('Imagine Dragons')
;

-- adding albums
INSERT INTO album (title, years)
VALUES ('Rammstein', '2019'),
('It will pass', '2020'),
('Nevermind', '1991'),
('Appetite for Destruction', '1987'),
('Highway to Hell', '1979'),
('Aftermath', '1966'),
('Crush', '2000'),
('Mercury', '2022');

--adding songs
INSERT INTO song(name, duration, album_id)
VALUES ('Highway to Hell', '208', 5),
('Girls got Rhythm', '204', 5),
('Touch too much', '267', 5),
('Deutschland', '323', 1),
('Radio', '277', 1),
('Auslander', '232', 1),
('Smells like teen spirit', '301', 3),
('Lithium', '257', 3),
('Polly', '177', 3),
('Welcome to Jungle', '273', 4),
('Its So Easy', '203', 4),
('My Michelle', '220', 4),
('It will pass', '236', 2),
('Love lessons', '317', 2),
('Kind heart', '252', 2),
('Paint It Black', '203', 6),
('Stupid girl', '177', 6),
('Lady Jane', '189', 6),
('Its my life', '225', 7),
('Next 100 years', '379', 7),
('Mystery Train', '315', 7),
('Bones', '165', 8),
('Sharks', '191', 8),
('Dull Knives', '214', 8),
('My Life', '225', 8);

--adding collections
INSERT INTO collection(name, years)
VALUES ('Сompilation 1', '2015'),
('Сompilation 2', '2016'),
('Сompilation 3', '2017'),
('Сompilation 4', '2018'),
('Сompilation 5', '2019'),
('Сompilation 6', '2020'),
('Сompilation 7', '2021'),
('Сompilation 8', '2022');

--adding artists and albums to the intermediate table
INSERT INTO artist_album(album_id,artist_id)
VAlUES (1,4),
(2,6),
(3,1),
(4,2),
(5,3),
(6,5),
(7,7),
(8,8);

-- adding artists and genres to the intermediate table
INSERT INTO artist_genre(artist_id, genre_id)
VALUES (1, 1),
(4, 1),
(4, 2),
(3, 2),
(3, 1),
(8, 5),
(2, 1),
(5, 1),
(6, 4),
(7, 3);

--adding collections and songs to the intermediate table
INSERT INTO collection_song(song_id, collection_id)
VALUES (5, 1),
(4, 1),
(3, 1),
(17, 1),
(18, 2),
(16, 2),
(15, 2),
(12, 2),
(22, 3),
(14, 3),
(9, 3),
(6, 4),
(2, 4),
(20, 4),
(12, 5),
(13, 5),
(11, 5),
(9, 5),
(6, 6),
(8, 6),
(7, 6),
(4, 6),
(3, 7),
(1, 7),
(21, 7),
(22, 7),
(15, 8),
(17, 8),
(12, 8),
(24, 8);