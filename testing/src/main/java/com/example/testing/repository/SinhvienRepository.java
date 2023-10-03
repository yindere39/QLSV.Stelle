package com.example.testing.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.testing.controller.SinhvienController;
import com.example.testing.model.Sinhvien;

public interface SinhvienRepository extends JpaRepository<Sinhvien, Integer> {
	List<Sinhvien> findByTenContaining(String ten);
	//List<Sinhvien> findByLopid(int lopid);
	List<Sinhvien> findByTenContainingAndLopidContaining(String ten,String lopid);
	//List<Sinhvien> findByLopidContaining(String lopid);
	List<Sinhvien> findByLopidContaining(String lopid);
	//Optional<Sinhvien> findByLopid(String lopid);
	//Optional<Sinhvien> findByLopid(String lopid);
}
