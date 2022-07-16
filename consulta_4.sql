select users.id as 'id', users.name as 'nombre', users.email as 'correo', users.cellphone as 'celular', news.title as 'titulo de noticia',
news.description as 'descripcion noticia', news.date as 'fecha de publicaicon'
from users
join news on news.user_id = users.id
where news.id < 5;