USE Ventas_Tech_DB

-- DROPS
DROP TABLE IF EXISTS dbo.DimVentas;
DROP TABLE IF EXISTS dbo.DimProductos;
DROP TABLE IF EXISTS dbo.DimCategoria;
DROP TABLE IF EXISTS dbo.DimCliente;


--Creamos las tablas de dimensiones

CREATE TABLE dbo.DimCategoria (
   id_Categoria INT PRIMARY KEY,
   Nombre_Categoria NVARCHAR(100) NOT NULL,
   Descripcion NVARCHAR(200) NOT NULL
   );

   CREATE TABLE dbo.DimCliente (
   id_Cliente INT PRIMARY KEY,
   Nombre_Cliente VARCHAR(100) NOT NULL,
   Email NVARCHAR(100) UNIQUE,
   Ciudad NVARCHAR (150),
   Fecha_Registro DATE NOT NULL
   );

   CREATE TABLE dbo.DimProductos (
   Id_Producto INT PRIMARY KEY,
   Nombre_Producto VARCHAR(150) NOT NULL,
   Id_Categoria INT FOREIGN KEY REFERENCES DimCategoria(Id_Categoria)
   );

   CREATE TABLE dbo.DimVentas (
   Id_Ventas INT PRIMARY KEY,
   Fecha_Venta DATE NOT NULL,
   Precio_Unitario DECIMAL(10,2) NOT NULL,
   Id_Cliente INT FOREIGN KEY REFERENCES DimCliente(Id_Cliente),
   Id_Producto INT FOREIGN KEY REFERENCES DimProductos(Id_Producto),
   Cantidad INT NOT NULL
   );

 SELECT * FROM dbo.DimVentas

   -- ingresamos la informacion a las tablas, primero en categoria 

INSERT INTO dbo.DimCategoria (id_Categoria, Nombre_Categoria, Descripcion)
VALUES (1, 'Periféricos de Computadora', 'Teclados, mouses y accesorios para potenciar tu PC.');

INSERT INTO dbo.DimCategoria (id_Categoria, Nombre_Categoria, Descripcion)
VALUES (2, 'Accesorios para Celular', 'Fundas, cargadores y protección para tu smartphone.');

INSERT INTO dbo.DimCategoria (id_Categoria, Nombre_Categoria, Descripcion)
VALUES (3, 'Audio Portátil', 'Auriculares y parlantes inalámbricos para llevar a todos lados.');

INSERT INTO dbo.DimCategoria (id_Categoria, Nombre_Categoria, Descripcion)
VALUES (4, 'Tecnología para el Hogar', 'Dispositivos inteligentes y domótica para tu casa.');

-- chequeo como quedo

SELECT * FROM dbo.DimCategoria;

-- ingresamos la info en la tabla de clientes

INSERT INTO dbo.DimCliente (id_Cliente, Nombre_Cliente, Email, Ciudad, Fecha_Registro)
VALUES (101, 'CHARDON AGUSTINA', 'achardon@gmail.com', 'Mar del Plata', '2001-09-15');

INSERT INTO dbo.DimCliente (id_Cliente, Nombre_Cliente, Email, Ciudad, Fecha_Registro)
VALUES (102, 'GIMENEZ ESTER', 'estercita_g@gmail.com', 'Córdoba', '2020-11-08');

INSERT INTO dbo.DimCliente (id_Cliente, Nombre_Cliente, Email, Ciudad, Fecha_Registro)
VALUES (103, 'ORTIZ JUAN', 'JO2005@gmail.com', 'Formosa', '2005-03-22');

INSERT INTO dbo.DimCliente (id_Cliente, Nombre_Cliente, Email, Ciudad, Fecha_Registro)
VALUES (104, 'BALLESTER MARCELO', 'Marce_balles@gmail.com', 'Mendoza', '2002-01-02');

INSERT INTO dbo.DimCliente (id_Cliente, Nombre_Cliente, Email, Ciudad, Fecha_Registro)
VALUES (105, 'RODRIGUEZ LAUTARO', 'rodriguezlautaro@gmail.com', 'Neuquén', '2001-07-16');

-- chequeo como ingresó

SELECT * FROM dbo.DimCliente;

-- Ahora voy con DimProducto pero antes debo agregar una fila que me faltó

ALTER TABLE dbo.DimProductos
ADD Precio DECIMAL(10,2) NOT NULL;

-- veo que se haya insertado

SELECT * FROM dbo.DimProductos;

-- Sigo con el insert de La tabla Dim.Productos

-- Categoría 1: Periféricos de Computadora
INSERT INTO dbo.DimProductos (Id_Producto, Nombre_Producto, Id_Categoria, Precio)
VALUES (3580, 'Mouse Inalámbrico', 1, 15000.00);

INSERT INTO dbo.DimProductos (Id_Producto, Nombre_Producto, Id_Categoria, Precio)
VALUES (3581, 'Teclado Estándar USB', 1, 12800.00);

INSERT INTO dbo.DimProductos (Id_Producto, Nombre_Producto, Id_Categoria, Precio)
VALUES (3582, 'Auriculares con Micrófono', 1, 22000.00);

INSERT INTO dbo.DimProductos (Id_Producto, Nombre_Producto, Id_Categoria, Precio)
VALUES (3583, 'Webcam HD', 1, 18700.00);

