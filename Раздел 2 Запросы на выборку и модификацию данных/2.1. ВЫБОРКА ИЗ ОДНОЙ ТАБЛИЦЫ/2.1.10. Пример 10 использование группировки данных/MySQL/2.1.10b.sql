-- Задача 2.1.10.b{62}: показать по каждому году, сколько читателей в год вос-пользовалось услугами библиотеки.
SELECT YEAR(`sb_start`) AS `year`, COUNT(DISTINCT `s_id`) AS `subscribers` FROM `subscriptions` GROUP BY `year` ORDER BY `year`