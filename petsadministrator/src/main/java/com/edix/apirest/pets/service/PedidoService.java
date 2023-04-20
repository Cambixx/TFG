package com.edix.apirest.pets.service;

import java.util.List;

import com.edix.apirest.pets.entities.Pedido;

public interface PedidoService {

	// Sacar lista de pedidos de un usuario
	List<Pedido> pedidosUsuario(int idUsuario);
	
	// Dar de alta un pedido
	int altaPedido(Pedido pedido, String estado);
	
	// Buscar un pedido por su ID
	Pedido findById(int idPedido);
}
