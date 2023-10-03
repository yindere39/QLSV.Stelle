package com.stelle.models;

public class Sinhvien {
	private Integer id;
	private String ten;
	private Integer lop_id;
	
	public Sinhvien(Integer id, String ten, Integer lop_id) {
		this.id = id;
		this.ten = ten;
		this.lop_id = lop_id;
	}
	
	public Sinhvien(String ten, Integer lop_id) {
		this.ten = ten;
		this.lop_id = lop_id;
	}
	
	public Sinhvien() {}
	public int getId() {
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
	public Integer getLop_id() {
		return lop_id;
	}
	public void setLop_id(Integer lop_id) {
		this.lop_id = lop_id;
	}
	@Override
	public String toString() {
		return "Sinhvien [id=" + id + ", ten=" + ten + ", lop_id=" + lop_id + "]";
	}
	
	
}
