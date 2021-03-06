-- Задача 4.2.2.a{338}: создать триггер, допускающий регистрацию в библио-теке только таких читателей, имя которых содержит хотя бы два слова и одну точку.
drop trigger if exists `sbsrs_cntrl_name_ins2`;
drop trigger if exists `sbsrs_cntrl_name_upd2`;
DELIMITER $$ 
CREATE TRIGGER `sbsrs_cntrl_name_ins2` 
BEFORE INSERT ON `subscribers` 
FOR EACH ROW 
	BEGIN 
		IF ((CAST(NEW.`s_name` AS CHAR CHARACTER SET cp1251) REGEXP CAST('^[a-zA-Zа-яА-ЯёЁ]+([\ ]{1}[a-zA-Zа-яА-ЯёЁ]{1,2}[.]{1}){1,}$' AS CHAR CHARACTER SET cp1251)) = 0) THEN 
            SET @msg = CONCAT('Subscribers name should contain at least two words and one point, but the following name violates this rule: ', NEW.`s_name`); 
            SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = @msg, MYSQL_ERRNO = 1001; 
		END IF; 
	END; 
$$
CREATE TRIGGER `sbsrs_cntrl_name_upd2` 
BEFORE UPDATE ON `subscribers` 
FOR EACH ROW 
	BEGIN 
		IF ((CAST(NEW.`s_name` AS CHAR CHARACTER SET cp1251) REGEXP CAST('^[a-zA-Zа-яА-ЯёЁ]+([\ ]{1}[a-zA-Zа-яА-ЯёЁ]{1,2}[.]{1}){1,}$' AS CHAR CHARACTER SET cp1251)) = 0) THEN 
			SET @msg = CONCAT('Subscribers name should contain at least two words and one point, but the following name violates this rule: ', NEW.`s_name`); 
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = @msg, MYSQL_ERRNO = 1001; 
		END IF; 
	END; 
$$ 
DELIMITER ;
set SQL_SAFE_UPDATES = 0;
insert into subscribers (s_name) values('Ковалев Mи.');
set SQL_SAFE_UPDATES = 1;