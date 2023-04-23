package com.edix.apirest.pets.service;

import java.util.List;

import com.edix.apirest.pets.entities.Direccion;

public interface DireccionService {

	// Sacar el listado de direcciones
	List<Direccion> todasDirecciones();
	
	// Sacar el listado de direcciones de un usuario
	List<Direccion> direccionesUsuario(int idUsuario);
	
	// Modificar la dirección que te pasan
	int modificarDireccion(Direccion direccion);
	
	// Buscar la dirección por su ID
	Direccion buscarDireccion(int idDireccion);
}
