package vn.edu.fptu.PrimaryEducationManagementSystem.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import vn.edu.fptu.PrimaryEducationManagementSystem.common.ERole;
import vn.edu.fptu.PrimaryEducationManagementSystem.entities.Adminitrator;
import vn.edu.fptu.PrimaryEducationManagementSystem.entities.Role;
import vn.edu.fptu.PrimaryEducationManagementSystem.repository.AdminitratorRepository;

@RestController
@RequestMapping("/api/profile")
public class ViewProfileController {

	@Autowired
	AdminitratorRepository adminRepo;

	@GetMapping("/admin")
	public ResponseEntity<Adminitrator> findAdminProfileByAccId(@RequestParam int id) {
		Adminitrator admin = adminRepo.findByAccId(id);
		
		return new ResponseEntity<Adminitrator>(admin, HttpStatus.OK);
	}
	
	@PostMapping("/admin")
	public ResponseEntity<Adminitrator> editAdminProfile(@RequestBody Adminitrator admin) {
		
		adminRepo.save(admin);
		return new ResponseEntity<Adminitrator>(admin, HttpStatus.OK);
	}
}
