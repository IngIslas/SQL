

CREATE PROCEDURE SpAccionesVideojuegos
@Opcion INT,
@IdVideojuego INT=NULL,
@Titulo VARCHAR(50)=NULL,
@Descripcion VARCHAR(100)=NULL,
@Año INT= NULL,
@Calificacion FLOAT = NULL,
@Genero VARCHAR(50)= NULL,
@Consola VARCHAR(50)= NULL,
@IdConsola INT =NULL
AS
BEGIN
IF @Opcion=1  --Consultar todos los Videojuegos
	BEGIN
		SELECT * FROM Videojuego
	END
ELSE IF @Opcion =2 --Consultar Consolas Videojuego
BEGIN
	SELECT C.* FROM Consola C
	INNER JOIN VideojuegoConsola VC
	ON VC.IdConsola= C.IdConsola
	WHERE IdVideojuego = @IdVideojuego
END
ELSE IF @Opcion=3 --Insertar Videojuego
	BEGIN
		INSERT INTO Videojuego (Titulo, Descripcion, Año, Calificacion, Genero)
		VALUES (@Titulo, @Descripcion, @Año, @Calificacion, @Genero)
		SELECT CAST(SCOPE_IDENTITY() AS INT) IdVideojuego
	END
ELSE IF @Opcion=4 --Consultar Consolas
	BEGIN
		SELECT * FROM Consola
	END
ELSE IF @Opcion=5 --Insertar Consola
BEGIN
	INSERT INTO Consola (Nombre) VALUES (@Consola)
END
ELSE IF @Opcion=6 --Insertar Videojuego Consola 
BEGIN
	INSERT INTO VideojuegoConsola (IdVideojuego,IdConsola) VALUES (@IdVideojuego, @IdConsola)
END
ELSE IF @Opcion= 7 --Eliminar ConsolasVideojuegos seleccionadas
BEGIN 
	DELETE FROM VideojuegoConsola
	WHERE IdVideojuego= @IdVideojuego
END	
ELSE IF @Opcion =8 --Editar Videojuego
	BEGIN
		UPDATE Videojuego
		SET Titulo= ISNULL(@Titulo, Titulo),
		Descripcion= ISNULL(@Descripcion,Descripcion),
		Año= ISNULL(@Año, Año),
		Calificacion= ISNULL(@Calificacion, Calificacion),
		Genero = ISNULL(@Genero, Genero)
		WHERE IdVideojuego=@IdVideojuego
		SELECT @IdVideojuego IdVideojuego
	END
ELSE IF @Opcion=9 --Eliminar Videojuego (Junto con Consolas)
	BEGIN
		DELETE FROM Videojuego
		WHERE IdVideojuego= @IdVideojuego
	END
ELSE IF @Opcion= 10 --Actualizar consola
	BEGIN
		UPDATE Consola
		SET Nombre= Isnull(@Consola, Nombre)
		WHERE IdConsola = @IdConsola
	END
ELSE IF @Opcion=11 --Eliminar Consola
	BEGIN 
		DELETE FROM Consola
		WHERE IdConsola= @IdConsola
	END
END