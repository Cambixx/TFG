package com.edix.apirest.pets.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edix.apirest.pets.entities.Producto;
import com.edix.apirest.pets.entities.Rol;
import com.edix.apirest.pets.repository.RolRepository;

@Service
public class RolServiceImpl implements RolService{
	
	@Autowired
	private RolRepository rrepo;

	// Lista de roles
	@Override
	public List<Rol> todosRoles() {
		return rrepo.findAll();
	}

	// Buscar un rol
	@Override
	public Rol buscarRol(int idRol) {
		return rrepo.findById(idRol).orElse(null);
	}

	// Insertar un rol
	@Override
	public int insertarRol(Rol rol) {
		int filasInsertadas = 0;
		try {
			rrepo.save(rol);
			filasInsertadas = 1;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return filasInsertadas;
	}

	// Borrar un rol
	@Override
	public int borrarRol(int idRol) {
		int filasBorradas = 0;
		try {
			rrepo.deleteById(idRol);
			filasBorradas=1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return filasBorradas;
	}

	// Modificar un rol
	@Override
	public int modificarRol(Rol rol) {
		int filasModificadas = 0;
		Rol mod = null;
		try {
			mod = rrepo.getOne(rol.getIdRol());
			mod = rol;
			rrepo.save(mod);
			filasModificadas = 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasModificadas;
	}

}
