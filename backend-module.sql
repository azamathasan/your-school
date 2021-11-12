/* 1) Выберите список всех комментариев, созданных пользователем с идентификатором 1.
Поля для вывода: id, created_at, offer_id, comment_text.*/

SELECT id, created_at, offer_id, comment_text FROM comments
WHERE user_id='1'


/* 2) Выведите список объявлений (id, created_at, user_id, offer_type, title, price, picture),
опубликованных в октябре 2021 года с сортировкой по дате публикации от самых свежих к более
поздним. Дату публикации выведите в формате ‘DD.MM.YYYY’.*/

SELECT id, DATE_FORMAT(created_at, %d.%m.%Y), user_id, offer_type, title, price, picture FROM offers
WHERE created_at BETWEEN '2021-10-01 00:00:00' AND '2021-11-01 00:00:00' ORDER BY created_at DESC


/* 3) Выберите список пользователей, которые ещё не опубликовали ни одного объявления.
Поля для вывода: идентификатор пользователя, email, дата регистрации, имя и фамилия
одной строкой как ‘user_name’. Отсортируйте по возрастанию даты регистрации.*/

SELECT id, email, created_at, CONCAT_WS('_', first_name, last_name) AS user_name FROM users
WHERE id NOT IN (SELECT user_id FROM offers) ORDER BY created_at ASC


/* 4) Выберите среди всех объявлений на продажу самые дорогие товары, их количество 
динамическое и заранее неизвестно. Выведите их идентификаторы, автора (имя, фамилия),
заголовки и цену продажи. Отсортируйте по убыванию цены.*/
SELECT offers.id, users.first_name, users.last_name, offers.title, offers.price FROM offers, users
ORDER BY offers.price DESC


/* 5) Для вывода на сайте выберите список всех категорий, в которых есть хотя бы одно
объявление с указанием количества объявлений по каждой категории. Выведите id категории,
title, slug, количество объявлений (offer_amount).*/
SELECT categories.id, categories.title, categories.slug, count(category_offer.offer_id) AS offer_amount FROM offers, category_offer, categories
WHERE offers.id IN (SELECT offer_id FROM category_offer)





