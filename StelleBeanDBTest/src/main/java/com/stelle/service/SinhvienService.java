package com.stelle.service;

import java.util.List;

import com.stelle.data.Sinhvien;

public interface SinhvienService {
	public List<Sinhvien> getSinhvien(Integer offset, Integer maxResults,String keyword,String lopStelle);
	
	public Long count(String keyword,String lopStelle);
	
	public void saveSinhvien(Sinhvien thesinhvien);
	
	public Sinhvien getSinhvien(int isID);
	
	public void deleteSinhvien(int isID);
	
	public List<Sinhvien> searchSinhvien(String ten_sinh_vien,String id_lop);
}
