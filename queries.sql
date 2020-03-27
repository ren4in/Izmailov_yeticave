-- заполнение таблицы users
INSERT INTO users (reg_date, email,	name, password,	avatar, contacts)
VALUES
('2020-01-01', 'ivan@mail.ru', 'Ivan', 'u)uUKypyIO34', 'img/user.jpg', '+79032231232'),
('2020-01-01', 'petr@mail.ru', 'Petr', 'kyk*TAftIP11', 'img/user.jpg', '+79035328439');
-- заполнение таблицы categories --
INSERT INTO categories (id, title, alias)
VALUES
(1, 'Доски и лыжи', 'boards'),
(2, 'Крепления', 'mounts'),
(3, 'Ботинки', 'boots'),
(4, 'Одежда', 'clothes'),
(5, 'Разное', 'about');


-- заполнение таблицы lots --
INSERT INTO lots (name, description, image, price, date_start, date_final, step, user_id, category_id, winner_id) VALUES
('2014 Rossignol District Snowboard', 'Доска', 'img/lot-1.jpg', 10999, '2020-03-25', '2020-04-25', 1000, 1, 1, null),
('DC Ply Mens 2016/2017 Snowboard', 'Доска', 'img/lot-2.jpg', 159999, '2020-01-01', '2020-02-02', 1000, 1, 1, 2),
('Крепления Union Contact Pro 2015 года размер L/XL', 'Крепление', 'img/lot-3.jpg', 8000, '2020-03-16', '2020-04-16', 1000, 2, 2, null),
('Ботинки для сноуборда DC Mutiny Charocal', 'Ботинки', 'img/lot-4.jpg', 10999, '2020-03-16', '2020-04-16', 1000, 2, 3, null),
('Куртка для сноуборда DC Mutiny Charocal', 'Куртка', 'img/lot-5.jpg', 7500, '2020-01-01', '2020-02-02', 1000, 2, 4, 1),
('Маска Oakley Canopy', 'Маска', 'img/lot-6.jpg', 5400, '2020-02-02', '2020-03-03', 1000, 2, 5, 1);

-- заполнение таблицы bets
INSERT INTO bets (lot_id, user_id, bet_date, sum)VALUES
(3, 1, '2020-03-25', 20000),
(3, 2, '2020-03-28', 30000),
(5, 1, '2020-02-02', 7000),
(5, 2, '2020-02-03', 9000);

-- 	получить все категории --
SELECT * FROM categories;

-- получить самые новые, открытые лоты. Каждый лот должен включать название, стартовую цену, ссылку на изображение, цену последней ставки, количество ставок, название категории --
SELECT name, price, image, title as category, MAX(sum) as max_bet, count(bets.id) as bets_count  FROM lots INNER JOIN categories ON lots.category_id=categories.id
INNER JOIN bets ON bets.lot_id=lots.id
WHERE date_final<CURDATE()
GROUP BY name
ORDER BY date_start DESC;
-- 	показать лот по его id. Получите также название категории, к которой принадлежит лот
SELECT name, title as category FROM lots INNER JOIN categories ON categories.id=lots.category_id
WHERE lots.id=1;

--	обновить название лота по его идентификатору --
UPDATE lots
SET name = '2015 Rossignol District Snowboard'
WHERE id=1;

-- 	получить список самых свежих ставок для лота по его идентификатору --
SELECT lots.id, name, bets.id, bets.user_id, bets.bet_date, sum FROM lots INNER JOIN bets ON bets.lot_id=lots.id
WHERE lots.id=3;