
/*
package com.edix.apirest.pets.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edix.apirest.pets.dtos.LineaPedidoDto;
import com.edix.apirest.pets.entities.Direccion;
import com.edix.apirest.pets.entities.Pedido;
import com.edix.apirest.pets.entities.ProductosEnPedido;
import com.edix.apirest.pets.entities.Tarjeta;
import com.edix.apirest.pets.entities.Usuario;
import com.edix.apirest.pets.repository.ProductoRepository;
import com.edix.apirest.pets.service.DireccionService;
import com.edix.apirest.pets.service.PedidoService;
import com.edix.apirest.pets.service.TarjetaService;
import com.edix.apirest.pets.service.UsuarioService;
 
@Controller
@RequestMapping("/cesta")
public class CestaController {
	@Autowired
	private ProductoRepository prepo;
	
	@Autowired
	private TarjetaService tserv;
	
	@Autowired
	private DireccionService dserv;
	
	@Autowired
	private PedidoService pserv;
	
	@Autowired
	private UsuarioService userv;
	
	// Ver la cesta con los productos añadidos
	@GetMapping("/ver")
	public String verCesta(Model model, HttpSession sesion) {
		List<LineaPedidoDto> lista = (List<LineaPedidoDto>)sesion.getAttribute("cesta");
		model.addAttribute("cesta", lista);
		
		return "carrito";
	}
	
	// Formulario para añadir el producto a la cesta
	@PostMapping("/addCesta/{id}")
	public String procAddCesta(RedirectAttributes ratt, Model model, @PathVariable(name="id") int idProducto, HttpSession sesion, LineaPedidoDto linea) {
		linea.setIdProducto(idProducto);
		linea.setPrecioVenta(Double.parseDouble(prepo.findById(idProducto).orElse(null).getPrecio().toString()));
		List<LineaPedidoDto> cesta = (List<LineaPedidoDto>)sesion.getAttribute("cesta");
		System.out.println("Cesta: " + cesta);
		
		if (cesta == null) {
			System.out.println("ArrayList creado!");
			ratt.addFlashAttribute("mensaje", "<div class=\"alert alert-success\" role=\"alert\">\r\n"
					+ "  El producto se ha a la cesta\r\n"
					+ "</div>");
			cesta = new ArrayList<>();
		}
		if (!cesta.contains(linea))
			cesta.add(linea);	
			ratt.addFlashAttribute("mensaje", "<div class=\"alert alert-success\" role=\"alert\">\r\n"
					+ "  El producto se ha añadido a la cesta\r\n"
					+ "</div>");
		
		for(int i = 0; i < cesta.size(); i++) {   
		    System.out.print("Articulo en la cesta: "+ i +":"+ cesta.get(i));
		}  
		
		sesion.setAttribute("cesta", cesta);
		
		return "redirect:/lista-productos";
	}

	// Ir a la página de la cesta para ver el pedido
	@GetMapping("/comprar/{idUsuario}")
	public String comprarCesta(Model model, HttpSession sesion, @PathVariable(name="idUsuario") int idUsuario) {
		List<LineaPedidoDto> cesta = (List<LineaPedidoDto>)sesion.getAttribute("cesta");
		model.addAttribute("cesta", cesta);
		
		//Usuario user = (Usuario)sesion.getAttribute("usuario");
		
		//System.out.println("Usuario en sesión = " + user + "!");
		List<Direccion> duser = dserv.direccionesUsuario(idUsuario);
		model.addAttribute("DireccionesUsuario", duser);
		
		List<Tarjeta> tuser = tserv.tarjetasUsuario(idUsuario);
		model.addAttribute("TarjetasUsuario", tuser);
		
		sesion.setAttribute("userCompra", userv.findById(idUsuario));
		System.out.println("Usuario que compra es: " + userv.findById(idUsuario));
		
		return "carrito";
	}
	
	// Formulario para procesar el pedido, el usuario, la dirección y la tarjeta 
	@PostMapping("/comprar")
	public String comprarPost(RedirectAttributes ratt, Model model, HttpSession sesion, Direccion direccion, Tarjeta tarjeta) {
		List<LineaPedidoDto> lista = (List<LineaPedidoDto>)sesion.getAttribute("cesta");
		
		for (LineaPedidoDto ele: lista) {
			System.out.println("Linea de la compra: " + ele);
			
		}
		System.out.println("Lista => " + lista);
		Pedido p = new Pedido();

		p.setDireccion(direccion);
		p.setTarjeta(tarjeta);

		//p.setEstado("Terminado");
		p.setFechaRealizacion(new Date());
		Usuario user = (Usuario)sesion.getAttribute("userCompra");
		p.setUsuario(user);
		
		List<ProductosEnPedido> listaLP = new ArrayList<>();
		
		for (LineaPedidoDto ele: lista) {
			ProductosEnPedido pep = new ProductosEnPedido();
			pep.setCantidad(ele.getCantidad());
			pep.setPedido(p);
			pep.setProducto(prepo.findById(ele.getIdProducto()).orElse(null));
			pep.setPrecio(BigDecimal.valueOf(ele.getPrecioVenta()));
			System.out.println("Linea de pedido: " + pep);
			listaLP.add(pep);
		}
		
		 
		for (int i = 0; i < listaLP.size(); i++) {
			System.out.println("Elemento " + i + ":" + listaLP.get(i));
		}
		
		System.out.println(p);
		pserv.altaPedido(p, "Terminado");
		
		sesion.setAttribute("cesta", null);
		
		ratt.addFlashAttribute("mensaje", "<div class=\"alert alert-success\" role=\"alert\">\r\n"
				+ "  Compra realizada con éxito :) \r\n"
				+ "</div>");
		
		return "redirect:/lista-productos";
	}
	
}
*/