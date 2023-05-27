package com.edix.apirest.pets.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.edix.apirest.pets.entities.Rol;
import com.edix.apirest.pets.entities.Tarjeta;
import com.edix.apirest.pets.entities.Usuario;
import com.edix.apirest.pets.repository.TarjetaRepository;
import com.edix.apirest.pets.repository.UsuarioRepository;
import com.edix.apirest.pets.service.TarjetaService;
import com.edix.apirest.pets.service.UsuarioService;


@Controller
public class TarjetasController {
	
	@Autowired
	private TarjetaService tserv;
	
	@Autowired
	private UsuarioService userv;
	
	@Autowired
	private UsuarioRepository urepo;
	
	@Autowired
	private TarjetaRepository trepo;
	
	// Ir al formulario para añadir tarjeta del Usuario
	@GetMapping("/alta-tarjeta/{id}")
	public String altaTarjeta(Model model, @PathVariable(name="id") int  idUsuario) {
		Usuario user = userv.findById(idUsuario);
		model.addAttribute("usuario", user);
		
		return "alta-tarjeta";
	}
	
	// Formulario para añadir tarjeta del Usuario
	@PostMapping("/alta-tarjeta/{id}")
	public String altaTarjeta(RedirectAttributes ratt, Tarjeta tarjeta, @PathVariable(name="id") int  idUsuario) {
		Usuario user = userv.findById(idUsuario);
		
		trepo.save(tarjeta);
		user.addTarjeta(tarjeta);
		urepo.save(user);
		
		ratt.addFlashAttribute("mensaje", "<div class=\"alert alert-success\" role=\"alert\">\r\n"
				+ "  Tarjeta añadida correctamente\r\n"
				+ "</div>");
		
		return "redirect:/lista-tarjetas/{id}";
	}
	
	// Borrar tarjeta del usuario
	@GetMapping("/borrar-tarjeta/{id}")
	public String eliminarTarjeta(Authentication aut, Model model, @PathVariable("id") int idTarjeta) {
		String username = aut.getName();
		Usuario user = userv.buscarUsuario(username);
		
		Tarjeta tarjeta = tserv.buscarTarjeta(idTarjeta);
		
		user.removeTarjeta(tarjeta);
		urepo.save(user);
		
		List<Tarjeta> tarjetas = tserv.tarjetasUsuario(user.getIdUsuario());
		model.addAttribute("tarjetasUsuario", tarjetas);
		
		model.addAttribute("mensaje", "<div class=\"alert alert-success\" role=\"alert\">\r\n"
				+ "  Tarjeta eliminada correctamente\r\n"
				+ "</div>");
		
		return "lista-tarjetas";
	}
	/*
	// Página para editar una tarjeta
	@GetMapping("/editar-tarjeta/{id}")
	public String enviarFormularioEditar(Model model, @PathVariable("id") int idTarjeta) {
		model.addAttribute("tarjeta", tserv.buscarTarjeta(idTarjeta));
		
		return "editar-tarjeta";
	}
	
	// Formulario para editar la tarjeta
	@PostMapping("/editar-tarjeta/{id}")
	public String procesarFormularioEditar(Authentication aut,Model model,Tarjeta tarjeta,  @PathVariable("id") int  idTarjeta) {
		
		String username = aut.getName();
		Usuario user = userv.buscarUsuario(username);
		
		if (tserv.buscarTarjeta(idTarjeta) == null){
			model.addAttribute("mensaje", "<div class=\"alert alert-warning\" role=\"alert\">\r\n"
				+ "  La tarjeta no existe\r\n"
				+ "</div>");
		}else{
			tarjeta.setIdTarjeta(idTarjeta);
			if (tserv.modificarTarjeta(tarjeta) == 1) {
				model.addAttribute("mensaje", "<div class=\"alert alert-success\" role=\"alert\">\r\n"
					+ "  Tarjeta editada con éxito\r\n"
					+ "</div>");
			}else {
				model.addAttribute("mensaje", "<div class=\"alert alert-warning\" role=\"alert\">\r\n"
					+ "  La tarjeta no se ha podido editar\r\n"
					+ "</div>");
			}
		}
		
		List<Tarjeta> tarjetas = tserv.tarjetasUsuario(user.getIdUsuario());
		model.addAttribute("tarjetasUsuario", tarjetas);
		
		return "redirect:/lista-tarjetas/{id}";
	}
	*/
	
	// Ir al formulario para editar la tarjeta
		@GetMapping("/editar-tarjeta/{id}")
		public String editarTarjeta(Model model, @PathVariable(name="id") int  idTarjeta) {
			Tarjeta tarjeta = tserv.buscarTarjeta(idTarjeta);
			model.addAttribute("tarjetaElegida", tarjeta);
				
			return "editar-tarjeta";
		}
		
		// Formulario para editar la tarjeta
		@PostMapping("/editar-tarjeta/{id}")
		public String procesarCambioTarjeta(RedirectAttributes ratt, Tarjeta tarjeta, @PathVariable(name="id") int  idTarjeta) {
				
			if(tserv.buscarTarjeta(idTarjeta) == null) {
				ratt.addFlashAttribute("mensaje", "<div class=\"alert alert-warning\" role=\"alert\">\r\n"
					+ "  La tarjeta no existe\r\n"
					+ "</div>");
			}else {
				tarjeta.setIdTarjeta(idTarjeta);
				if (tserv.modificarTarjeta(tarjeta) == 1) {
					ratt.addFlashAttribute("mensaje", "<div class=\"alert alert-success\" role=\"alert\">\r\n"
						+ "  Tarjeta modificada con éxito\r\n"
						+ "</div>");
				}else {
					ratt.addFlashAttribute("mensaje", "<div class=\"alert alert-warning\" role=\"alert\">\r\n"
						+ "  Tarjeta no modificada\r\n"
						+ "</div>");
				}
			}
				
			return "redirect:/";
		}
	// Formatear la fecha para el formulario
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, false));
	}
	
}

