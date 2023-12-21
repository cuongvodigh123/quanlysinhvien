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
import dao.LopHocPhanDao;
import dao.MonHocDao;
import dao.MonHocKyHocDao;
import model.Account;
import model.KyHoc;
import model.LopHocPhan;
import model.MonHoc;
import model.MonHocKyHoc;

/**
 * Servlet implementation class ServerMonHocKyHoc
 */
@WebServlet("/ServerMonHocKyHoc")
public class ServerMonHocKyHoc extends HttpServlet {
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
		MonHocKyHoc mhkh = new MonHocKyHocDao().getMonHocKyHoc(id);
		request.setAttribute("mhkh", mhkh);
		List<LopHocPhan> list = new LopHocPhanDao().getListLopHocPhan(id);
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/lophocphan/listlophocphan.jsp");
		dispatcher.forward(request, response);
	}

	private void updateMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String idkyhoc = request.getParameter("idkyhoc");
		KyHoc kh = new KyHocDao().getNamHoc(idkyhoc);
		String idmonhoc = request.getParameter("idmonhoc");
		MonHoc mh = new MonHocDao().getMonHoc(idmonhoc);
		MonHocKyHoc mhkh = new MonHocKyHoc(Integer.parseInt(id),mh,kh);
		boolean x = new MonHocKyHocDao().updateMonHocKyHoc(mhkh);
		PrintWriter out = response.getWriter();
		if(x) out.print("ok");
		else out.print("notok");
	}
		
	private void insertMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String idkyhoc = request.getParameter("idkyhoc");
		KyHoc kh = new KyHocDao().getNamHoc(idkyhoc);
		String idmonhoc = request.getParameter("idmonhoc");
		MonHoc mh = new MonHocDao().getMonHoc(idmonhoc);
		MonHocKyHoc mhkh = new MonHocKyHoc(Integer.parseInt(id),mh,kh);
		boolean x = new MonHocKyHocDao().insertMonHocKyHoc(mhkh);
		PrintWriter out = response.getWriter();
		if(x) out.print("ok");
		else out.print("notok");
	}

	private void formeditMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		Account acountAccount = new AccountDao().getUser(username);
		request.setAttribute("acountAccount", acountAccount);
		String idkyhoc = request.getParameter("idkyhoc");
		KyHoc kyhoc = new KyHocDao().getNamHoc(idkyhoc);
		request.setAttribute("kyhoc", kyhoc);
		String id = request.getParameter("id");
		MonHocKyHoc mhkh = new MonHocKyHocDao().getMonHocKyHoc(id);
		request.setAttribute("mhkh", mhkh);
		List<MonHoc> list = new MonHocDao().getListMonHoc();
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/monhockyhoc/formmonhockyhoc.jsp");
		dispatcher.forward(request, response);
	}
	
	private void addnewMh(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		Account acountAccount = new AccountDao().getUser(username);
		request.setAttribute("acountAccount", acountAccount);
		String idkyhoc = request.getParameter("idkyhoc");
		KyHoc kyhoc = new KyHocDao().getNamHoc(idkyhoc);
		request.setAttribute("kyhoc", kyhoc);
		String soluong = new MonHocKyHocDao().getIDSTT();
		request.setAttribute("soluong", Integer.parseInt(soluong));
		List<MonHoc> list = new MonHocDao().getListMonHoc();
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/monhockyhoc/formmonhockyhoc.jsp");
		dispatcher.forward(request, response);
	}

	private void deleteMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		Account acountAccount =new AccountDao().getUser(username);
		request.setAttribute("acountAccount", acountAccount);
		String id = request.getParameter("id");
		boolean x = new MonHocKyHocDao().deleteMonHocKyHoc(id);
		String idkyhoc = request.getParameter("idkyhoc");
		KyHoc kyhoc = new KyHocDao().getNamHoc(idkyhoc);
		request.setAttribute("kyhoc", kyhoc);
		List<MonHocKyHoc> list = new MonHocKyHocDao().getListMonHocKyHoc(idkyhoc);
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/monhockyhoc/listmonhockyhoc.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
