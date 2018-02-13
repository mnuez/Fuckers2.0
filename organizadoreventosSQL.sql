CREATE TABLE IF NOT EXISTS usuario (
	id BigInt UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(30) NOT NULL,
	apellido1 VARCHAR(50) NOT NULL,
	apellido2  VARCHAR(50) NOT NULL,
	ciudad VARCHAR(100) NOT NULL,
	telefono VARCHAR(11) NOT NULL,
	email VARCHAR(4000) NOT NULL,
	dni VARCHAR(15) UNIQUE);

CREATE TABLE IF NOT EXISTS transporte (
	id BigInt UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL);
	
CREATE TABLE IF NOT EXISTS vehiculo (
	id BigInt UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	id_transporte BigInt UNSIGNED,
	FOREIGN KEY (id_transporte) REFERENCES transporte(id));

CREATE TABLE IF NOT EXISTS evento (
	id BigInt UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	codigo VARCHAR(10),
	nombre VARCHAR(1000) NOT NULL,
	tiempo DATETIME,
	id_evento_anterior BigInt UNSIGNED,
	id_evento_super BigInt UNSIGNED,
	calle VARCHAR(100) NOT NULL,
	ciudad VARCHAR(100) NOT NULL,
	pais VARCHAR(100) NOT NULL,
	cp VARCHAR(100),
	nomlocal  VARCHAR(100),
	id_transporte BigInt UNSIGNED,
	FOREIGN KEY (id_transporte) REFERENCES transporte(id));

CREATE TABLE IF NOT EXISTS grupo (	
	id BigInt UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(30) NOT NULL,
	descripcion VARCHAR(30));

CREATE TABLE IF NOT EXISTS aviso_evento (	
	id BigInt UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	mensaje VARCHAR(4000) NOT NULL,
	tipo ENUM('Urgente','Estándar'),
	fecha DATETIME,
	id_usuario BigInt UNSIGNED,
	id_evento BigInt UNSIGNED);

CREATE TABLE IF NOT EXISTS presupuesto_evento (	
	id BigInt UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	cantidad INT UNSIGNED NOT NULL, 
	concepto VARCHAR(100));

CREATE TABLE IF NOT EXISTS mensaje(
	 id BigInt UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	 descripcion VARCHAR(4000) NOT NULL,
	 id_usuario BigInt UNSIGNED,
	 id_grupo BigInt UNSIGNED,
	 id_evento BigInt UNSIGNED,
	 tiempo DATETIME,
	FOREIGN KEY (id_evento) REFERENCES evento(id),
	FOREIGN KEY (id_grupo) REFERENCES grupo(id), 
	FOREIGN KEY (id_usuario) REFERENCES usuario(id));
	
CREATE TABLE IF NOT EXISTS asisten (
	id BigInt UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	id_evento BigInt UNSIGNED,
	id_usuario BigInt UNSIGNED,
	FOREIGN KEY (id_evento) REFERENCES evento(id),
	FOREIGN KEY (id_usuario) REFERENCES usuario(id));

CREATE TABLE IF NOT EXISTS grupo_usuario (
	id BigInt UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	id_grupo BigInt UNSIGNED,
	id_usuario BigInt UNSIGNED,
	FOREIGN KEY (id_grupo) REFERENCES grupo(id),
	FOREIGN KEY (id_usuario) REFERENCES usuario(id));