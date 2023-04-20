package com.edix.apirest.pets.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.edix.apirest.pets.entities.ProductosEnPedido;

public interface ProductosEnPedidoRepository extends JpaRepository<ProductosEnPedido, Integer>{

}
