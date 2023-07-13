package by.itstep.designerWebsite.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {


	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public AuthenticationManager authenticationManager(HttpSecurity http) throws Exception {
		AuthenticationManagerBuilder auth = http.getSharedObject(AuthenticationManagerBuilder.class);
		auth.inMemoryAuthentication().withUser("admin").password(new BCryptPasswordEncoder().encode("admin"))
				.roles("ADMIN");
		auth.inMemoryAuthentication().passwordEncoder(passwordEncoder());
		return auth.build();
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/", "/about", "/{id}", "/portfolio", " /login", "/h2-console", "/h2-console/**")
			.permitAll()
			.antMatchers("/save", "/portfolio/delete/{id}", "/users/delete/{id}", "/users", "/users/{id}")
			.hasRole("ADMIN")
			.and().formLogin().loginPage("/login").failureUrl("/login?error=true")
			.usernameParameter("name").passwordParameter("password")
			.permitAll();
		http.csrf().ignoringAntMatchers("/h2-console/**");
		http.logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/");
		// this will allow frames with same origin which is much more safe
		http.headers().frameOptions().sameOrigin();
		return http.build();
	}
}