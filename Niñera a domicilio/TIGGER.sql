--trigger que hace una rebaja de 10 dolares a los clientes que recibieron un mal servicio

create or replace function malservicio_niñera() returns trigger 
as
$$
declare
servi VARCHAR(10);
quejas numeric;
begin 
	SELECT new.id_servicio FROM servicio
	INTO servi;		
	select new.calificacion_servicio from servicio
	into quejas;
	if (quejas <= 2)then
	UPDATE servicio SET pago_realizado_servicio = new.pago_realizado_servicio - 10.00
	WHERE id_servicio = servi;
END IF;    
	RETURN new;
  END;
$$
language plpgsql;


create trigger descuento_malservicio after insert
on servicio
for each row
execute procedure  malservicio_niñera();


insert into servicio values ('S018', 30.00, 1, 1, '2021-06-08', 'Lo dejó comer dulces cuando le dije que no podia', 2, 'C001', 'N001');

select * from servicio where id_servicio = 'S018';


delete from servicio where id_servicio = 'S018';
drop trigger descuento_malservicio on servicio;
DROP FUNCTION malservicio_niñera();