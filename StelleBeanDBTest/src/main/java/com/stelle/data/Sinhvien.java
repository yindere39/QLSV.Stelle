package com.stelle.data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="SINH_VIEN")
public class Sinhvien {
	@Id
	@GeneratedValue(generator = "SINHVIENS_SEQ", strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(
        name = "SINHVIENS_SEQ", 
        sequenceName = "SINHVIENS_SEQ",
        allocationSize = 1
    )
	@Column(name="ID")
	private Integer id;
	@Column(name="TEN")
	private String ten_sinh_vien;
	@Column(name="LOP_ID")
	private String id_lop;
	
	public Sinhvien(Integer id, String ten_sinh_vien, String id_lop) {
		this.id = id;
		this.ten_sinh_vien = ten_sinh_vien;
		this.id_lop = id_lop;
	}

	public Sinhvien() {}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTen_sinh_vien() {
		return ten_sinh_vien;
	}

	public void setTen_sinh_vien(String ten_sinh_vien) {
		this.ten_sinh_vien = ten_sinh_vien;
	}

	public String getId_lop() {
		return id_lop;
	}

	public void setId_lop(String id_lop) {
		this.id_lop = id_lop;
	}

	@Override
	public String toString() {
		return "Sinhvien [id=" + id + ", ten_sinh_vien=" + ten_sinh_vien + ", id_lop=" + id_lop + "]";
	}
	
	
	
	
}
