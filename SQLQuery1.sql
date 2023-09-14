CREATE DATABASE PortalWeb
USE PORTALWEB

CREATE TABLE Usuarios(
Id_usuario int identity(1,1),
Nombre varchar (50),
Edad int,
Usuario varchar(50),
Clave varchar(50)

)

alter table Usuarios  add  Id_rol int

select * from Usuarios

CREATE TABLE Permisos(
Id_Permiso int identity(1,1),
Nombre_Permiso varchar(50)
)

CREATE TABLE Roles (
Id_Rol  int identity (1,1),
Nombre_rol varchar(50)
)

CREATE TABLE Roles_Permiso(
Id_rol_permiso int identity (1,1),
Id_Rol int,
Id_Permiso int,
estado bit
)

insert into  Roles values ('Admin')
insert into  Roles values ('User')

select * from  Roles


insert into  Permisos values ('Create')
insert into  Permisos values ('Read')
insert into  Permisos values ('Update')
insert into  Permisos values ('Delete')

select * from  Permisos

