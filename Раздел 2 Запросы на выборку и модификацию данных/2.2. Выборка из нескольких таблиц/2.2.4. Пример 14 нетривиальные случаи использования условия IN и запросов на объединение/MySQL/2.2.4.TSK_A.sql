-- Задание 2.2.4.TSK.A: показать список книг, ни один экземпляр которых сейчас не находится на руках у читателей.
SELECT `b_id`, `b_name` FROM `books` WHERE `b_id` NOT IN (SELECT DISTINCT `b_id` FROM `subscriptions` WHERE `sb_is_active` = 'Y')