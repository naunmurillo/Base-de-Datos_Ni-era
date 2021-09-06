create or replace function obtener_detalle_calificacion(servicio_client_id varchar (4))
RETURNS TABLE ( nombre_cliente varchar (20),
	cedula_niño varchar(10),
	nombre_niño varchar (20),
	nombre_niñera varchar(20),
	horas_servicio numeric,
	calificacion_servicio numeric(2))
as $BODY$
begin
	RETURN QUERY
	select cliente.nombre_cliente,
	niño.cedula_niño,
	niño.nombre_niño,
	niñera.nombre_niñera,
	sum(servicio.horas_servicio),
	ROUND(AVG(servicio.calificacion_servicio)::numeric,2)    
	from cliente inner join servicio on id_cliente=servicio_cliente_id
	inner join niñera on id_niñera=servicio_niñera_id 
	inner join niño on cliente_niño_id = cliente.id_cliente 
	where servicio.servicio_cliente_id = servicio_client_id 
	group by(cliente.nombre_cliente,niño.cedula_niño,niño.nombre_niño,niñera.nombre_niñera);

end
$BODY$ 
language plpgsql;

select obtener_detalle_calificacion('C003')