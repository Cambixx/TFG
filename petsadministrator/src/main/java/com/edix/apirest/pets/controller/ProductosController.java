package com.edix.apirest.pets.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edix.apirest.pets.service.TamanoService;
import com.edix.apirest.pets.service.ProductoService;
import com.edix.apirest.pets.entities.Tamano;
import com.edix.apirest.pets.entities.Producto;


@Controller
public class ProductosController {
	
	@Autowired
	private ProductoService pserv;
	
	@Autowired
	private TamanoService tserv;
	
	// Mostrar lista de Productos
	@GetMapping("/lista-productos")
	public String verProductos(Model model) {
		List<Producto> lista = pserv.todosProductos();
		model.addAttribute("listaProductos", lista);
				
		return "lista-productos";
	}

	// Ver detalles de un produto
	@GetMapping("/ver-producto/{id}")
	public String verUno(Model model, @PathVariable(name="id") int  idProducto) {
		Producto producto = pserv.buscarUno(idProducto);
		model.addAttribute("producto", producto);
		
		return "ver-producto";
	}
	
	// Ordenar Productos Asc
	@GetMapping("/lista-productos/precioAsc")
	public String orderByPriceAsc(Model model) {
		List<Producto> lista = pserv.OrderByPriceAsc();
		model.addAttribute("listaProductos", lista);
				
		return "lista-productos";
	}
	
	// Ordenar Productos Desc
	@GetMapping("/lista-productos/precioDesc")
	public String orderByPriceDesc(Model model) {
		List<Producto> lista = pserv.OrderByPriceDesc();
		model.addAttribute("listaProductos", lista);
				
		return "lista-productos";
	}

	
	// Mostrar Productos por tipo de consola (Familia)
	@GetMapping("/lista-productos/{tamano}")
	public String verProductosConsola(Model model, @PathVariable(name="tamano") String tamano) {
		List<Producto> lista = pserv.findByTamano(tamano);
		model.addAttribute("listaProductos", lista);
				
		return "lista-productos";
	}
	
	
	// Buscador de productos
	@GetMapping("/buscador")
	public String buscadorNombre (Model model, @RequestParam("nombre") String nombre) {
		List<Producto>lista = pserv.buscador("%" + nombre + "%");
		model.addAttribute("listaProductos", lista);
			
		return "lista-productos";
	}
	
	// Borrar un producto
	@GetMapping("/borrar-producto/{id}")
	public String eliminar(Model model, @PathVariable(name="id") int  idProducto) {	
		if (pserv.borrarProducto(idProducto) == 1)
			model.addAttribute("mensaje", "<div class=\"alert alert-success\" role=\"alert\">\r\n"
				+ "  Producto eliminado con éxito\r\n"
				+ "</div>");
		else
			model.addAttribute("mensaje", "<div class=\"alert alert-warning\" role=\"alert\">\r\n"
				+ "  El producto no se ha podido eliminar\r\n"
				+ "</div>");
		
		return "forward:/lista-productos";
	}
	
	// Página de formulario para crear un producto nuevo
	@GetMapping("/alta-producto")
	public String formAltaProd(Model model) {
		List<Tamano> lista = tserv.todosTamanos();
		model.addAttribute("listaFamilias", lista);
		
		return "alta-producto";
	}
	
	// Formulario para crear un producto nuevo
	@PostMapping("/alta-producto")
	public String procesarFormulario(RedirectAttributes ratt, Model model,Producto producto ) {
		pserv.insertarProducto(producto);
		
		ratt.addFlashAttribute("mensaje", "<div class=\"alert alert-success\" role=\"alert\">\r\n"
			+ "  El producto se ha añadido con éxito\r\n"
			+ "</div>");
		
		return "redirect:/lista-productos";
	}
	
	// Página para editar el producto
	@GetMapping("/editar-producto/{id}")
	public String enviarFormularioEditar(Model model, @PathVariable(name="id") int idProductos) {
		model.addAttribute("producto", pserv.buscarUno(idProductos));
		
		List<Tamano> lista = tserv.todosTamanos();
		model.addAttribute("listaFamilias", lista);
		
		return "editar-producto";
	}
	
	// Formulario para editar el producto
	@PostMapping("/editar-producto/{id}")
	public String procesarFormularioEditar(Model model,Producto producto,  @PathVariable(name="id") int idProductos ) {
				
		if (pserv.buscarUno(idProductos) == null){
			model.addAttribute("mensaje", "<div class=\"alert alert-warning\" role=\"alert\">\r\n"
				+ "  El producto no existe\r\n"
				+ "</div>");
		}else{
			producto.setIdProductos(idProductos);
			if (pserv.modificarProducto(producto) == 1) {
				model.addAttribute("mensaje", "<div class=\"alert alert-success\" role=\"alert\">\r\n"
					+ "  Producto editado con éxito\r\n"
					+ "</div>");
			}else {
				model.addAttribute("mensaje", "<div class=\"alert alert-warning\" role=\"alert\">\r\n"
					+ "  El producto no se ha podido editar\r\n"
					+ "</div>");
			}
		}
		return "redirect:/lista-productos";
		
	}
	
}
