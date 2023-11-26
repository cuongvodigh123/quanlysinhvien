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
import dao.MonHocDao;
import model.Account;
import model.MonHoc;
import model.Khoa;

/**
 * Servlet implementation class ServerMonHoc
 */
@WebServlet("/ServerMonHoc")
public class ServerMonHoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String s1 = request.getParameter("action");
        try {
            switch (s1) {
            case "xemMH":
            	xemMH(request,response);
            	break;
            case "formeditMH":
            	formeditMH(request,response);
            	break;
            case "update":
            	updateMH(request,response);
            	break;
            case "insert":
            	insertMH(request,response);
            	break;
            case "addnewMh":
            	addnewMh(request,response);
            	break;
            case "deleteMH":
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
		MonHoc monhoc = new MonHocDao().getMonHoc(id);
		request.setAttribute("monhoc", monhoc);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/monhoc/xemmonhoc.jsp");
		dispatcher.forward(request, response);
	}

	private void updateMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String idkhoa = request.getParameter("idkhoa");
		Khoa khoa = new KhoaDao().getKhoa(idkhoa);
		String ten = request.getParameter("ten");
		String tinchi = request.getParameter("tinchi");
		MonHoc monhoc = new MonHoc(id,ten,khoa,Integer.parseInt(tinchi));
		boolean x = new MonHocDao().updateMonHoc(monhoc);
		PrintWriter out = response.getWriter();
		if(x) out.print("ok");
		else out.print("notok");
	}
		
	private void insertMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String idkhoa = request.getParameter("idkhoa");
		Khoa khoa = new KhoaDao().getKhoa(idkhoa);
		String ten = request.getParameter("ten");
		String tinchi = request.getParameter("tinchi");
		MonHoc monhoc = new MonHoc(id,ten,khoa,Integer.parseInt(tinchi));
		boolean x = new MonHocDao().insertMonHoc(monhoc);
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
		MonHoc mh = new MonHocDao().getMonHoc(id);
		request.setAttribute("monhoc", mh);
		List<Khoa> list = new KhoaDao().getListKhoa();
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/monhoc/formMonhoc.jsp");
		dispatcher.forward(request, response);
	}
	
	private void addnewMh(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		Account acountAccount = new AccountDao().getUser(username);
		request.setAttribute("acountAccount", acountAccount);
		List<Khoa> list = new KhoaDao().getListKhoa();
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/monhoc/formMonhoc.jsp");
		dispatcher.forward(request, response);
	}

	private void deleteMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		boolean x = new MonHocDao().deleteMonHoc(id);
		Account acountAccount = new AccountDao().getUser(username);
		request.setAttribute("acountAccount", acountAccount);
		List<MonHoc> list = new MonHocDao().getListMonHoc();
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/monhoc/listmonhoc.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
