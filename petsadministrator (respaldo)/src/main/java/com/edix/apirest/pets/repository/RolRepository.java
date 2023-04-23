package com.edix.apirest.pets.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.edix.apirest.pets.entities.Rol;

public interface RolRepository extends JpaRepository<Rol, Integer>{

}
