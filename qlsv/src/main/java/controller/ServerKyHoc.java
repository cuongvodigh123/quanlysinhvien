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
import dao.KyHocDao;
import dao.MonHocKyHocDao;
import model.Account;
import model.KyHoc;
import model.MonHocKyHoc;

/**
 * Servlet implementation class ServerNamHoc
 */
@WebServlet("/ServerKyHoc")
public class ServerKyHoc extends HttpServlet {
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
		KyHoc kyhoc = new KyHocDao().getNamHoc(id);
		request.setAttribute("kyhoc", kyhoc);
		List<MonHocKyHoc> list = new MonHocKyHocDao().getListMonHocKyHoc(id);
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/monhockyhoc/listmonhockyhoc.jsp");
		dispatcher.forward(request, response);
	}

	private void updateMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String danghoc = request.getParameter("danghoc");
		String mota = request.getParameter("mota");
		KyHoc namhoc = new KyHoc(Integer.parseInt(id), Integer.parseInt(danghoc),mota);
		boolean x = new KyHocDao().updateNamHoc(namhoc);
		PrintWriter out = response.getWriter();
		if(x) out.print("ok");
		else out.print("notok");
	}
		
	private void insertMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String danghoc = request.getParameter("danghoc");
		String mota = request.getParameter("mota");
		KyHoc namhoc = new KyHoc(Integer.parseInt(id), Integer.parseInt(danghoc),mota);
		boolean x = new KyHocDao().insertNamHoc(namhoc);
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
		KyHoc kyhoc = new KyHocDao().getNamHoc(id);
		request.setAttribute("kyhoc", kyhoc);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/kyhoc/formkyhoc.jsp");
		dispatcher.forward(request, response);
	}
	
	private void addnewMh(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		Account acountAccount = new AccountDao().getUser(username);
		request.setAttribute("acountAccount", acountAccount);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/kyhoc/formkyhoc.jsp");
		dispatcher.forward(request, response);
	}

	private void deleteMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		boolean x = new KyHocDao().deleteNamHoc(id);
		String username = request.getParameter("username");
		Account acountAccount =new AccountDao().getUser(username);
		List<KyHoc> list = new KyHocDao().getListNamHoc();
		request.setAttribute("list", list);
		request.setAttribute("acountAccount", acountAccount);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/kyhoc/listkyhoc.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
