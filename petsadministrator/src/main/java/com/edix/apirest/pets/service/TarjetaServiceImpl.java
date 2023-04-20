package com.edix.apirest.pets.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edix.apirest.pets.entities.Tarjeta;
import com.edix.apirest.pets.repository.TarjetaRepository;
import com.edix.apirest.pets.repository.UsuarioRepository;

@Service
public class TarjetaServiceImpl implements TarjetaService{

	@Autowired
	private TarjetaRepository trepo;
	
	@Autowired
	private UsuarioRepository urepo;
	
	// Sacar el listado de tarjetas
	@Override
	public List<Tarjeta> todasTarjetas() {
		return trepo.findAll();
	}

	// Sacar el listado de tarjetas de un usuario
	@Override
	public List<Tarjeta> tarjetasUsuario(int idUsuario) {
		return urepo.tarjetasPorUsuario(idUsuario);
	}

	// Modificar la tarjetas que te pasan
	@Override
	public int modificarTarjeta(Tarjeta tarjeta) {
		int filasModificadas = 0;
		
		try {
			trepo.save(tarjeta);
			filasModificadas = 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return filasModificadas;
	}

	// Buscar la tarjetas por su ID
	@Override
	public Tarjeta buscarTarjeta(int idTarjeta) {
		return trepo.findById(idTarjeta).orElse(null);
	}

}
