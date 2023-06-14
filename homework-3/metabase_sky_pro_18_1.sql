select * from skyeng_db.students a
select * from skyeng_db.classes b

--Задача 1: Выведите количество студентов из таблицы students, по которым не было проведено ни одного урока (то есть они отсутствуют в таблице classes).
select count(*)
from skyeng_db.students a
    left join skyeng_db.classes b
        on a.user_id = b.user_id
where b.user_id is null

--Задача 2: Сколько у нас студентов, с которыми мы проводили уроки, но которые не упомянуты в таблице students?
select count(distinct a.user_id)
from skyeng_db.classes a
    left join skyeng_db.students b
        on a.user_id = b.user_id
where b.user_id is null

--Задача 3: Рассчитайте количество учителей, которые проводили занятие, но которых нет в таблице teachers.
select  count(distinct a.id_teacher)
from skyeng_db.classes a
    left join skyeng_db.teachers b
        on a.id_teacher = b.id_teacher
where b.id_teacher is null

--Задача 4: Рассчитайте количество учителей, которые есть в таблице teachers, но которые не провели ни одного урока.
select  count(*)
from skyeng_db.teachers a
    left join skyeng_db.classes b
        on a.id_teacher = b.id_teacher
where b.id_teacher is null

--Задача 5: Сколько есть студентов в таблице students, которые не провели ни одного платежа (таблица payments)?
select  count(*)
from skyeng_db.students a
    left join skyeng_db.payments b
        on a.user_id = b.user_id
where b.user_id is null

Задача 6: Рассчитайте количество студентов из таблицы students, которые произвели хотя бы один платеж.
select  count(distinct a.user_id)
from skyeng_db.students a
    join skyeng_db.payments b
        on a.user_id = b.user_id

Задача 7: Сколько есть студентов в таблице payments, которые отсутствуют в таблице students?
select  count(distinct a.user_id)
from skyeng_db.payments a
    left join skyeng_db.students b
        on a.user_id = b.user_id
where b.user_id is null

Задача 8: Рассчитайте количество студентов из таблицы students, которые никогда не оформляли заказы (таблица orders).
select count(*)
from skyeng_db.students a
    left join skyeng_db.orders b
        on a.user_id = b.user_id
where b.user_id is null

Задача 9: Встречаются ли в таблице orders студенты, которые отсутствуют в таблице students?
select count(*)
from skyeng_db.orders a
    left join skyeng_db.students b
        on a.user_id = b.user_id
where b.user_id is null

Задача 10
--Постройте распределение студентов, которые никогда не платили, по регионам проживания (столбец region_name). Исключите студентов, у которых нет информации о регионе проживания, и выведите топ-5 городов по кол-ву студентов.
--Какую долю от всех неплативших студентов составляют неплатившие студенты из Москвы и Московской области?
select    region_name
        , count(*) as cnt
from skyeng_db.students a
    left join skyeng_db.payments b
        on a.user_id = b.user_id
where b.user_id is null
  and region_name is not null
group by region_name
order by cnt desc
limit 5

––––––––––––––––––––––––––––––––––––––––––––––

select    sum(case when region_name = 'Москва и Московская область' then 1.0 else 0.0 end) / count(*) as ratio_msk
from skyeng_db.students a
    left join skyeng_db.payments b
        on a.user_id = b.user_id
where b.user_id is null
  and region_name is not null