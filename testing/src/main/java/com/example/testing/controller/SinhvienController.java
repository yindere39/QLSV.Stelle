package com.example.testing.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.testing.repository.JpaConverterJson;
import com.example.testing.repository.SinhvienRepository;
import com.google.gson.Gson;
import com.example.testing.model.*;

//@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/api")
public class SinhvienController {
@Autowired
SinhvienRepository sinhvienRepository;
JpaConverterJson likejs;
@GetMapping("/listsinhvien")
public ResponseEntity<B> getAllSinhviens(@RequestParam(required = false) String ten) {
try {
List<Sinhvien> sinhviens = new ArrayList<Sinhvien>();
//String[] strings = sinhviens.toArray(new String[0]);
if (ten == null)
sinhvienRepository.findAll().forEach(sinhviens::add);
else
sinhvienRepository.findByTenContaining(ten).forEach(sinhviens::add)
;
if (sinhviens.isEmpty()) {
return new ResponseEntity<>(HttpStatus.NO_CONTENT);
}
DanhSachSV ds = new DanhSachSV();
ds.setSinhviens(sinhviens);
A a = new A();
a.setCode(200);
a.setFbtrace_id("ffff");
a.setMessage("mdfdkfjkdf");
a.setType("type");
B b = new B();
b.setError(a);
return new ResponseEntity<>(b, HttpStatus.OK);
} catch (Exception e) {
return new ResponseEntity<>(null,
HttpStatus.INTERNAL_SERVER_ERROR);
}
}
@GetMapping("/listsinhvien/{id}")
public ResponseEntity<Sinhvien> getReferenceById(@PathVariable("id") Integer id) {
Optional<Sinhvien> tutorialData = sinhvienRepository.findById(id);
if (tutorialData.isPresent()) {
return new ResponseEntity<>(tutorialData.get(),
HttpStatus.OK);
} else {
return new ResponseEntity<>(HttpStatus.NOT_FOUND);
}
}
@GetMapping("/listsinhvien/lopidandten")
public ResponseEntity<List<Sinhvien>> findByTenContainingAndLopidContaining(@RequestParam(value = "ten", required = false) String ten,@RequestParam(value = "lopid", required = false) String lopid) {
	System.out.println("lopid=" + lopid);
	System.out.println("ten=" + ten);
	try {
		List<Sinhvien> sinhvien =sinhvienRepository.findByTenContainingAndLopidContaining(ten,lopid);
		if (ten == null) {
			sinhvienRepository.findByLopidContaining(lopid).forEach(sinhvien::add);
		}
		else if (lopid == null) {
			sinhvienRepository.findByTenContaining(ten).forEach(sinhvien::add);
		}
		System.out.println("tim thay " + sinhvien.size() + " sinh vien");
		if (sinhvien.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<>(sinhvien, HttpStatus.OK);
	} catch (Exception e) {
		e.printStackTrace();
	}	
	return new ResponseEntity<>(HttpStatus.NO_CONTENT);
}
/*@GetMapping("/listsinhvien/lopidandten")
public ResponseEntity<List<Sinhvien>> findByLopidAndTenContaining(@RequestParam(value = "ten", required = false) String ten,@RequestParam(value = "lopid", required = false) Integer lopid) {
try {
List<Sinhvien> sinhviens = sinhvienRepository.findByLopidAndTenContaining(ten,lopid);
if (sinhviens.isEmpty()) {
return new ResponseEntity<>(HttpStatus.NO_CONTENT);
}
return new ResponseEntity<>(sinhviens, HttpStatus.OK);
} catch (Exception e) {
return new
ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
}
}*/
}
