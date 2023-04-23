package com.edix.apirest.pets.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.edix.apirest.pets.entities.Pedido;
import com.edix.apirest.pets.service.PedidoService;

@Controller
public class PedidosController {
	
	@Autowired
	private PedidoService pserv;
	
	// Ver el listado de productos
	@GetMapping("/lista-pedidos/{id}")
	public String pedidosUsuario(Model model, @PathVariable(name="id") int  idUsuario) {
		List<Pedido> pedidos = pserv.pedidosUsuario(idUsuario);
		model.addAttribute("pedidosUsuario", pedidos);
		
		return "lista-pedidos";
	}
	
	// Ver un pedido según su ID
	@GetMapping("/ver-pedido/{id}")
	public String verPedido(Model model, @PathVariable(name="id") int  idPedido) {
		Pedido pedido = pserv.findById(idPedido);
		
		model.addAttribute("pedido", pedido);
		
		return "ver-pedido";
	}
	
	
}
