--cursor para ver todos los datos de cada sesion

do $$
	declare
		registro Record;
		Cur_datos Cursor for select * from niño inner join public.cliente on cliente_niño_id = id_cliente 
		inner join public.servicio on id_cliente = servicio_cliente_id 
		inner join public.niñera on servicio_niñera_id = id_niñera;
	begin
		open Cur_datos;
		fetch Cur_datos into registro;
		While (found) loop		
		Raise Notice 'Cliente: %; Niño: %; Sesión: %; Niñera: %; Fecha: %; Pago: %; Calificación: %; Inconveniente: %;',registro.nombre_cliente, registro.nombre_niño, registro.id_servicio, registro.nombre_niñera, registro.fecha_servicio, registro.pago_realizado_servicio, registro.calificacion_servicio, registro.inconveniente_servicio;
		fetch Cur_datos into registro;
		end loop;
end $$
language 'plpgsql';
