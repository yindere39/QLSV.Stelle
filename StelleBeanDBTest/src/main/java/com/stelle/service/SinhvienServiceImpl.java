package com.stelle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stelle.dao.SinhvienDAO;
import com.stelle.data.Sinhvien;

@Service
public class SinhvienServiceImpl implements SinhvienService{
	@Autowired
	private SinhvienDAO sinhvienDAO;
	@Override
	@Transactional
	public List<Sinhvien> getSinhvien(Integer offset, Integer maxResults,String keyword,String lopStelle) {
		// TODO Auto-generated method stub
		return sinhvienDAO.getSinhvien(offset,maxResults,keyword,lopStelle);
	}
	
	@Override
	@Transactional
	public Long count(String keyword,String lopStelle) {
        return sinhvienDAO.count(keyword,lopStelle);
    }
	
	
	@Override
	@Transactional
	public void saveSinhvien(Sinhvien thesinhvien) {
		// TODO Auto-generated method stub
		sinhvienDAO.SaveSinhvien(thesinhvien);
	}
	@Override
	@Transactional
	public Sinhvien getSinhvien(int isID) {
		// TODO Auto-generated method stub
		return sinhvienDAO.getSinhvien(isID);
	}
	@Override
	@Transactional
	public void deleteSinhvien(int isID) {
		//TODO Auto-generated method stub
		sinhvienDAO.deleteSinhvien(isID);
	}
	@Override
	@Transactional
	public List<Sinhvien> searchSinhvien(String ten_sinh_vien,String id_lop) {
		//TODO Auto-generated method stub
		return sinhvienDAO.searchSinhvien(ten_sinh_vien,id_lop);
	}
	
	/*@Override
	@Transactional
	public List<Sinhvien> getSinhvien(String name) {
		//TODO Auto-generated method stub
		return sinhvienDAO.getSinhvien(name);
	}*/
}
