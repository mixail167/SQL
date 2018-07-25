-- Задача 2.2.4.a{92}: показать список читателей, у которых сейчас на руках нет книг (использовать JOIN).
SELECT `subscribers`.`s_id`, `s_name` FROM `subscribers` LEFT OUTER JOIN `subscriptions` ON `subscribers`.`s_id` = `subscriptions`.`s_id` GROUP BY `subscribers`.`s_id` HAVING COUNT(IF(`sb_is_active` = 'Y', `sb_is_active`, NULL)) = 0