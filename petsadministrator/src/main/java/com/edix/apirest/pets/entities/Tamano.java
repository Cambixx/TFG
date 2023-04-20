package com.edix.apirest.pets.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.*;


/**
 * The persistent class for the tamanos database table.
 * 
 */
@Entity
@Table(name="tamanos")
@NamedQuery(name="Tamano.findAll", query="SELECT t FROM Tamano t")
public class Tamano implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_tamanos")
	private int idTamanos;

	private String imagen;

	private String nombre;

	public Tamano() {
	}

	public int getIdTamanos() {
		return this.idTamanos;
	}

	public void setIdTamanos(int idTamanos) {
		this.idTamanos = idTamanos;
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

	@Override
	public String toString() {
		return "Tamano [idTamanos=" + idTamanos + ", imagen=" + imagen + ", nombre=" + nombre + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(idTamanos);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof Tamano))
			return false;
		Tamano other = (Tamano) obj;
		return idTamanos == other.idTamanos;
	}
	
	

}