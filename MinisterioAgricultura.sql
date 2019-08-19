CREATE DATABASE MinisterioAgricultura
GO
USE MinisterioAgricultura
GO
CREATE TABLE tblPredio (ID INT PRIMARY KEY, Tipo VARCHAR(100), Area VARCHAR(100), IdPropietario INT, IdDpto INT, Valor BIGINT)
GO
CREATE TABLE tblDepartamento (ID INT PRIMARY KEY, Nombre VARCHAR(100))
GO
CREATE TABLE tblPropietario (ID INT PRIMARY KEY, Nombre VARCHAR(100), Apellido VARCHAR(100), TipoDocumento VARCHAR(100))
GO
CREATE TABLE tblMayorDomo (ID INT PRIMARY KEY, Nombre VARCHAR(100), Apellido VARCHAR(100), TipoDocumento VARCHAR(100))
GO
CREATE TABLE tblPredioMayordomo (IdPredio INT, IdMayordomo INT, PRIMARY KEY(IdPredio, IdMayordomo), TiempoAdministracion VARCHAR(50))
GO
CREATE TABLE tblDireccionPropietario (IdPropietario INT, Direccion VARCHAR(100), PRIMARY KEY (IdPropietario, Direccion))
GO
CREATE TABLE tblVaca (IdCabezaGanado INT PRIMARY KEY, FechaUltimoParto VARCHAR(100), CriasUltimoParto INT)
GO
CREATE TABLE tblToro (IdCabezaGanado INT PRIMARY KEY, GradoCasta VARCHAR(50), FechaUltimaVacunacion VARCHAR(100))
GO
CREATE TABLE tblCabezaGanado(ID INT PRIMARY KEY, IdPropietario INT, Edad INT)
GO
CREATE TABLE tblRaza (ID INT PRIMARY KEY, Nombre VARCHAR(100))
GO
CREATE TABLE tblCabezaRaza (IdCabeza INT, IdRaza INT, PRIMARY KEY (IdCabeza, IdRaza))
GO
CREATE TABLE tblEncabezadoActaPropiedad (Matricula INT PRIMARY KEY, IdVereda INT, IdPredio INT)
GO
CREATE TABLE tblDetalleActaPropiedad (MatriculaActa INT, IdPropietario INT, PRIMARY KEY (MatriculaActa, IdPropietario), Porcentaje FLOAT)
GO
CREATE TABLE tblMunicipio (ID INT PRIMARY KEY, Nombre VARCHAR(100), IdDpto INT)
GO
CREATE TABLE tblVereda (ID INT PRIMARY KEY, Nombre VARCHAR(100), IdMunicipio INT)
GO
ALTER TABLE tblPredio ADD FOREIGN KEY (IdDpto) REFERENCES tblDepartamento(ID)
GO
ALTER TABLE tblPredio ADD FOREIGN KEY (IdPropietario) REFERENCES tblPropietario(ID)
GO
ALTER TABLE tblPredioMayordomo ADD FOREIGN KEY (IdPredio) REFERENCES tblPredio(ID)
GO
ALTER TABLE tblPredioMayordomo ADD FOREIGN KEY (IdMayordomo) REFERENCES tblMayordomo(ID)
GO
ALTER TABLE tblDireccionPropietario ADD FOREIGN KEY (IdPropietario) REFERENCES tblPropietario(ID)
GO
ALTER TABLE tblCabezaGanado ADD FOREIGN KEY (IdPropietario) REFERENCES tblPropietario(ID)
GO
ALTER TABLE tblCabezaRaza ADD FOREIGN KEY (IdCabeza) REFERENCES tblCabezaGanado(ID)
GO
ALTER TABLE tblCabezaRaza ADD FOREIGN KEY (IdRaza) REFERENCES tblRaza(ID)
GO
ALTER TABLE tblVaca ADD FOREIGN KEY (IdCabezaGanado) REFERENCES tblCabezaGanado(ID)
GO
ALTER TABLE tblToro ADD FOREIGN KEY (IdCabezaGanado) REFERENCES tblCabezaGanado(ID)
GO
ALTER TABLE tblEncabezadoActaPropiedad ADD FOREIGN KEY (IdVereda) REFERENCES tblVereda(ID)
GO
ALTER TABLE tblEncabezadoActaPropiedad ADD FOREIGN KEY (IdPredio) REFERENCES tblPredio(ID)
GO
ALTER TABLE tblDetalleActaPropiedad ADD FOREIGN KEY (MatriculaActa) REFERENCES tblEncabezadoActaPropiedad(Matricula)
GO
ALTER TABLE tblDetalleActaPropiedad ADD FOREIGN KEY (IdPropietario) REFERENCES tblPropietario(ID)
GO 
ALTER TABLE tblMunicipio ADD FOREIGN KEY (IdDpto) REFERENCES tblDepartamento(ID)
GO
ALTER TABLE tblVereda ADD FOREIGN KEY (IdMunicipio) REFERENCES tblMunicipio(ID)
GO
INSERT INTO tblMayorDomo VALUES(15247896, 'Pablo', 'Perez', 'CC'), (13847896, 'Camilo', 'Montoya', 'CC'), (15247885, 'Esteban', 'Torres', 'CC')
GO
INSERT INTO tblPropietario VALUES(11347896, 'Alejandro', 'Acevedo', 'CC'), (11346796, 'Camila', 'Arboleda', 'CC'), (11336795, 'Daniel', 'Rodriguez', 'CC')
GO
INSERT INTO tblCabezaGanado VALUES(1, 11347896, 4), (2, 11346796, 2), (3, 11346796, 1), (4, 11336795, 6), (5, 11347896, 5)
GO
INSERT INTO tblVaca VALUES(1, '1/08/2019', 1), (2, '5/07/2019', 3)
GO
INSERT INTO tblToro VALUES(3, '1', '1/06/2018'), (4, '1', '2/02/2019'), (5, '1', '19/08/2019')
GO
INSERT INTO tblDireccionPropietario VALUES(11347896, 'Cra 32a # 25-10'), (11346796, 'Cra 25a # 11-20'), (11336795, 'Cra 55d # 20-15')
GO
INSERT INTO tblRaza VALUES(1, 'WATUSI'), (2, 'PELUDO'), (3, 'HOLSTEIN'), (4, 'PASIEGA'), (5, 'JERSEY'), (6, 'TUDANCA')
GO 
INSERT INTO tblCabezaRaza VALUES(1, 1), (2, 2), (3, 2), (4, 4), (5, 4)
GO
INSERT INTO tblDepartamento VALUES (1, 'Amazonas'), (2, 'Arauca'), (3, 'Antioquia'), (4, 'Bolivar'), (5, 'Boyaca'), (6, 'Caldas'), (7, 'Caqueta')
GO
INSERT INTO tblPredio VALUES (1, 'Urbano', '2000m', 11347896, 1, 50000000), (2, 'Industrial', '1000m', 11346796, 1, 25000000), (3, 'Rustico', '700m', 11336795, 1, 19000000)
GO
INSERT INTO tblMunicipio VALUES (1, 'Leticia', 1), (2, 'Medellin', 3), (3, 'Cartagena de Indias', 4)
GO
INSERT INTO tblVereda VALUES (1, 'Barrio Blanco', 2), (2, 'El Yolombo', 2), (3, 'El Placer', 2)
GO
INSERT INTO tblPredioMayordomo VALUES (1, 15247896, '3 años'), (2, 13847896, '6 meses'), (3, 15247885, '1 año')
GO
INSERT INTO tblEncabezadoActaPropiedad  VALUES (1234, 1, 1), (1434, 2, 2), (1454, 3, 3)
GO
INSERT INTO tblDetalleActaPropiedad VALUES (1234, 11347896, 50), (1434, 11346796, 70), (1454, 11336795, 100)
