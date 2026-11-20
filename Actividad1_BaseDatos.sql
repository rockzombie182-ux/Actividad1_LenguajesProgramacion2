-- ==========================================================
-- Actividad 1: Diseño e Implementación de Base de Datos
-- Materia: Lenguajes de Programación II
-- Motor: MS SQL Server
-- ==========================================================

-- 1. Creación de la tabla Centros
CREATE TABLE Centros (
    NumeroCentro VARCHAR(10) PRIMARY KEY,
    NombreCentro VARCHAR(100) NOT NULL,
    Ciudad VARCHAR(50) NOT NULL
);

-- 2. Creación de la tabla Empleados
CREATE TABLE Empleados (
    NumeroEmpleado INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    ApellidoPaterno VARCHAR(50) NOT NULL,
    ApellidoMaterno VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    RFC VARCHAR(13) NOT NULL,
    NumeroCentro VARCHAR(10) NOT NULL,
    Puesto VARCHAR(50) NOT NULL,
    DescripcionPuesto VARCHAR(150) NOT NULL,
    EsDirectivo BIT NOT NULL,
    CONSTRAINT FK_Empleados_Centros FOREIGN KEY (NumeroCentro) 
        REFERENCES Centros(NumeroCentro)
);

-- 3. Creación de la tabla Directivos
CREATE TABLE Directivos (
    NumeroEmpleado INT PRIMARY KEY,
    CentroSupervisa VARCHAR(10) NOT NULL,
    PrestacionCombustible BIT NOT NULL,
    CONSTRAINT FK_Directivos_Empleados FOREIGN KEY (NumeroEmpleado) 
        REFERENCES Empleados(NumeroEmpleado),
    CONSTRAINT FK_Directivos_Centros FOREIGN KEY (CentroSupervisa) 
        REFERENCES Centros(NumeroCentro)
);

-- ==========================================================
-- Inserción de datos de prueba en las tablas
-- ==========================================================

-- Registros en Centros
INSERT INTO Centros (NumeroCentro, NombreCentro, Ciudad) VALUES
('C001', 'Centro Operativo Norte', 'Culiacán'),
('C002', 'Centro Logístico Sur', 'Tecámac'),
('C003', 'Centro Administrativo Central', 'Ciudad de México');

-- Registros en Empleados
INSERT INTO Empleados (NumeroEmpleado, Nombre, ApellidoPaterno, ApellidoMaterno, FechaNacimiento, RFC, NumeroCentro, Puesto, DescripcionPuesto, EsDirectivo) VALUES
(1001, 'Carlos', 'Mendoza', 'Ruiz', '1985-04-12', 'MERC850412HSL', 'C001', 'Gerente de Centro', 'Supervisión general de operaciones y personal', 1),
(1002, 'Laura', 'Gómez', 'Salazar', '1990-08-23', 'GOSL900823MDF', 'C002', 'Directora Regional', 'Coordinación administrativa y logística regional', 1),
(1003, 'Jorge', 'Ramírez', 'Torres', '1994-11-05', 'RATJ941105HMC', 'C001', 'Analista de Sistemas', 'Soporte técnico y mantenimiento de bases de datos', 0),
(1004, 'Sofía', 'Hernández', 'López', '1996-02-18', 'HELS960218MDF', 'C003', 'Auxiliar Administrativo', 'Control documental y atención a proveedores', 0);

-- Registros en Directivos
INSERT INTO Directivos (NumeroEmpleado, CentroSupervisa, PrestacionCombustible) VALUES
(1001, 'C001', 1),
(1002, 'C002', 1);

-- ==========================================================
-- Consultas de verificación
-- ==========================================================
SELECT * FROM Centros;
SELECT * FROM Empleados;
SELECT * FROM Directivos;
