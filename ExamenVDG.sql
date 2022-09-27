

CREATE DATABASE ExamenVDG

DROP TABLE VideojuegoConsola
DROP TABLE Videojuego
DROP TABLE Consola

CREATE TABLE Videojuego(
	IdVideojuego INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Titulo VARCHAR(50) NOT NULL,
	Descripcion VARCHAR(100),
	Año int,
	Calificacion FLOAT,
	Genero VARCHAR(50) NOT NULL
	CONSTRAINT UC_Videojuego UNIQUE (Titulo)
)

CREATE TABLE Consola(
	IdConsola INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	CONSTRAINT UC_Consola UNIQUE (Nombre)
)

CREATE TABLE VideojuegoConsola(
	IdVideojuego INT NOT NULL,
	IdConsola INT NOT NULL,
	FOREIGN KEY (IdVideojuego) References Videojuego(IdVideojuego) ON DELETE CASCADE,
	FOREIGN KEY (IdConsola) References Consola(IdConsola) ON DELETE CASCADE,
	CONSTRAINT UC_VideojuegoConsola UNIQUE (IdVideojuego,IdConsola)
)

