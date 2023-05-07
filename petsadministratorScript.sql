DROP DATABASE IF EXISTS petsadministrator;
CREATE DATABASE petsadministrator CHARACTER SET utf8mb4;
USE petsadministrator;

CREATE TABLE roles (
  id_rol INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE usuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(20) NOT NULL,
  apellido1 VARCHAR(20) NOT NULL,
  apellido2 VARCHAR(20),
  fecha_nacimiento DATE NOT NULL,
  email VARCHAR(50) NOT NULL UNIQUE,
  username VARCHAR(200) NOT NULL UNIQUE,
  password VARCHAR(200) NOT NULL,
  enabled INT(1) NOT NULL DEFAULT '1',
  fecha_registro DATE NOT NULL,
  id_rol INT NOT NULL,
  foreign key(id_rol) references roles(id_rol)
);

CREATE TABLE tarjetas (
  id_tarjeta INT(11) AUTO_INCREMENT PRIMARY KEY,
  numero INT(12),
  nombre_titular VARCHAR(20) NOT NULL,
  fecha_caducidad DATE NOT NULL,
  cvv INT(3) NOT NULL
);

CREATE TABLE direcciones (
  id_direccion INT AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(100),
  codigo_postal VARCHAR(6),
  localidad VARCHAR(20),
  calle VARCHAR(50),
  numero INT,
  piso INT(3),
  letra CHAR(2)
);

CREATE TABLE pedidos (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  fecha_realizacion DATE NOT NULL,
  estado VARCHAR(20),
  id_usuario INT NOT NULL,
  id_direccion INT NOT NULL,
  id_tarjeta INT NOT NULL,
  foreign key(id_usuario) references usuarios(id_usuario),
  foreign key(id_direccion) references direcciones(id_direccion),
  foreign key(id_tarjeta) references tarjetas(id_tarjeta)
);

CREATE TABLE tamanos (
  id_tamanos INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  imagen VARCHAR(100)
);

CREATE TABLE productos (
  id_productos INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  imagen VARCHAR(100),
  descripcion VARCHAR(600) NOT NULL,
  precio DEC(9,2),
  stock INT NOT NULL,
  id_tamanos INT NOT NULL,
  foreign key(id_tamanos) references tamanos(id_tamanos)
);

CREATE TABLE usuarios_con_direcciones (
  id_usuario INT NOT NULL,
  id_direccion INT NOT NULL,
  foreign key(id_usuario) references usuarios(id_usuario),
  foreign key(id_direccion) references direcciones(id_direccion),
  PRIMARY KEY(id_usuario, id_direccion)
);

CREATE TABLE usuarios_con_tarjetas (
  id_usuario INT NOT NULL,
  id_tarjeta INT NOT NULL,
  foreign key(id_usuario) references usuarios(id_usuario),
  foreign key(id_tarjeta) references tarjetas(id_tarjeta),
  PRIMARY KEY(id_usuario, id_tarjeta)
);

CREATE TABLE productos_en_pedido (
  numero_orden INT AUTO_INCREMENT PRIMARY KEY,
  cantidad INT,
  precio DEC(9,2),
  id_pedido INT NOT NULL,
  id_producto INT NOT NULL,
  foreign key(id_pedido) references pedidos(id_pedido),
  foreign key(id_producto) references productos(id_productos)
);

-- CREATE USER petsadministrator IDENTIFIED BY 'petsadministrator';
-- grant all privileges on petsadministrator.* to petsadministrator; 
-- FLUSH PRIVILEGES;

-- INSERTAR ROLES

INSERT INTO roles VALUES(1, 'Admin');
INSERT INTO roles VALUES(2, 'Cliente');

-- INSERTAR USUARIOS

