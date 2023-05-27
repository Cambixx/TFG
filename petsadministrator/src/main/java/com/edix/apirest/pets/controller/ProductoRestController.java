package com.edix.apirest.pets.controller;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.edix.apirest.pets.entities.Producto;
import com.edix.apirest.pets.service.ProductoService;

@RequestMapping("/rest")
@RestController
public class ProductoRestController {
	@Autowired
	private ProductoService pserv;
	
	// Ver un producto según su ID
	@GetMapping("/uno/{id}")
	public Producto verUno(@PathVariable("id") int idProducto) {
		return pserv.buscarUno(idProducto);
	}
	
	// Ver la lista de productos
	@GetMapping("/todos")
	public List<Producto> todos(){
		return pserv.todosProductos();
	}

	// Ver el precio del producto que se pase
	@GetMapping("/verPrecio/{nombre}")
	public BigDecimal getPrecioByName(@PathVariable("nombre") String nombre) {
		return pserv.findPrecioByNombre(nombre);
	}
}
