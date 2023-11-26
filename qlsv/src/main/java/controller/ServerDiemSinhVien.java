package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.KetQuaDao;
import model.KetQua;

/**
 * Servlet implementation class ServerDiemSinhVien
 */
@WebServlet("/ServerDiemSinhVien")
public class ServerDiemSinhVien extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String s1 = request.getParameter("action");
        try {
            switch (s1) {
            case "luudiem":
            	luudiem(request,response);
            	break;
            }
        }catch (SQLException ex) {
            throw new ServletException(ex);
        }
	}
	
	private void luudiem(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String diem1 = request.getParameter("diem1");
		String diem2 = request.getParameter("diem2");
		String diem3 = request.getParameter("diem3");
		boolean x = new KetQuaDao().updateKetQua(id,diem1,diem2,diem3);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
}
