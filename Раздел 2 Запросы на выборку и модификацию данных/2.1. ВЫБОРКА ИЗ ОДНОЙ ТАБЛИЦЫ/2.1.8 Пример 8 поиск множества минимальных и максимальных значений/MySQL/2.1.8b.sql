-- Задача 2.1.8.b{44}: показать просто одну любую книгу, количество экзем-пляров которой максимально (равно максимуму по всем книгам).
SELECT `b_name`, `b_quantity` FROM `books` ORDER BY `b_quantity` DESC LIMIT 1
