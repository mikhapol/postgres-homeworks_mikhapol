-- Задача 1: Выберите все сериалы ('TV Show' в поле type) с рейтингом 'TV-MA'.
-- Выведите 5 строк результата.
-- Выведите колонки «идентификатор» (show_id), «название» (title) и «дата добавления» (date_added).
SELECT   show_id
       , title
       , date_added
FROM public.netflix
WHERE type = 'TV Show' AND rating = 'TV-MA'
LIMIT 5

-- Задача 2: Определите, есть ли сериалы или фильмы, в производстве которых поучаствовала и Бразилия, и Аргентина.
-- Выведите колонки «идентификатор» (show_id), «название» (title) и «страна-производитель» (country).
    -- Примечание:
    -- Страны могут быть указаны в любой последовательности.
    -- Не ограничивайтесь только сериалами (уберите условие с поля type).
SELECT    show_id
        , title
        , country
FROM public.netflix
WHERE country LIKE '%Argentina%' AND country LIKE '%Brazil%'

-- Задача 3: Напишите запрос, который выведет все фильмы, у которых год выпуска между 2017 и 2019,
             -- а также все сериалы, у которых год выпуска раньше 2016 (не строго).
-- Выведите колонки «идентификатор» (show_id), «название» (title), «год выпуска» (release_year) и «тип» (type).
SELECT    show_id
        , title
        , release_year
        , type
FROM public.netflix
WHERE release_year <= 2016 AND type = 'TV Show'
  OR  release_year BETWEEN 2017 AND 2019 AND type = 'Movie'

-- Задача 4: Вывести названия всех сериалов, в которых участвует Рене Зеллвегер (Renée Zellweger) — победительница
            -- номинации за лучшую женскую роль.
SELECT title
FROM netflix
WHERE cast_names LIKE '%Renée Zellweger%' AND type = 'TV Show'

-- Задача 5: Дать всю имеющуюся информацию о не слишком старых фильмах производства Netflix,
            -- которые сняли режиссеры пяти главных фильмов 2020 года по версии «КиноПоиска».
-- Зайдите по ссылке и определите необходимый список режиссеров. Затем выведите не слишком старые фильмы этих режиссеров.
SELECT *
FROM netflix
WHERE type = 'Movie' AND release_year >= 2010 AND director in
('Bong Joon Ho', 'Todd Phillips', 'Quentin Tarantino', 'Martin Scorsese', 'Sam Mendes')

-- Задание 6: Найдите средний размер выданного кредита для каждого типа кредита (поле credit_type).
            -- Ограничьтесь только кредитами, которые были выданы клиентам старше 30 лет (не строго).
SELECT credit_type , AVG(amt_loan) AS avg_loan
FROM skybank.late_collection_clients
WHERE age >= 30
GROUP BY credit_type

-- Задание 7: Есть ли в таблице хоть один клиент, которому было выдано больше одного кредита?
SELECT   id_client
       , COUNT(*) AS cnt
FROM skybank.late_collection_clients
GROUP BY id_client
HAVING COUNT(*) > 1
