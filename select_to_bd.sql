# Запрос с целью узнать, кто из пользователей относится к посетителям, а кто к инструкторам
SELECT users.id, users.firstname, users.lastname, status_users.category_users
FROM users
JOIN profiles
ON users.id = profiles.user_id 
JOIN status_users
ON status_users.id = profiles.category_users_id;

# Узнать дату тренировок и время сессии для зарегестрированных пользователей, запрос можно запускать отдельно
# для пользователей и инструкторов, а так же в совокупности.
SELECT us.id, us.firstname, us.lastname, st.category_users, w.data_workout, s.sessions_in_day
  FROM users AS us
  JOIN workout  AS w
    ON w.visitors_id = us.id
  JOIN profiles AS p
    ON us.id = p.user_id 
  JOIN status_users AS st
    ON st.id = p.category_users_id
  JOIN sessions AS s
    ON s.id = w.sessions_id
#ORDER BY w.data_workout #Сортировка по дате по необходимости

UNION 
 
SELECT us.id, us.firstname, us.lastname, st.category_users, w.data_workout, s.sessions_in_day
  FROM users AS us
  JOIN workout  AS w
    ON w.instructor_id = us.id
  JOIN profiles AS p
    ON us.id = p.user_id 
  JOIN status_users AS st
    ON st.id = p.category_users_id
  JOIN sessions AS s
    ON s.id = w.sessions_id;
#ORDER BY w.data_workout #Сортировка по дате по необходимости
    
# С помощью данного запроса мы можем узнать какое количество зарегистрированных и незарегистрированных пользователей
# будут кататься в определенную дату и определенный сеанс
SELECT     
COUNT(*) AS amount_visitors
FROM
    unregistered_visitors AS av
WHERE av.session_id  = 6 AND av.created_at = '2022-11-15'
GROUP BY av.session_id;

UNION

SELECT     
COUNT(*) AS amount_visitors
FROM
    workout AS w
WHERE w.sessions_id = 6 AND w.data_workout  = '2022-11-15'
GROUP BY w.sessions_id;

# Запрос с целью узнать по дате тренировки и id посетителя, общую сумму оказания услуг с учетом аренды, стоимостью тренировки и персональной скидки
SELECT us1.firstname,
	   us1.lastname,
	   ics.size_ice_skates AS lastname_instructor,
	   us2.lastname,
	   ((w.price + ics.price_rent) - ((w.price + ics.price_rent) * d.percent_discount / 100)) AS total_price
  FROM users AS us1
  JOIN workout AS w
	ON w.visitors_id = us1.id 
  JOIN profiles AS p 
	ON p.user_id = us1.id AND w.data_workout = '2022-11-04' AND p.user_id = 6
  JOIN discount AS d
    ON d.id = p.personal_discount
  JOIN ice_skates AS ics 
	ON p.ice_skate_size  = ics.id
  JOIN users AS us2
    ON w.instructor_id = us2.id;
