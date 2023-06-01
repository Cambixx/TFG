package com.edix.apirest.pets.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.Query;

import com.edix.apirest.pets.entities.Direccion;
import com.edix.apirest.pets.entities.Tarjeta;
import com.edix.apirest.pets.entities.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Integer>{
	@Query("select u from Usuario u where u.username = ?1")
	public Usuario buscarPorUsername(String username);
	
	@Query("select u.direcciones from Usuario u where u.idUsuario = ?1")
	public List<Direccion> direccionesPorUsuario(int idUsuario);
	
	@Query("select u.tarjetas from Usuario u where u.idUsuario = ?1")
	public List<Tarjeta> tarjetasPorUsuario(int idUsuario);
	
}

