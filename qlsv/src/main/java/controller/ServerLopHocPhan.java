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
import dao.KetQuaDao;
import dao.LopHocPhanDao;
import dao.MonHocKyHocDao;
import model.Account;
import model.LopHocPhan;
import model.MonHocKyHoc;
import model.GiangVien;
import model.KetQua;

/**
 * Servlet implementation class ServerLopHocPhan
 */
@WebServlet("/ServerLopHocPhan")
public class ServerLopHocPhan extends HttpServlet {
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
		String idmhkh = request.getParameter("idmhkh");
		LopHocPhan lophocphan = new LopHocPhanDao().getLopHocPhan(id,idmhkh);
		request.setAttribute("lophocphan", lophocphan);
		
		List<KetQua> list = new KetQuaDao().getListKetQua(String.valueOf(lophocphan.getIdstt()));
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/diemsinhvien/listdiemsinhvien.jsp");
		dispatcher.forward(request, response);
	}

	private void updateMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String ten = request.getParameter("ten");
		String mota = request.getParameter("mota");
		String soluong = request.getParameter("soluong");
		String idmonhockyhoc = request.getParameter("idmonhockyhoc");
		MonHocKyHoc mhkh = new MonHocKyHocDao().getMonHocKyHoc(idmonhockyhoc);
		String idgiangvien = request.getParameter("idgiangvien");
		GiangVien giangvien = new GiangVienDao().getGiangVien(idgiangvien);
		LopHocPhan lophocphan = new LopHocPhan(id, ten, mota, Integer.parseInt(soluong), mhkh, giangvien);
		boolean x = new LopHocPhanDao().updateLopHocPhan(lophocphan);
		PrintWriter out = response.getWriter();
		if(x) out.print("ok");
		else out.print("notok");
	}
		
	private void insertMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String ten = request.getParameter("ten");
		String mota = request.getParameter("mota");
		String soluong = request.getParameter("soluong");
		String idmonhockyhoc = request.getParameter("idmonhockyhoc");
		MonHocKyHoc mhkh = new MonHocKyHocDao().getMonHocKyHoc(idmonhockyhoc);
		String idgiangvien = request.getParameter("idgiangvien");
		GiangVien giangvien = new GiangVienDao().getGiangVien(idgiangvien);
		LopHocPhan lophocphan = new LopHocPhan(id, ten, mota, Integer.parseInt(soluong), mhkh, giangvien);
		boolean x = new LopHocPhanDao().insertLopHocPhan(lophocphan);
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
		String idmhkh = request.getParameter("idmhkh");
		
		LopHocPhan lophocphan = new LopHocPhanDao().getLopHocPhan(id,idmhkh);
		request.setAttribute("lophocphan", lophocphan);
		
		MonHocKyHoc mhkh = lophocphan.getMhkh();
		request.setAttribute("mhkh", mhkh);
		
		List<GiangVien> list = new GiangVienDao().getListGiangVien();
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/lophocphan/formlophocphan.jsp");
		dispatcher.forward(request, response);
	}
	
	private void addnewMh(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		Account acountAccount = new AccountDao().getUser(username);
		request.setAttribute("acountAccount", acountAccount);
		
		String idmhkh = request.getParameter("idmhkh");
		MonHocKyHoc mhkh = new MonHocKyHocDao().getMonHocKyHoc(idmhkh);
		request.setAttribute("mhkh", mhkh);
		
		String soluong = request.getParameter("soluong");
		request.setAttribute("soluong", Integer.parseInt(soluong)+1);
		
		List<GiangVien> list = new GiangVienDao().getListGiangVien();
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/lophocphan/formlophocphan.jsp");
		dispatcher.forward(request, response);
	}

	private void deleteMH(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		Account acountAccount =new AccountDao().getUser(username);
		request.setAttribute("acountAccount", acountAccount);
		String id = request.getParameter("id");
		boolean x = new LopHocPhanDao().deleteLopHocPhan(id);
		String idmhkh = request.getParameter("idmhkh");
		MonHocKyHoc mhkh = new MonHocKyHocDao().getMonHocKyHoc(idmhkh);
		request.setAttribute("mhkh", mhkh);
		List<LopHocPhan> list = new LopHocPhanDao().getListLopHocPhan(idmhkh);
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/lophocphan/listlophocphan.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
