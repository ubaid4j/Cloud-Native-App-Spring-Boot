SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE TABLE  post;
TRUNCATE TABLE user;
SET FOREIGN_KEY_CHECKS = 1;

insert
	into user(birth_date, name)
values
	(sysdate(), 'ubaid ur rehman'),
	(sysdate(), 'attiq ur rehman'),
	(sysdate(), 'attif ur rehman');
	

INSERT INTO `post` (`id`,`detail`,`title`,`user_id`) VALUES (1,'Still a better story then a twilight','Story',1);
INSERT INTO `post` (`id`,`detail`,`title`,`user_id`) VALUES (2,'Still a better story then a twilight','Story 2',1);
INSERT INTO `post` (`id`,`detail`,`title`,`user_id`) VALUES (3,'Apple, Dell, Hp','Tech',2);
INSERT INTO `post` (`id`,`detail`,`title`,`user_id`) VALUES (4,'Pak-Indo','Atlas',3);
	