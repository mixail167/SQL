-- Задание 2.1.10.TSK.A: переписать решение 2.1.10.c так, чтобы при под-счёте возвращённых и невозвращённых книг СУБД оперировала исход-ными значениями поля sb_is_active (т.е. Y и N), а преобразование в «Returned» и «Not returned» происходило после подсчёта.
select `sb_is_active` as `isReturned`, count(*) as `count` from `subscriptions` group by `sb_is_active`;
SELECT IF(`isReturned` = 'Y', 'Not returned', 'Returned') AS `status`, `count` from(select `sb_is_active` as `isReturned`, count(*) as `count` from `subscriptions` group by `sb_is_active`) as alias