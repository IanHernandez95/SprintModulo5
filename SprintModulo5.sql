#Creacion de Base de Dato
CREATE DATABASE telovendo_sprint;

#Usar Base de Dato
USE telovendo_sprint;

#Creacion tabla de Proovedores
CREATE TABLE Proveedores(
	ID_Proveedor INT AUTO_INCREMENT NOT NULL,
    Rep_Legal VARCHAR(45) NOT NULL,
    Nombre_Corporativo VARCHAR(45) NOT NULL,
    Telefono1_Nombre VARCHAR(45) NOT NULL,
    Telefono2_Nombre VARCHAR(45) NOT NULL,
    Categoria_Prod VARCHAR(45) NOT NULL,
    Correo_Electronico VARCHAR(45) NOT NULL,    
    PRIMARY KEY(ID_Proveedor) 
);

#Modificacion del primer numero del autoincrement
ALTER TABLE Proveedores
AUTO_INCREMENT = 101;

#Creacion de Registro Proveedores
INSERT INTO Proveedores(Rep_Legal, Nombre_Corporativo, Telefono1_Nombre, Telefono2_Nombre, Categoria_Prod, Correo_Electronico )
VALUES
('Gonzalo Parra','U-Land', '872873287 - Juan Garces','975124512 - Maria Lopez','Productos Fotograficos','tgh@gmail.com'),
('Raul Mateluna','Electro Mechazotz','983378975 - Marcelo Tapia','912657485 - Cristina Soler','Articulos Computacionales','jkr@gmail.com'),
('Jose Jaime','Espace Guéraga','983539844 - Marco Perez','995751236- Marcela Martel','Articulos Musicales','art@gmail.com'),
('Valeria Rodriguez','Acme','986894564 - Felipe Cortes','978459621 - Ana Avila','Repuestos Electronicos','bnv@gmail.com'),
('Cristobal Rodriguez','Tecnytek','983614873 - Jaime Marcel','930125067 - Sara Saavedra','Articulos de Audio','yrt@gmail.com');

SELECT * FROM Proveedores;

#Creacion tabla de Clientes
CREATE TABLE Clientes(
	ID_Cliente INT AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(45) NOT NULL,
    Apellido VARCHAR(45) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID_Cliente)
);

#Creacion de registro de Clientes
INSERT INTO Clientes(Nombre, Apellido, Direccion)
VALUES
('Maria','Gutierrez','Viana 908, Viña del Mar'),
('Romina','Hasell','Alvarez 77, Viña del Mar'),
('Claudio','Reyes','Av Playa Ancha 78, Valparaiso'),
('Alberto','Vidal','Errazuriz 657, Valparaiso'),
('Boris','Riquelme','Colon 23, Valparaiso');

SELECT * FROM Clientes;

#Creacion tabla de Productos
CREATE TABLE Productos (
	ID_Producto INT AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(45) NOT NULL,
    Stock INT NOT NULL,
	Precio INT NOT NULL, 
    Categoria VARCHAR(45) NOT NULL, 
    Proveedor VARCHAR(45) NOT NULL,
    Color VARCHAR(45) NOT NULL,
    PRIMARY KEY (ID_Producto)
);

#Modificacion de numero de inicio del autoincrement
ALTER TABLE Productos
AUTO_INCREMENT = 1001;

#Creacion de registro de Productos
INSERT INTO Productos (Nombre, Stock, Precio, Categoria, Proveedor, Color)
VALUES
('Camara Fotografica', 46, 350000,'Articulos Fotograficos','U-Land','Negro'),
('Lente Gran Angular', 46, 80000,'Articulos Fotograficos','U-Land','Negro'),
('Placa Base Asus B450', 30, 350000,'Articulos Computacionales','Electro Mechazotz','Blanco'),
('Tarjeta de Video 3060ti', 2, 550000,'Articulos Computacionales','Electro Mechazotz','Negro'),
('Trompeta', 40, 50000,'Articulos Musicales','Espace Guéraga','Negro'),
('Guitarra Acustica',55, 420000,'Articulos Musicales','Espace Guéraga','Cafe'),
('Tira Led Wifi', 140, 16000,'Repuestos Electronicos','Acme','Multicolor'),
('Bateria Portable 35000W', 35, 20000,'Repuestos Electronicos','Acme','Negro'),
('Audifonos Inalambricos BOSE', 12, 35000,'Articulos de Audio','Tecnytek','Negro'),
('DAC convertos audio profesional', 30, 350000,'Articulos Fotograficos','U-Land','Negro');

SELECT * FROM Productos;

#Cuál es la categoría de productos que más se repite
SELECT Categoria, count(Categoria) AS Repeticion FROM Productos GROUP BY Categoria LIMIT 1;

#Cuáles son los productos con mayor stock
SELECT * FROM Productos WHERE Stock = (SELECT MAX(Stock) FROM Productos);


#Qué color de producto es más común en nuestra tienda
SELECT Color, count(Color) AS Repeticion FROM Productos GROUP BY Color LIMIT 1;

#Cual o cuales son los proveedores con menor stock de productos.
SELECT Proveedor, SUM(Stock) AS Total_Stock FROM Productos GROUP BY Proveedor ORDER BY Total_Stock ASC LIMIT 1;

#Cambien la categoría de productos más popular por ‘Electrónica y computación’
SET SQL_SAFE_UPDATES = 0;
UPDATE Productos 
SET Categoria = 'Electrónica y computación'
WHERE Categoria = 'Articulos Fotograficos'