package com.edix.apirest.pets.service;

import java.util.List;

import com.edix.apirest.pets.entities.Rol;

public interface RolService {
	
	// Lista de roles
	List<Rol> todosRoles();
	
	// Buscar un rol
	Rol buscarRol(int idRol);
	
	// Insertar un rol
	int insertarRol(Rol rol);
	
	// Borrar un rol
	int borrarRol(int idRol);
	
	// Modificar un rol
	int modificarRol(Rol rol);
}
