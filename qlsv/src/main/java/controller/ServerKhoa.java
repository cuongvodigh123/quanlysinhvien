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
import dao.KhoaDao;
import model.Account;
import model.Khoa;

/**
 * Servlet implementation class ServerKhoa
 */
@WebServlet("/ServerKhoa")
public class ServerKhoa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String s1 = request.getParameter("action");
        try {
            switch (s1) {
            case "xem":
            	xemMH(request,response);
            	break;
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

	private void xemMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		Account acountAccount = new AccountDao().getUser(username);
		request.setAttribute("acountAccount", acountAccount);
		String id = request.getParameter("id");
		Khoa khoa = new KhoaDao().getKhoa(id);
		request.setAttribute("khoa", khoa);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/kyhoc/listkyhoc.jsp");
//		dispatcher.forward(request, response);
	}

	private void updateMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String tenkhoa = request.getParameter("tenkhoa");
		Khoa khoa = new Khoa(id,tenkhoa);
		boolean x = new KhoaDao().updateKhoa(khoa);
		PrintWriter out = response.getWriter();
		if(x) out.print("ok");
		else out.print("notok");
	}
		
	private void insertMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String tenkhoa = request.getParameter("tenkhoa");
		Khoa khoa = new Khoa(id,tenkhoa);
		boolean x = new KhoaDao().insertKhoa(khoa);
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
		Khoa khoa = new KhoaDao().getKhoa(id);
		request.setAttribute("khoa", khoa);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/khoa/formkhoa.jsp");
		dispatcher.forward(request, response);
	}
	
	private void addnewMh(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		Account acountAccount = new AccountDao().getUser(username);
		request.setAttribute("acountAccount", acountAccount);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/khoa/formkhoa.jsp");
		dispatcher.forward(request, response);
	}

	private void deleteMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		boolean x = new KhoaDao().deleteKhoa(id);
		String username = request.getParameter("username");
		Account acountAccount =new AccountDao().getUser(username);
		List<Khoa> list = new KhoaDao().getListKhoa();
		request.setAttribute("list", list);
		request.setAttribute("acountAccount", acountAccount);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/khoa/listkhoa.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
