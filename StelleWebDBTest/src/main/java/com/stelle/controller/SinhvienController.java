package com.stelle.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stelle.DAO.SinhvienDAO;
import com.stelle.models.Sinhvien;

@WebServlet("/")
public class SinhvienController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SinhvienDAO svDAO;

	public void init() {
		svDAO = new SinhvienDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		try {
			String action = request.getServletPath();
			switch (action) {
			case "/newsv":
				showNewForm(request, response);
				break;
			case "/insertsv":
				insertSinhvien(request, response);
				break;
			case "/deletesv":
				deleteSinhvien(request, response);
				break;
			case "/editsv":
				showEditForm(request, response);
				break;
			case "/updatesv":
				updateSinhvien(request, response);
				break;
			default:
				listSinhvien(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listSinhvien(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Sinhvien> listSV = svDAO.selectAllSinhvien();
		request.setAttribute("listSV", listSV);
		RequestDispatcher dispatcher = request.getRequestDispatcher("sinhvien-list.jsp");
		dispatcher.forward(request, response);
	}

	private void updateSinhvien(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		String ten = request.getParameter("ten");
		int lop_id = Integer.parseInt(request.getParameter("lop_id")); // Interger
		Sinhvien sv = new Sinhvien(id, ten, lop_id);
		svDAO.updateSinhvien(sv);
		response.sendRedirect("list");
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		Sinhvien existingSinhvien = svDAO.selectSinhvien(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("sinhvien-form.jsp");
		request.setAttribute("sv", existingSinhvien);
		dispatcher.forward(request, response);
	}

	private void deleteSinhvien(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		svDAO.deleteSinhvien(id);
		response.sendRedirect("list");
	}

	private void insertSinhvien(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		// TODO Auto-generated method stub
		String ten = request.getParameter("ten");
		int lop_id = Integer.parseInt(request.getParameter("lop_id"));
		Sinhvien sv = new Sinhvien(ten,lop_id);
		svDAO.insertSinhvien(sv);
		response.sendRedirect("list");
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("sinhvien-form.jsp");
		dispatcher.forward(request, response);
	}
}
