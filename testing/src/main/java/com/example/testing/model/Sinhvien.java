package com.example.testing.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sinh_vien")
public class Sinhvien {
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
private Integer id;
@Column(name = "ten")
private String ten;
@Column(name = "lop_id")
private String lopid;
public Sinhvien() {
}
public Sinhvien(String ten, String lopid) {
	this.ten = ten;
	this.lopid = lopid;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public String getTen() {
	return ten;
}
public void setTen(String ten) {
	this.ten = ten;
}
public String getLopid() {
	return lopid;
}
public void setLopid(String lopid) {
	this.lopid = lopid;
}
@Override
public String toString() {
	return "Sinhvien [id=" + id + ", ten=" + ten + ", lopid=" + lopid + "]";
}
}