﻿CREATE DATABASE  WebMarco
USE WEBMARCO

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

select * from  Roles_permiso

insert into Roles_Permiso values (1,1,1)
insert into Roles_Permiso values (1,2,1)
insert into Roles_Permiso values (1,3,1)
insert into Roles_Permiso values (1,4,1)

insert into Roles_Permiso values (2,1,0)
insert into Roles_Permiso values (2,2,1)
insert into Roles_Permiso values (2,3,0)
insert into Roles_Permiso values (2,4,0)

create procedure sp_registrar
@Nombre varchar(50),
@Edad int,
@Usuario varchar(50),
@Clave varchar(max),
@Id_Rol int,
@Patron varchar(50)
as begin 
insert into  Usuarios values(@Nombre, @Edad, @Usuario, ENCRYPTBYPASSPHRASE(@Patron, @Clave), @Id_Rol) 
end


create procedure sp_Login
@Usuario varchar(50),
@Clave varchar(max),
@Patron varchar(50)
as begin
select * from Usuarios where Usuario=@Usuario and Convert(varchar(50), DECRYPTBYPASSPHRASE(@Patron, Clave) )=@Clave
end

create procedure sp_permisos
@Id_Rol int
as begin
select  Nombre_Permiso, Estado from Roles_Permisos inner join Permisos on Permisos.Id_Permiso=Roles_Permiso where Id_Rol=@Id_Rol
end


create procedure sp_datos
as begin
select * from Usuarios
end