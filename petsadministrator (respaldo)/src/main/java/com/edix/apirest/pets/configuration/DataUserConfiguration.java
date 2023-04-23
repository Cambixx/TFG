package com.edix.apirest.pets.configuration;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
@Configuration
public class DataUserConfiguration extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private DataSource dataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth
			.jdbcAuthentication().dataSource(dataSource)
			.usersByUsernameQuery("select username, password, enabled from Usuarios where username = ?")
			.authoritiesByUsernameQuery("select Usuarios.username, Roles.nombre from Usuarios inner join Roles on Roles.id_rol = Usuarios.id_rol where Usuarios.username = ?");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			// Para que funcionen los formularios
			.csrf().disable()
			.authorizeRequests()
			// Los directorios estáticos no requieren autenticacion
			.antMatchers("/bootstrap/**",  "/images/**", "/css/**", "js/**").permitAll()
			.antMatchers("/rest/demo-bcrypt/**").permitAll()
			
			// Las vistas públicas no requieren autenticación
			.antMatchers("/", "/login", "/logout", "/registro","/buscador", "/sobre-nosotros", "/contacto", "/lista-productos", "/lista-productos/**", "/ver-producto/**", "/datos-personales", "/pedidos", "/rest/**","/rest/uno/*", "/cesta/**").permitAll()
			// Las autorizaciones sobre urls para ROLES
			.antMatchers("/lista-productos/editar-producto/**").hasAnyAuthority("Admin")
			.antMatchers("/lista-productos/borrar-producto/**").hasAnyAuthority("Admin")
			.antMatchers("/lista-usuarios").hasAnyAuthority("Admin")
			.antMatchers("/lista-roles").hasAnyAuthority("Admin")
			.antMatchers("/gracias").hasAnyAuthority("Cliente", "Admin")
			
			// Todas las demás URLs de la Aplicación requieren autenticación
			.anyRequest().authenticated()
			// El formulario de Login no requiere autenticacion
			.and().formLogin().permitAll()
			//.and().formLogin().loginPage("/login").permitAll()
			// El formulario de logout no requiere autenticacion
			
			;
			
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	
	

}
