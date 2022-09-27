


SELECT * FROM Videojuego
SELECT * FROM Consola
SELECT * FROM  VideojuegoConsola


TRUNCATE TABLE VideojuegoConsola
DELETE FROM Videojuego

INSERT INTO Videojuego (Titulo, Descripcion, Año, Calificacion,Genero) VALUES ('GOW','Dioses del olimpo',2000,9.9,'Accion')
SELECT CAST(SCOPE_IDENTITY() AS INT) IdVideojuego

INSERT INTO Consola (Nombre) Values ('Play Station 2')
INSERT INTO Consola (Nombre) Values ('Play Station Portatil')

INSERT INTO VideojuegoConsola (IdVideojuego, IdConsola) VALUES (1,1)
INSERT INTO VideojuegoConsola (IdVideojuego, IdConsola) VALUES (1,2)
