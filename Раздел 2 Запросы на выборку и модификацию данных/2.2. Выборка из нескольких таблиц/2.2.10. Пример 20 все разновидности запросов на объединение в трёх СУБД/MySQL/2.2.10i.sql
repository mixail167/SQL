-- Задача 2.2.10.i: показать возможные варианты перестановки компьюте-ров по комнатам (компьютер не должен оказаться в той комнате, в кото-рой он сейчас стоит, не учитывать вместимость комнат).
SELECT `r_id`, `r_name`, `c_id`, `c_room`, `c_name` FROM `rooms` CROSS JOIN `computers` WHERE `r_id` != `c_room`