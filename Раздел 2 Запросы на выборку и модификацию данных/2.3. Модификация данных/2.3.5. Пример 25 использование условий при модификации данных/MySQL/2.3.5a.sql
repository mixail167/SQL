-- Задача 2.3.5.a{201}: добавить в базу данных информацию о том, что чита-тель с идентификатором 4 взял в библиотеке книги с идентификаторами 2 и 3 1 февраля 2015-го года, и планировал вернуть их не позднее 20-го июля 2015-го года; если текущая дата меньше 20-го июля 2015-го года, отметить выдачи как невозвращённые, если больше — как возвращён-ные.
INSERT INTO `subscriptions` ( `sb_id`, `s_id`, `b_id`, `sb_start`, `sb_finish`, `sb_is_active` ) VALUES ( 300, 4, 2, '2015-02-01', '2015-07-20', CASE WHEN CURDATE() < '2015-07-20' THEN (SELECT 'N') ELSE (SELECT 'Y') END ), ( 301, 4, 3, '2015-02-01', '2015-07-20', CASE WHEN CURDATE() < '2015-07-20' THEN (SELECT 'N') ELSE (SELECT 'Y') END )