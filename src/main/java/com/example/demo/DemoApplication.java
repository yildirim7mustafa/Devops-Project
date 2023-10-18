package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
@RequestMapping("api/")
public class DemoApplication {

	Repo repo;
	@GetMapping()
	public String message() {return "Lorem v3"; }

	@PostMapping("posted")
	public ResponseEntity<String> sendMessage(){
		return new ResponseEntity<>(repo.save("Selam"), HttpStatus.OK);
	}

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

}
