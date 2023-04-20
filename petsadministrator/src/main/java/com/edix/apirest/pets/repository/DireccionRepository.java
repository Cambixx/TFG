package com.edix.apirest.pets.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.edix.apirest.pets.entities.Direccion;

public interface DireccionRepository extends JpaRepository<Direccion, Integer>{
	
	
}
