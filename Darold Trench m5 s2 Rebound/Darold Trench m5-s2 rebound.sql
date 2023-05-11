create table Clientes(
	id serial primary key,
	nombre varchar(50) not null,
	ciudad varchar(50) not null
);

create table Producto(
	id serial primary key,
	nombre varchar(50) not null,
	precio integer not null check(precio>=0)
);

create table factura_cliente(
	id serial primary key,
	fecha date not null, 
	id_cliente integer not null check(id_cliente>=0),
	foreign key (id_cliente) references Clientes(id)
);

create table detalle_producto(
	id_producto integer not null,
	id_factura_cliente integer not null,
	articulo varchar(50) not null,
	cantidad integer not null check(cantidad>=0),
	foreign key(id_producto) references Producto(id),
	foreign key(id_factura_cliente) references factura_cliente(id),
	primary key (id_producto, id_factura_cliente)	
);

insert into Clientes(nombre, ciudad) values
('Martin', 'Santiago'), ('Herman', 'Valparaiso'), ('Pedro', 'Concepcion');

insert into Producto(nombre, precio) values
('Red', 35), ('Raqueta', 65), ('Paq-3', 4), ('Paq-6', 5), ('Funda', 10);

insert into factura_cliente(fecha, id_cliente) values
('23-02-2020', 1), ('25-02-2020',2), ('27-02-2020',3);

insert into detalle_producto(id_producto, id_factura_cliente, articulo, cantidad)values
(1, 6, 'Red', 3), (2, 6, 'Raqueta', 6),(3, 6, 'Paq-3', 8), (4, 7, 'Paq-6', 4), (2, 8, 'Raqueta', 2), (5, 8, 'Funda', 2);

select * from detalle_producto;