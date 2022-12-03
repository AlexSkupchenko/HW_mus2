--number of performers in each genre
SELECT g.genre, COUNT(a.name) FROM genre AS g
LEFT JOIN artist_genre AS ag ON g.id = ag.genre_id
LEFT JOIN artist AS a ON ag.artist_id = a.id
GROUP BY g.genre
ORDER BY COUNT(a.id) DESC;

--number of tracks included in 2019-2020 albums
SELECT s.name, a.years FROM album AS a
LEFT JOIN song AS s ON s.album_id = a.id
where (a.years >= 2019) and (a.years <= 2020)

--average length of tracks per album
SELECT a.title, AVG(s.duration) FROM album AS a
LEFT JOIN song AS s ON s.album_id = a.id
group by a.title
ORDER BY AVG(s.duration);

--all artists who have not released an album in 2020
SELECT DISTINCT art.name FROM artist AS art
WHERE art.name NOT IN (
    SELECT DISTINCT art.name FROM artist AS art
    LEFT JOIN artist_album AS aa ON art.id = aa.artist_id
    LEFT JOIN album as al on al.id = aa.album_id
    WHERE al.years = 2020)
ORDER BY art.name;

--names of collections in which a particular artist is present (choose yourself)
SELECT DISTINCT c.name FROM collection AS c
LEFT JOIN collection_song AS cs ON c.id = cs.collection_id
LEFT JOIN song AS s ON s.id = cs.song_id
LEFT JOIN album AS a ON a.id = s.album_id
LEFT JOIN artist_album AS aa ON aa.album_id = a.id
left join artist AS art ON art.id = aa.artist_id
WHERE art.name LIKE '%%Pornofilmy%%'
ORDER BY c.name;

--title of albums with artists from more than 1 genre
SELECT a.title FROM album AS a
LEFT JOIN artist_album AS aa ON a.id = aa.album_id
LEFT JOIN artist AS art ON art.id = aa.artist_id
LEFT JOIN artist_genre AS ag ON art.id = ag.artist_id
LEFT JOIN genre AS g ON g.id = ag.genre_id
GROUP BY a.title
HAVING COUNT(DISTINCT g.genre) > 1
ORDER BY a.title;

--names of tracks that are not included in the compilations
SELECT s.name FROM song AS s
LEFT JOIN collection_song AS cs ON s.id = cs.song_id
WHERE cs.song_id IS NULL;

--artist(s) who wrote the shortest track (theoretically, there can be several such tracks)
SELECT art.name, s.duration FROM song AS s
LEFT JOIN album AS a ON a.id = s.album_id
LEFT JOIN artist_album AS aa ON aa.album_id = a.id
LEFT JOIN artist AS art ON art.id = aa.artist_id
GROUP BY art.name, s.duration
HAVING s.duration = (SELECT MIN(duration) FROM song)
ORDER BY art.name;

--the name of the albums containing the fewest tracks
SELECT DISTINCT a.title FROM album AS a
LEFT JOIN song AS s ON s.album_id = a.id
WHERE s.album_id IN (
    SELECT album_id FROM song
    GROUP BY album_id
    HAVING COUNT(id) = (
        SELECT COUNT(id) FROM song
        GROUP BY album_id
        ORDER BY COUNT
        LIMIT 1))
ORDER BY a.title;