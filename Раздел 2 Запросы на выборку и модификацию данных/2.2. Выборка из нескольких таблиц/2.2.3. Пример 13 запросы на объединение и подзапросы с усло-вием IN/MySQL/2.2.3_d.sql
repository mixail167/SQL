-- Задача 2.2.3.d{87}: показать список читателей, никогда не бравших в биб-лиотеке книги (не использовать JOIN).
SELECT `s_id`, `s_name` FROM `subscribers` WHERE `s_id` NOT IN (SELECT DISTINCT `s_id` FROM `subscriptions`)