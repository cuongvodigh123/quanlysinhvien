package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import dao.GiangVienDao;
import model.Account;
import model.GiangVien;

/**
 * Servlet implementation class ServerGiangVien
 */
@WebServlet("/ServerGiangVien")
public class ServerGiangVien extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String s1 = request.getParameter("action");
        try {
            switch (s1) {
            case "formedit":
            	formeditMH(request,response);
            	break;
            case "update":
            	updateMH(request,response);
            	break;
            case "insert":
            	insertMH(request,response);
            	break;
            case "addnew":
            	addnewMh(request,response);
            	break;
            case "delete":
            	deleteMH(request,response);
            	break;
            }
        }catch (SQLException ex) {
            throw new ServletException(ex);
        }
	}


	private void updateMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String ten = request.getParameter("ten");
		GiangVien GiangVien = new GiangVien(id,ten);
		boolean x = new GiangVienDao().updateGiangVien(GiangVien);
		PrintWriter out = response.getWriter();
		if(x) out.print("ok");
		else out.print("notok");
	}
		
	private void insertMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String ten = request.getParameter("ten");
		GiangVien GiangVien = new GiangVien(id,ten);
		boolean x = new GiangVienDao().insertGiangVien(GiangVien);
		PrintWriter out = response.getWriter();
		if(x) out.print("ok");
		else out.print("notok");
	}

	private void formeditMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		Account acountAccount = new AccountDao().getUser(username);
		request.setAttribute("acountAccount", acountAccount);
		String id = request.getParameter("id");
		GiangVien giangvien = new GiangVienDao().getGiangVien(id);
		request.setAttribute("giangvien", giangvien);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/giangvien/formgiangvien.jsp");
		dispatcher.forward(request, response);
	}
	
	private void addnewMh(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		Account acountAccount = new AccountDao().getUser(username);
		request.setAttribute("acountAccount", acountAccount);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/giangvien/formgiangvien.jsp");
		dispatcher.forward(request, response);
	}

	private void deleteMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		boolean x = new GiangVienDao().deleteGiangVien(id);
		String username = request.getParameter("username");
		Account acountAccount =new AccountDao().getUser(username);
		List<GiangVien> list = new GiangVienDao().getListGiangVien();
		request.setAttribute("list", list);
		request.setAttribute("acountAccount", acountAccount);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/giangvien/listgiangvien.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
