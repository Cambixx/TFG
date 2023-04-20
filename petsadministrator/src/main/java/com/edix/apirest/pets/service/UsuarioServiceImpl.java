package com.edix.apirest.pets.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edix.apirest.pets.entities.Usuario;
import com.edix.apirest.pets.repository.UsuarioRepository;

@Service
public class UsuarioServiceImpl implements UsuarioService{
	
	@Autowired
	private UsuarioRepository urepo;

	// Lista de todos los usuarios
	@Override
	public List<Usuario> todosUsuarios() {
		return urepo.findAll();
	}

	// Buscar un usuario por su ID
	@Override
	public Usuario findById(int idUsuario) {
		return urepo.findById(idUsuario).orElse(null);
	}

	// Buscar un usuario por su nombre
	@Override
	public Usuario buscarUsuario(String username) {
		return urepo.buscarPorUsername(username);
	}

	// Registrar un usuario 
	@Override
	public boolean registro(Usuario usuario) {
		if (buscarUsuario(usuario.getUsername()) == null) {
			urepo.save(usuario);
			return true;
		}
		return false;
	}
	
	// Modificar un usuario
	@Override
	public int modificarUsuario(Usuario usuario) {
		int filas = 0;
		Usuario user = null;
		try {
			user = urepo.getOne(usuario.getIdUsuario());
			user = usuario;
			urepo.save(user);
			filas = 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return filas;
	}

}
