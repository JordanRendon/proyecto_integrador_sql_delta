select users.id as 'id', users.name as 'nombre', users.description as 'descripcion usuario', users.cellphone as 'Celular',
cities.name as 'ciudad', the_address.address as 'Direccion hogar', users.date_of_birth as 'fecha de nacimiento'
from users
 join the_address on the_address.user_id = users.id
 join cities on cities.id = the_address.city_id
 where date_of_birth between '1990-01-01' and '1999-01-01';