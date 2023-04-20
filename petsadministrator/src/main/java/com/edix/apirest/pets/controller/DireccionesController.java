package com.edix.apirest.pets.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edix.apirest.pets.entities.Direccion;
import com.edix.apirest.pets.entities.Usuario;
import com.edix.apirest.pets.repository.UsuarioRepository;
import com.edix.apirest.pets.service.DireccionService;
import com.edix.apirest.pets.service.UsuarioService;

@Controller
public class DireccionesController {
	
	@Autowired
	private DireccionService dserv;

	@Autowired
	private UsuarioService userv;
	
	@Autowired
	private UsuarioRepository urepo;
	
	// Ir al formulario para añadir direccion del Usuario
	@GetMapping("/alta-direccion/{id}")
	public String altaDireccion(Model model, @PathVariable(name="id") int  idUsuario) {
		Usuario user = userv.findById(idUsuario);
		model.addAttribute("usuario", user);
				
		return "alta-direccion";
	}
		
	// Formulario para añadir direccion del Usuario
	@PostMapping("/alta-direccion/{id}")
	public String altaDireccion(RedirectAttributes ratt, Direccion direccion, @PathVariable(name="id") int  idUsuario) {
		Usuario user = userv.findById(idUsuario);
			
		user.addDireccion(direccion);
		urepo.save(user);
			
		ratt.addFlashAttribute("mensaje", "<div class=\"alert alert-success\" role=\"alert\">\r\n"
				+ "  Direccion añadida correctamente\r\n"
				+ "</div>");
			
		return "redirect:/lista-direcciones/{id}";
	}
	
	// Borrar direreccion del usuario
	@GetMapping("/borrar-direccion/{id}")
	public String eliminarDireccion(Authentication aut, Model model, @PathVariable("id") int idDireccion) {
		String username = aut.getName();
		Usuario user = userv.buscarUsuario(username);
			
		Direccion direccion = dserv.buscarDireccion(idDireccion);
			
		user.removeDireccion(direccion);
		urepo.save(user);
			
		model.addAttribute("mensaje", "<div class=\"alert alert-success\" role=\"alert\">\r\n"
				+ "  Direccion eliminada correctamente\r\n"
				+ "</div>");
		
		List<Direccion> direcciones = dserv.direccionesUsuario(user.getIdUsuario());
		model.addAttribute("direccionesUsuario", direcciones);
			
		return "lista-direcciones";
	}
		
	// Página para ditar una dirección
	@GetMapping("/editar-direccion/{id}")
	public String enviarFormularioEditar(Model model, @PathVariable("id") int idDireccion) {
		model.addAttribute("direccion", dserv.buscarDireccion(idDireccion));
			
		return "editar-direccion";
	}
		
	// Formulario para editar la dirección
	@PostMapping("/editar-direccion/{id}")
	public String procesarFormularioEditar(Authentication aut,Model model,Direccion direccion,  @PathVariable("id") int  idDireccion) {
			
		String username = aut.getName();
		Usuario user = userv.buscarUsuario(username);
			
		if (dserv.buscarDireccion(idDireccion) == null){
			model.addAttribute("mensaje", "<div class=\"alert alert-warning\" role=\"alert\">\r\n"
					+ "  La dirección no existe\r\n"
					+ "</div>");
		}else{
			direccion.setIdDireccion(idDireccion);
			if (dserv.modificarDireccion(direccion) == 1) {
				model.addAttribute("mensaje", "<div class=\"alert alert-success\" role=\"alert\">\r\n"
					+ "  Direccion editada con éxito\r\n"
					+ "</div>");
			}else {
				model.addAttribute("mensaje", "<div class=\"alert alert-warning\" role=\"alert\">\r\n"
					+ "  La dirección no se ha podido editar\r\n"
					+ "</div>");
			}
		}
			
		List<Direccion> direcciones = dserv.direccionesUsuario(user.getIdUsuario());
		model.addAttribute("direccionesUsuario", direcciones);
			
		return "lista-direcciones";
	}
	
}
