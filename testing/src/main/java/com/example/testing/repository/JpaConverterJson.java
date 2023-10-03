package com.example.testing.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.testing.model.Sinhvien;

public interface JpaConverterJson extends JpaRepository<Sinhvien,String> {

}
