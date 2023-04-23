package com.edix.apirest.pets.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edix.apirest.pets.entities.Direccion;
import com.edix.apirest.pets.repository.DireccionRepository;
import com.edix.apirest.pets.repository.UsuarioRepository;

@Service
public class DireccionServiceImpl implements DireccionService{
	
	@Autowired
	private DireccionRepository drepo;
	
	@Autowired
	private UsuarioRepository urepo;

	// Sacar el listado de direcciones
	@Override
	public List<Direccion> todasDirecciones() {
		return drepo.findAll();
	}

	// Sacar el listado de direcciones de un usuario
	@Override
	public List<Direccion> direccionesUsuario(int idUsuario) {
		return urepo.direccionesPorUsuario(idUsuario);
	}

	// Modificar la dirección que te pasan
	@Override
	public int modificarDireccion(Direccion direccion) {
		int filasModificadas = 0;
		
		try {
			drepo.save(direccion);
			filasModificadas = 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasModificadas;
	}

	// Buscar la dirección por su ID
	@Override
	public Direccion buscarDireccion(int idDireccion) {
		return drepo.findById(idDireccion).orElse(null);
	}

}
