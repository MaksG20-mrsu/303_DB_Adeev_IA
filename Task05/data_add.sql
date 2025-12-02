INSERT OR IGNORE INTO users (name, email, gender, register_date, occupation_id)
VALUES
('Адеев Ильдар Альбертович', 'adeev@gmail.com', 'male', date('now'),
 (SELECT id FROM occupations ORDER BY id LIMIT 1)),
('Кечемайкин Дмитрий Максимович', 'kemaikin@gmail.com', 'male', date('now'),
 (SELECT id FROM occupations ORDER BY id LIMIT 1)),
('Ферафонтов Алексей Вадимович', 'ferafontov@gmail.com', 'male', date('now'),
 (SELECT id FROM occupations ORDER BY id LIMIT 1)),
('Голиков Евгений Александрович', 'golikov@gmail.com', 'male', date('now'),
 (SELECT id FROM occupations ORDER BY id LIMIT 1)),
('Розанов Ярослав Дмитриевич', 'rozanov@gmail.com', 'male', date('now'),
 (SELECT id FROM occupations ORDER BY id LIMIT 1));


INSERT OR IGNORE INTO movies (title, year)
VALUES
('Любовь и голуби (1984)', 1984),
('Место встречи изменить нельзя (1979)', 1979),
('Тайна третьей планеты (1981)', 1981);

INSERT OR IGNORE INTO genres (name) VALUES ('Detective');
INSERT OR IGNORE INTO genres (name) VALUES ('Drama');
INSERT OR IGNORE INTO genres (name) VALUES ('Cartoon');

INSERT OR IGNORE INTO movie_genres (movie_id, genre_id)
SELECT m.id, g.id FROM movies m JOIN genres g ON g.name = 'Detective'
WHERE m.title = 'Место встречи изменить нельзя (1979)';

INSERT OR IGNORE INTO movie_genres (movie_id, genre_id)
SELECT m.id, g.id FROM movies m JOIN genres g ON g.name = 'Drama'
WHERE m.title = 'Любовь и голуби (1984)';

INSERT OR IGNORE INTO movie_genres (movie_id, genre_id)
SELECT m.id, g.id FROM movies m JOIN genres g ON g.name = 'Cartoon'
WHERE m.title = 'Тайна третьей планеты (1981)';

INSERT INTO ratings (user_id, movie_id, rating, timestamp)
SELECT u.id, m.id, 5.0, strftime('%s','now')
FROM users u JOIN movies m ON m.title = 'Любовь и голуби (1984)'
WHERE u.email = 'ild.adeev@gmail.com'
AND NOT EXISTS (
    SELECT 1 FROM ratings r WHERE r.user_id = u.id AND r.movie_id = m.id
);

INSERT INTO ratings (user_id, movie_id, rating, timestamp)
SELECT u.id, m.id, 4.9, strftime('%s','now')
FROM users u JOIN movies m ON m.title = 'Место встречи изменить нельзя (1979)'
WHERE u.email = 'ild.adeev@gmail.com'
AND NOT EXISTS (
    SELECT 1 FROM ratings r WHERE r.user_id = u.id AND r.movie_id = m.id
);

INSERT INTO ratings (user_id, movie_id, rating, timestamp)
SELECT u.id, m.id, 4.8, strftime('%s','now')
FROM users u JOIN movies m ON m.title = 'Тайна третьей планеты (1981)'
WHERE u.email = 'ild.adeev@gmail.com'
AND NOT EXISTS (
    SELECT 1 FROM ratings r WHERE r.user_id = u.id AND r.movie_id = m.id
);
