package com.edix.apirest.pets.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.edix.apirest.pets.entities.Tamano;
import com.edix.apirest.pets.entities.Rol;
import com.edix.apirest.pets.entities.Usuario;
import com.edix.apirest.pets.service.TamanoService;
import com.edix.apirest.pets.service.RolService;
import com.edix.apirest.pets.service.UsuarioService;

@Controller
public class HomeController {
	
	@Autowired
	private UsuarioService userv;
	
	@Autowired
	private RolService rserv;
	
	@Autowired
	private TamanoService tserv;


	// Página de inicio
	@GetMapping("/")
	public String inicioLogin(Authentication aut, Tamano tamano, HttpSession misesion) {
		List<Tamano> lista = tserv.todosTamanos();
		misesion.setAttribute("listaFamilias", lista);

		return "inicio";
	}
	
	// Página se Sobre nosotros
	@GetMapping("/sobre-nosotros")
	public String sobreNosotros() {
		return "sobre-nosotros";
	}
	
	//Guardar el usuario en sesión después de loguearse
	@GetMapping("/index")
	public String procesarLogin(Authentication aut, Model model, HttpSession misesion) {
		String username = aut.getName();
		Usuario user = userv.buscarUsuario(username);
		
		if (misesion.getAttribute("usuario") == null)
			misesion.setAttribute("usuario", user);
		
		return "redirect:/";
	}
	
	// Mostrar lista Roles
	@GetMapping("/lista-roles")
	public String verRoles(Model model) {
		List<Rol> lista = rserv.todosRoles();
		model.addAttribute("listaRoles", lista);
			
		return "lista-roles";
	}
	
	// Mostrar lista Usuarios
	@GetMapping("/lista-usuarios")
	public String verUsuarios(Model model) {
		List<Usuario> lista = userv.todosUsuarios();
		model.addAttribute("listaUsuarios", lista);
		
		return "lista-usuarios";
	}

	
}
