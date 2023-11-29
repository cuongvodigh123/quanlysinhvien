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
import dao.LopCuaKhoaDao;
import model.Account;
import model.Khoa;
import model.LopCuaKhoa;

/**
 * Servlet implementation class ServerLopCuaKhoa
 */
@WebServlet("/ServerLopCuaKhoa")
public class ServerLopCuaKhoa extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String s1 = request.getParameter("action");
        try {
            switch (s1) {
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

	private void insertMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String idlop = request.getParameter("idlop");
		String idkhoa = request.getParameter("idkhoa");
		Khoa khoa = new KhoaDao().getKhoa(idkhoa);
		System.out.println(khoa.getId());
		LopCuaKhoa lck = new LopCuaKhoa(idlop,khoa);
		boolean x = new LopCuaKhoaDao().insertLopCuaKhoa(lck);
		PrintWriter out = response.getWriter();
		if(x) out.print("ok");
		else out.print("notok");
	}

	private void addnewMh(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		Account acountAccount = new AccountDao().getUser(username);
		request.setAttribute("acountAccount", acountAccount);
		String idkhoa = request.getParameter("idkhoa");
		Khoa khoa = new KhoaDao().getKhoa(idkhoa);
		request.setAttribute("khoa", khoa);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/lopcuakhoa/formlopcuakhoa.jsp");
		dispatcher.forward(request, response);
	}

	private void deleteMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String idlop = request.getParameter("idlop");
		boolean x = new LopCuaKhoaDao().deleteLopCuaKhoa(idlop);
		String username = request.getParameter("username");
		Account acountAccount = new AccountDao().getUser(username);
		request.setAttribute("acountAccount", acountAccount);
		String idkhoa = request.getParameter("idkhoa");
		Khoa khoa = new KhoaDao().getKhoa(idkhoa);
		request.setAttribute("khoa", khoa);
		List<LopCuaKhoa> list = new LopCuaKhoaDao().getListLopCuaKhoa(idkhoa);
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/lopcuakhoa/listlopcuakhoa.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
