#Заполним БД

INSERT INTO status_users VALUES (1, 'visitors'),(2, 'instructor');
INSERT INTO ice_skates VALUES (1, '48', 50, 500),(2, '44', 50, 500),(3, '41', 50, 500),(4,' 39', 50, 500),(5, '50', 50, 500),(6, '49', 50, 500),(7, '46', 50, 500),
(8, '42', 50, 500),(9, '45', 50, 500),(10, '40', 50, 500);
INSERT INTO discount VALUES (1, 'silver', 5),(2, 'gold', 15),(3, 'platinum', 25);
INSERT INTO `users` VALUES (1, 'Михайлова', 'София', 'Игоревна', 'bdooley@yahoo.com', '9030060873'),(2, 'Фирсов', 'Владимир', 'Андреевич', 'dessie.mosciski@gmail.com', '9086612957'),
(3, 'Алешин', 'Матвей', 'Александрович', 'terry.tony@hotmail.com', '9895736381'),(4, 'Герасимова', 'Александра', 'Александровна', 'grimes.claudie@gmail.com', '9483721014'),
(5, 'Демидов', 'Артём', 'Егорович', 'lorine.greenholt@hotmail.com', '9747801271'),(6, 'Смирнов', 'Павел', 'Тимофеевич', 'rhoda.thompson@gmail.com', '9008174733'),
(7, 'Селиванова', 'Амира', 'Львовна', 'michelle78@hotmail.com', '9069361733'),(8, 'Попов', 'Илья', 'Тимурович', 'klocko.marcellus@yahoo.com', '9400429934'),
(9, 'Морозов', 'Савелий', 'Григорьевич', 'uwaelchi@hotmail.com', '9670513921'),(10, 'Смирнов', 'Даниил', 'Тимофеевич', 'ufahey@gmail.com', '9761438912');
INSERT INTO `profiles` (user_id, gender, birthday, ice_skate_size, personal_discount, category_users_id) VALUES (1,'f','1976-01-29',8,1,1),(2,'m','2006-04-22',9,1,2),(3,'m','1997-06-02',5,1,1),(4,'f','1973-09-20',8,1,1),
(5, 'm', '2007-03-20', 1, 2, 1),(6, 'm', '1970-10-01', 5, 3, 1),(7, 'w', '2002-03-20', 5, 3, 2),(8, 'm','2010-01-24', 8, 3, 1),(9, 'm', '1992-10-06', 5, 1, 1),(10, 'm', '2010-11-07', 8, 3, 1);
INSERT INTO sessions VALUES (1, '11:00 - 12:00', 1000, 30),(2, '13:00 - 14:00', 1000, 30),(3, '15:00 - 16:00', 1000, 30),(4, '18:00 - 19:00', 1100, 30),(5, '20:00 - 21:00', 1200, 30),(6, '22:00 - 23:00', 1500, 30);
INSERT INTO workout VALUES (1, 1, 2, 3, '2022-11-11', 3000), (2, 3, 7, 6, '2022-11-15', 3000),(3, 3, 2, 2, '2022-11-04', 3000),(4, 8, 7, 3, '2022-11-15', 3000),(5, 4, 2, 5, '2022-11-09', 3000),(6, 9, 2, 4, '2022-11-12', 3000),(7, 6, 7, 2, '2022-11-04', 3000),
(8, 4, 2, 6, '2022-11-12', 3000),(9, 10, 2, 4, '2022-11-13', 3000),(10, 1, 7, 2, '2022-11-15', 3000);
INSERT INTO  unregistered_visitors (id, ice_skate_size_id, session_id, created_at) VALUES (1, 1, 1, '2022-11-15'),(2, 5, 6, '2022-11-15'),(3, 3, 3,'2022-11-15'),(4, 9, 3,' 2022-11-15'),(5, 2, 5, '2022-11-15'),(6, 3, 1, '2022-11-15'),
(7, 7, 1, '2022-11-15'),(8, 2, 6, '2022-11-15'),(9, 6, 6, '2022-11-15'),(10, 8, 6, '2022-11-15');
INSERT INTO discount_cards (cardholder_user_id, card_number, discount_id) VALUES (1,'985272309',1), (2,'878813831',1), (3,'719016222',1), (4,'134976542',1), (5,'612427894',2), (6,'651049708',3),
(7,'601796510',3), (8,'554844452',3), (9,'587722612',1), (10,'156766953',3);