-- Categoría 2: Accesorios para Celular
INSERT INTO dbo.DimProductos (Id_Producto, Nombre_Producto, Id_Categoria, Precio)
VALUES (4201, 'Cargador de Pared (20W/25W)', 2, 12000.00);

INSERT INTO dbo.DimProductos (Id_Producto, Nombre_Producto, Id_Categoria, Precio)
VALUES (4202, 'Funda Protectora', 2, 12000.00);

INSERT INTO dbo.DimProductos (Id_Producto, Nombre_Producto, Id_Categoria, Precio)
VALUES (4203, 'Batería Portátil (Power Bank)', 2, 38000.00);

INSERT INTO dbo.DimProductos (Id_Producto, Nombre_Producto, Id_Categoria, Precio)
VALUES (4204, 'Cable de Carga USB / Tipo C', 2, 7500.00);

-- Categoría 3: Audio Portátil
INSERT INTO dbo.DimProductos (Id_Producto, Nombre_Producto, Id_Categoria, Precio)
VALUES (5501, 'Auriculares Bluetooth In-Ear', 3, 41250.00);

INSERT INTO dbo.DimProductos (Id_Producto, Nombre_Producto, Id_Categoria, Precio)
VALUES (5502, 'Parlante Portátil Bluetooth', 3, 50000.00);

INSERT INTO dbo.DimProductos (Id_Producto, Nombre_Producto, Id_Categoria, Precio)
VALUES (5503, 'Radio Portátil AM/FM', 3, 20300.00);

INSERT INTO dbo.DimProductos (Id_Producto, Nombre_Producto, Id_Categoria, Precio)
VALUES (5504, 'Adaptador Bluetooth para Auto', 3, 13000.00);

-- Categoría 4: Tecnología para el Hogar
INSERT INTO dbo.DimProductos (Id_Producto, Nombre_Producto, Id_Categoria, Precio)
VALUES (6801, 'Foco LED Inteligente Wi-Fi', 4, 20000.00);

INSERT INTO dbo.DimProductos (Id_Producto, Nombre_Producto, Id_Categoria, Precio)
VALUES (6802, 'Zapatilla Eléctrica con Puertos USB', 4, 28000.00);

INSERT INTO dbo.DimProductos (Id_Producto, Nombre_Producto, Id_Categoria, Precio)
VALUES (6803, 'Reloj Despertador Digital', 4, 15000.00);

INSERT INTO dbo.DimProductos (Id_Producto, Nombre_Producto, Id_Categoria, Precio)
VALUES (6804, 'Balanza Digital de Cocina', 4, 9540.00);


-- chequeamos como queda...

SELECT * FROM dbo.DimProductos;

-- continuo con los inserts para la dimVentas

INSERT INTO dbo.DimVentas (Id_Ventas, Fecha_Venta, Precio_Unitario, Id_Cliente, Id_Producto, Cantidad)
VALUES (1001, '2026-05-01', 18700.00, 101, 3583, 2);

INSERT INTO dbo.DimVentas (Id_Ventas, Fecha_Venta, Precio_Unitario, Id_Cliente, Id_Producto, Cantidad)
VALUES (1002, '2026-05-03', 7500.00, 102, 4204, 3);

INSERT INTO dbo.DimVentas (Id_Ventas, Fecha_Venta, Precio_Unitario, Id_Cliente, Id_Producto, Cantidad)
VALUES (1003, '2026-05-04', 9540.00, 103, 6804, 1);

INSERT INTO dbo.DimVentas (Id_Ventas, Fecha_Venta, Precio_Unitario, Id_Cliente, Id_Producto, Cantidad)
VALUES (1004, '2026-05-07', 15000.00, 104, 3580, 1);

INSERT INTO dbo.DimVentas (Id_Ventas, Fecha_Venta, Precio_Unitario, Id_Cliente, Id_Producto, Cantidad)
VALUES (1005, '2026-05-09', 22000.00, 105, 3582, 1);

INSERT INTO dbo.DimVentas (Id_Ventas, Fecha_Venta, Precio_Unitario, Id_Cliente, Id_Producto, Cantidad)
VALUES (1006, '2026-05-18', 12000.00, 102, 4202, 7);

INSERT INTO dbo.DimVentas (Id_Ventas, Fecha_Venta, Precio_Unitario, Id_Cliente, Id_Producto, Cantidad)
VALUES (1007, '2026-05-21', 20000.00, 103, 6801, 12);

INSERT INTO dbo.DimVentas (Id_Ventas, Fecha_Venta, Precio_Unitario, Id_Cliente, Id_Producto, Cantidad)
VALUES (1008, '2026-05-23', 13000.00, 104, 5504, 1);

INSERT INTO dbo.DimVentas (Id_Ventas, Fecha_Venta, Precio_Unitario, Id_Cliente, Id_Producto, Cantidad)
VALUES (1009, '2026-05-24', 28000.00, 101, 6802, 1);

INSERT INTO dbo.DimVentas (Id_Ventas, Fecha_Venta, Precio_Unitario, Id_Cliente, Id_Producto, Cantidad)
VALUES (1010, '2026-05-30', 38000.00, 105, 4203, 1);

-- chequeamos ...

SELECT * FROM dbo.DimVentas;