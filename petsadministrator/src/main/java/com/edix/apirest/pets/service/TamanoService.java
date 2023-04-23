package com.edix.apirest.pets.service;

import java.util.List;

import com.edix.apirest.pets.entities.Tamano;

public interface TamanoService {
	// SAcar lista de tamanos
	List<Tamano> todosTamanos();
			
	// Buscar una tamano por el ID
	Tamano buscarUno(int idTamano);
}