INSERT INTO usuarios VALUES(1, 'María', 'Pérez', 'Pérez', '1993-04-07', 'mperez@gmail.com', 'mperez','$2a$10$aMS69IPQGlbZYjxvcJuZGuVDvCS/qJh5JDjBajWbTvHns8DfT7tMO', 1, '2023-01-07', 2); 
INSERT INTO usuarios VALUES(2, 'Juan', 'Gómez', 'López', '1963-03-17', 'jgomez@gmail.com', 'jgomez','$2a$10$aMS69IPQGlbZYjxvcJuZGuVDvCS/qJh5JDjBajWbTvHns8DfT7tMO', 1,'2023-01-17', 2); 
INSERT INTO usuarios VALUES(3, 'Daniel', 'Ruiz', 'Ortega', '1989-11-28', 'druiz@gmail.com', 'druiz','$2a$10$aMS69IPQGlbZYjxvcJuZGuVDvCS/qJh5JDjBajWbTvHns8DfT7tMO', 0,'2023-02-01', 2); 
INSERT INTO usuarios VALUES(4, 'Laura', 'Barrio', 'Marín', '1980-09-15', 'lbarrio@gmail.com', 'lbarrio','$2a$10$aMS69IPQGlbZYjxvcJuZGuVDvCS/qJh5JDjBajWbTvHns8DfT7tMO', 1,'2023-01-22', 2); 
INSERT INTO usuarios VALUES(5, 'Sergio', 'Martinez', 'Rivera', '1991-04-07', 'sergio4884mr@gmail.com', 'smartinez' ,'$2a$10$aMS69IPQGlbZYjxvcJuZGuVDvCS/qJh5JDjBajWbTvHns8DfT7tMO', 1,'2023-01-01', 1); 
INSERT INTO usuarios VALUES(6, 'Carlos', 'Rábago', 'Torcates', '1990-09-15', 'carlosmiguel40@gmail.com', 'crabago','$2a$10$aMS69IPQGlbZYjxvcJuZGuVDvCS/qJh5JDjBajWbTvHns8DfT7tMO', 1,'2023-01-22', 2); 
-- INSERTAR TARJETAS

INSERT INTO tarjetas VALUES(1, 1544615, 'María Pérez Pérez', '2023-04-07', 485);
INSERT INTO tarjetas VALUES(2, 5225595, 'Daniel Ruiz Ortega', '2025-02-09', 367);
INSERT INTO tarjetas VALUES(3, 4752538, 'Laura Barrio Marín', '2024-04-11', 456);
INSERT INTO tarjetas VALUES(4, 7752538, 'Juan Silva Perez', '2024-05-11', 741);
INSERT INTO tarjetas VALUES(5, 1234567, 'Petra Lopez Ruiz', '2024-06-11', 123);
INSERT INTO tarjetas VALUES(6, 5678978, 'Carlos Rábago Díaz', '2024-07-11', 743);
INSERT INTO tarjetas VALUES(7, 4567456, 'Sergio Martinez', '2024-08-11', 941);

-- INSERTAR DIRECCIONES

INSERT INTO direcciones VALUES(1, 'Trabajo','50000', 'Zaragoza', 'Calle España', 15, 2, 'A');
INSERT INTO direcciones VALUES(2, 'Casa','50002', 'Zaragoza', 'Calle Málaga', 5, 3, 'B');
INSERT INTO direcciones VALUES(3, 'Pueblo','19208', 'Guadalajara', 'Calle Mayor', 1, 2, '');
INSERT INTO direcciones VALUES(4, 'Casa','28001', 'Madrid', 'Calle Pez', 3, 3, 'B');
INSERT INTO direcciones VALUES(5, 'Casa','28007', 'Madrid', 'Calle Alcalá', 59, 13, 'H');
INSERT INTO direcciones VALUES(6, 'Casa Mamá','19008', 'Guadalajara', 'Avenida del Ejército', 45, 0, '');

-- INSERTAR TAMANOS

INSERT INTO tamanos VALUES(1, 'Pequeño', 'tamano_p.png');
INSERT INTO tamanos VALUES(2, 'Mediano', 'tamano_m.png');
INSERT INTO tamanos VALUES(3, 'Grande', 'tamano_g.png');

-- INSERTAR PRODUCTOS

