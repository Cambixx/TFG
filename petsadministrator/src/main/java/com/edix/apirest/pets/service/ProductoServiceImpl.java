package com.edix.apirest.pets.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edix.apirest.pets.entities.Producto;
import com.edix.apirest.pets.repository.ProductoRepository;

@Service
public class ProductoServiceImpl implements ProductoService{

	@Autowired
	private ProductoRepository prepo;
	
	// Lista de todos los productos
	@Override
	public List<Producto> todosProductos() {
		return prepo.findAll();
	}

	// Buscar un producto por su ID
	@Override
	public Producto buscarUno(int idProducto) {
		return prepo.findById(idProducto).orElse(null);
	}
	
	// Lista de los productos segun su familia/consola
	@Override
	public List<Producto> findByConsole(String consola) {
		return prepo.findByConsole(consola);
	}

	// Ordenación de productos
	@Override
	public List<Producto> OrderByPriceAsc() {
		return prepo.orderByPriceAsc();
	}

	// Ordenación de productos
	@Override
	public List<Producto> OrderByPriceDesc() {
		return prepo.orderByPriceDesc();
	}

	// Borrar un producto
	@Override
	public int borrarProducto(int idProducto) {
		int filasBorradas = 0;
		try {
			prepo.deleteById(idProducto);
			filasBorradas=1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return filasBorradas;
	}

	// Insertar un producto
	@Override
	public int insertarProducto(Producto producto) {
		int filasInsertadas = 0;
		try {
			prepo.save(producto);
			filasInsertadas = 1;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return filasInsertadas;
	}
	
	// Modificar un producto
	@Override
	public int modificarProducto(Producto producto) {
			
		int filasModificadas = 0;
		Producto prod = null;
		try {
			prod = prepo.getOne(producto.getIdProductos());
			prod = producto;
			prepo.save(prod);
			filasModificadas = 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return filasModificadas;
	}

	// Listad de productos que coincidan con lo que se busca por el nombre
	@Override
	public List<Producto> buscador(String nombre) {
		return prepo.buscador(nombre);
	}


	// API REST

	@Override
	public Producto buscadorNombre(String nombre) {
		return prepo.buscadorNombre(nombre);
	}

	@Override
	public BigDecimal findPrecioByNombre(String nombre) {
		return prepo.findPrecioByNombre(nombre);
	}

}
