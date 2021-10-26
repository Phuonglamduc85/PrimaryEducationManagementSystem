package vn.edu.fptu.PrimaryEducationManagementSystem.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.fptu.PrimaryEducationManagementSystem.common.ERole;
import vn.edu.fptu.PrimaryEducationManagementSystem.common.JwtUtils;
import vn.edu.fptu.PrimaryEducationManagementSystem.dto.JwtResponse;
import vn.edu.fptu.PrimaryEducationManagementSystem.dto.LoginRequest;
import vn.edu.fptu.PrimaryEducationManagementSystem.dto.MessageResponse;
import vn.edu.fptu.PrimaryEducationManagementSystem.dto.SignupRequest;
import vn.edu.fptu.PrimaryEducationManagementSystem.entities.Account;
import vn.edu.fptu.PrimaryEducationManagementSystem.entities.Role;
import vn.edu.fptu.PrimaryEducationManagementSystem.repository.AccountRepository;
import vn.edu.fptu.PrimaryEducationManagementSystem.repository.RoleRepository;
import vn.edu.fptu.PrimaryEducationManagementSystem.service.impl.UserDetailsImpl;

@RestController
@RequestMapping("/api/auth")
public class AuthController1 {

	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private AccountRepository accountRepository;

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private PasswordEncoder encoder;

	@Autowired
	private JwtUtils jwtUtils;

	@PostMapping("/signin")
	public ResponseEntity<?> authenticateuser(@RequestBody LoginRequest loginRequest) {

		Authentication authentication = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

		SecurityContextHolder.getContext().setAuthentication(authentication);
		String jwt = jwtUtils.generateJwtToken(authentication);

		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
		List<String> roles = userDetails.getAuthorities().stream().map(item -> item.getAuthority())
				.collect(Collectors.toList());

		return ResponseEntity.ok(new JwtResponse(jwt, userDetails.getId(), userDetails.getUsername(), roles));
	}

	@PostMapping("signup")
	public ResponseEntity<?> registeruser(@Validated @RequestBody SignupRequest signupRequest) {

		if (accountRepository.existsByUsername(signupRequest.getUsername())) {
			return ResponseEntity.badRequest().body(new MessageResponse("Error: Username is already taken"));
		}

		// Create new user's account
		Account account = new Account(accountRepository.findAll().size() + 1, signupRequest.getUsername(),
				encoder.encode(signupRequest.getPassword()));

		Set<String> strRoles = signupRequest.getRole();
		Set<Role> roles = new HashSet<Role>();

		if (strRoles == null) {
			Role userRole = roleRepository.findByRoleName(ERole.ROLE_GUEST)
					.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
			roles.add(userRole);
		} else {
			strRoles.forEach(role -> {
				switch (role) {
				case "admin":
					Role adminRole = roleRepository.findByRoleName(ERole.ROLE_ADMIN)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(adminRole);

					break;
				default:
					Role userRole = roleRepository.findByRoleName(ERole.ROLE_GUEST)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(userRole);
				}
			});
		}

		account.setRoles(roles);
		accountRepository.save(account);

		return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
	}

	@GetMapping("/all")
	public String allAccess() {
		return "Hello World!";
	}

}
