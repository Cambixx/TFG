package com.edix.apirest.pets.entities;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Objects;


/**
 * The persistent class for the productos database table.
 * 
 */
@Entity
@Table(name="productos")
@NamedQuery(name="Producto.findAll", query="SELECT p FROM Producto p")
public class Producto implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_productos")
	private int idProductos;

	private String descripcion;

	private String imagen;

	private String nombre;

	private BigDecimal precio;

	private int stock;

	//uni-directional many-to-one association to Tamano
	@ManyToOne
	@JoinColumn(name="id_tamanos")
	private Tamano tamano;

	public Producto() {
	}

	public int getIdProductos() {
		return this.idProductos;
	}

	public void setIdProductos(int idProductos) {
		this.idProductos = idProductos;
	}

	public String getDescripcion() {
		return this.descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getImagen() {
		return this.imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public String getNombre() {
		return this.nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public BigDecimal getPrecio() {
		return this.precio;
	}

	public void setPrecio(BigDecimal precio) {
		this.precio = precio;
	}

	public int getStock() {
		return this.stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public Tamano getTamano() {
		return this.tamano;
	}

	public void setTamano(Tamano tamano) {
		this.tamano = tamano;
	}

	@Override
	public String toString() {
		return "Producto [idProductos=" + idProductos + ", descripcion=" + descripcion + ", imagen=" + imagen
				+ ", nombre=" + nombre + ", precio=" + precio + ", stock=" + stock + ", tamano=" + tamano + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(idProductos);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof Producto))
			return false;
		Producto other = (Producto) obj;
		return idProductos == other.idProductos;
	}
	
	

}