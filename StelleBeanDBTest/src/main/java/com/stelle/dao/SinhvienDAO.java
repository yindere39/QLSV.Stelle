package com.stelle.dao;

import java.util.List;

import com.stelle.data.Sinhvien;


public interface SinhvienDAO {
	public List<Sinhvien> getSinhvien(Integer offset, Integer maxResults,String keyword,String lopStelle);
	
	public Long count(String keyword,String lopStelle);
	
	public void SaveSinhvien(Sinhvien theSinhvien);
	
	public void deleteSinhvien(int IDSinhvien);
	
	public Sinhvien getSinhvien(int IDSinhvien);
	
	public List<Sinhvien> searchSinhvien(String ten_sinh_vien,String id_lop);
}
