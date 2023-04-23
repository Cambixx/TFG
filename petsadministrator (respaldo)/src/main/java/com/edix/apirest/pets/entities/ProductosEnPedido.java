package com.edix.apirest.pets.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Objects;


/**
 * The persistent class for the productos_en_pedido database table.
 * 
 */
@Entity
@Table(name="productos_en_pedido")
@NamedQuery(name="ProductosEnPedido.findAll", query="SELECT p FROM ProductosEnPedido p")
public class ProductosEnPedido implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="numero_orden")
	private int numeroOrden;

	private int cantidad;

	private BigDecimal precio;

	//bi-directional many-to-one association to Pedido
	@ManyToOne
	@JoinColumn(name="id_pedido")
	private Pedido pedido;

	//uni-directional many-to-one association to Producto
	@ManyToOne
	@JoinColumn(name="id_producto")
	private Producto producto;

	public ProductosEnPedido() {
	}

	public int getNumeroOrden() {
		return this.numeroOrden;
	}

	public void setNumeroOrden(int numeroOrden) {
		this.numeroOrden = numeroOrden;
	}

	public int getCantidad() {
		return this.cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public BigDecimal getPrecio() {
		return this.precio;
	}

	public void setPrecio(BigDecimal precio) {
		this.precio = precio;
	}

	public Pedido getPedido() {
		return this.pedido;
	}

	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}

	public Producto getProducto() {
		return this.producto;
	}

	public void setProducto(Producto producto) {
		this.producto = producto;
	}

	@Override
	public String toString() {
		return "ProductosEnPedido [numeroOrden=" + numeroOrden + ", cantidad=" + cantidad + ", precio=" + precio
				+ ", pedido=" + pedido + ", producto=" + producto + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(numeroOrden);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof ProductosEnPedido))
			return false;
		ProductosEnPedido other = (ProductosEnPedido) obj;
		return numeroOrden == other.numeroOrden;
	}
	
	

}