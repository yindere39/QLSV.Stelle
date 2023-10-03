package com.stelle.dao;


import java.util.List;

import com.stelle.data.Sinhvien;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SinhvienDAOImpl implements SinhvienDAO {
	//@Resouce(name="sessionFactory")
	@Autowired
	SessionFactory sessionFactory;
		

	@SuppressWarnings("unchecked")
	public List<Sinhvien> getSinhvien(Integer offset, Integer maxResults,String keyword, String lopStelle) {
		// TODO Auto-generated method stub
		String sql = "from Sinhvien where 1 = 1";
		if(keyword != null && keyword.length() > 0) {
			sql += " and ten_sinh_vien like :ten";
		}
		if(lopStelle != null && lopStelle.length() > 0) {
			sql += " and id_lop like :lop";
		}

		sql += " order by id";

		Query query = sessionFactory.openSession().createQuery(sql);
		if(keyword != null && keyword.length() > 0) {
			query.setParameter("ten", "%" + keyword + "%");
		}
		
		if(lopStelle != null&& lopStelle.length() > 0) {
			query.setParameter("lop", "%" + lopStelle + "%");
		}
		
		return  query.setFirstResult(offset!=null?offset:0)
                .setMaxResults(maxResults!=null?maxResults:10)
                .list();
		
	}
	@SuppressWarnings("unchecked")
    public Long count(String keyword,String lopStelle){
		String sql = "select count(*) from Sinhvien where 1 =1";
		if(keyword != null && keyword.length() > 0) {
			sql += " and ten_sinh_vien like :ten";
		}
		if(lopStelle != null && lopStelle.length() > 0) {
			sql += " and id_lop like :lop";
		}
		Query query = sessionFactory.openSession().createQuery(sql);
		if(keyword != null && keyword.length() > 0) {
			query.setParameter("ten", "%" + keyword + "%");
		}
		
		if(lopStelle != null&& lopStelle.length() > 0) {
			query.setParameter("lop", "%" + lopStelle + "%");
		}
		
		return (Long) query.uniqueResult();
    }
	
	
	@Override
	public void SaveSinhvien(Sinhvien theSinhvien) {
		// TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(theSinhvien);
	}
	@Override
	public void deleteSinhvien(int IDSinhvien) {
		//TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Query<Sinhvien> query=currentSession.createQuery("delete from Sinhvien where id=:sinhvienID");
		query.setParameter("sinhvienID", IDSinhvien);
		query.executeUpdate();
	}
	@Override
	public Sinhvien getSinhvien(int IDSinhvien) {
		//TODO Auto-generated method stub
		Session currentSession=sessionFactory.getCurrentSession();
		Sinhvien sinhvien=currentSession.get(Sinhvien.class, IDSinhvien);
		return sinhvien;
	}
	@Override
	public List<Sinhvien> searchSinhvien(String ten_sinh_vien,String id_lop) {
		//TODO Auto-generated method stub
		 Session currentSession=sessionFactory.getCurrentSession();
			Query<Sinhvien> query=currentSession.createQuery("SELECT * FROM sdaggds");
			return query.list();
	}
	
	 /*@Transactional
	 @SuppressWarnings("unchecked")   
	 //Passed parameter name in my method to be called by controller class    
	  public List<Sinhvien> getSinhvien(String name) {
	  Session currentSession = sessionFactory.getCurrentSession();                 
	  String hql = "from Sinhvien where ten_sinh_vien like :keyword";
	  Query query = currentSession.createQuery(hql);
	  query.setParameter("keyword", "%" + name + "%");            
	  List<Sinhvien>sinhvien =query.getResultList();          
	  return sinhvien;
}*/
}