INSERT INTO productos VALUES(1, 'Chubasquero Marvel', 'chubasquero_marvel.jpg', 'El chubasquero del Capitán América de Disney es ideal para abrigar y proteger a tu perro de la lluvia para que se mantenga seco mientras luce como su héroe favorito.', 20.99, 50, 1);
INSERT INTO productos VALUES(2, 'Abrigo Verde de plumas', 'abrigo_verde_plumas.jpg', 'A veces ni el pelaje de los perros es rival contra el frío. Por eso, el abrigo de plumas verde Outech es la opción idónea si quieres que tu mejor amigo se mantenga abrigado durante los paseos que deis y las actividades que realicéis a pesar de las bajas temperaturas.', 25.99, 100, 2);
INSERT INTO productos VALUES(3, 'Chaqueta Vaquera', 'chaqueta_vaquera.jpg', 'Si te gustan las prendas de tela vaquera y quieres que tu perro tenga un estilo parecido al tuyo, esta chaqueta con estampado de Minnie es un accesorio ideal. No solo protege al animal del frío, sino que lo hará lucir aún más llamativo.', 22.99, 75, 1);
INSERT INTO productos VALUES(4, 'Abrigo rojo', 'abrigo_rojo.jpg', 'Outech tiene para tu perro un simpático abrigo de color rojo, un accesorio que mantendrá a tu peludo amigo calentito durante esos fríos días de invierno y lluviosos. Su material es totalmente de poliéster, lo que le sentará bien a tu mascota debido a su acolchado suave, además es impermeable.', 15.99, 45, 1);
INSERT INTO productos VALUES(5, 'Sudadera con capucha', 'sudadera_capucha.jpg', '¿Harto de no saber donde meter suficientes bolsas higiénicas con las que poder recoger cualquiera de las deposiciones que hace tu perro? La sudadera Nayeco con capucha y bolsillo porta bolsas te permite llevar un extra de estas bolsas higiénicas de forma cómoda.', 12.95, 45, 3);
INSERT INTO productos VALUES(6, 'Sudadera Star Wars', 'sudadera_starwars.jpg', 'Si eres fan de la saga de Star Wars, de seguro conoces al personaje de Grogu, popularmente llamado baby Yoda, por su gran parecido con aquel maestro Jedi. For Fan Pets sabe que ese es uno de los personajes favoritos de grandes y chicos, así que por eso ha diseñado esta hermosa sudadera para perros de Grogu.', 19.95, 45, 2);
INSERT INTO productos VALUES(7, 'Abrigo Granate', 'abrigo_granate.jpg', 'A veces el pelaje de los perros no es suficiente como para hacer frente al frío. Por eso, el abrigo Outech de color granate con capucha ayuda a mantener a tu mejor amigo protegido de las bajas temperaturas gracias a un cómodo forro polar que lleva incluido.', 20.99, 45, 1);
INSERT INTO productos VALUES(8, 'Jersey geometrico', 'jersey_geometrico.jpg',  'Si buscas una prenda que abrigue a tu perro cuando salga a la calle y que a la vez respete el medio ambiente, entonces necesitas el jersey Nayeco Ecoline Geometric, fabricado con materiales reciclados y disponible en varias tallas.', 12.99, 45, 2);
INSERT INTO productos VALUES(9, 'Chubasquero Disney Minnie', 'chubasquero_disney.jpg', 'Minnie es una de las ratoncitas más coquetas y presumidas de la cultura pop, así que este impermeable para perros con diseño de la novia de Mickey Mouse es una necesidad si quieres que tu amigo peludo se proteja de la lluvia sin dejar de llamar la atención.', 19.95, 45, 1);
INSERT INTO productos VALUES(10, 'Chubasquero negro', 'chubasquero_negro.jpg', 'Outech presenta este chubasquero deportivo para perros de todas las razas, elaborado con materiales resistentes, impermeables y de gran calidad, ideales para las caminatas bajo la lluvia.', 9.95, 45, 3);

-- USUARIOS CON DIRECCIONES

INSERT INTO usuarios_con_direcciones VALUES(1, 1);
INSERT INTO usuarios_con_direcciones VALUES(1, 2);
INSERT INTO usuarios_con_direcciones VALUES(2, 4);
INSERT INTO usuarios_con_direcciones VALUES(2, 3);
INSERT INTO usuarios_con_direcciones VALUES(3, 3);
INSERT INTO usuarios_con_direcciones VALUES(3, 6);
INSERT INTO usuarios_con_direcciones VALUES(4, 4);
INSERT INTO usuarios_con_direcciones VALUES(4, 5);
INSERT INTO usuarios_con_direcciones VALUES(5, 5);
INSERT INTO usuarios_con_direcciones VALUES(5, 6);

-- USUARIOS CON TARJETAS

INSERT INTO usuarios_con_tarjetas VALUES(1, 1);
INSERT INTO usuarios_con_tarjetas VALUES(1, 2);
INSERT INTO usuarios_con_tarjetas VALUES(2, 3);
INSERT INTO usuarios_con_tarjetas VALUES(2, 5);
INSERT INTO usuarios_con_tarjetas VALUES(3, 2);
INSERT INTO usuarios_con_tarjetas VALUES(3, 6);
INSERT INTO usuarios_con_tarjetas VALUES(4, 3);
INSERT INTO usuarios_con_tarjetas VALUES(4, 7);
INSERT INTO usuarios_con_tarjetas VALUES(5, 4);
INSERT INTO usuarios_con_tarjetas VALUES(5, 5);

-- INSERTAR PEDIDOS

INSERT INTO pedidos VALUES(1, '2023-01-07', 'Terminado', 1, 1, 3);
INSERT INTO pedidos VALUES(2, '2023-01-07', 'Terminado', 5, 1, 3);

-- PRODUCTOS EN PEDIDO

INSERT INTO productos_en_pedido VALUES(1, 1, 59.99, 1, 1);
INSERT INTO productos_en_pedido VALUES(2, 1, 69.99, 1, 4);
