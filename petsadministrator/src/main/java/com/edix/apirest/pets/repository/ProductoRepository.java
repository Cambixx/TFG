package com.edix.apirest.pets.repository;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.edix.apirest.pets.entities.Producto;

public interface ProductoRepository extends JpaRepository<Producto, Integer>{

	
	@Query("select p from Producto p where p.tamano.nombre = ?1")
	public List<Producto> findByTamano(String tamano);
	
	@Query("select p from Producto p order by precio ASC")
	public List<Producto> orderByPriceAsc();
	
	@Query("select p from Producto p order by precio DESC")
	public List<Producto> orderByPriceDesc();
	
	@Query("select p from Producto p where p.nombre like ?1")
	public List<Producto>buscador(String nombre);

	// API REST
	@Query("select p from Producto p where p.nombre like ?1")
	public Producto buscadorNombre(String nombre);

	@Query("select p.precio from Producto p where p.nombre like ?1")
	 public BigDecimal findPrecioByNombre(String nombre);
	
}
