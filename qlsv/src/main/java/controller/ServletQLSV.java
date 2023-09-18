package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import dao.SinhVienDao;
import model.Account;
import model.SinhVien;
import model.Test;

/**
 * Servlet implementation class AjaxController
 */
@WebServlet("/ServletQLSV")
public class ServletQLSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private AccountDao accountDao;
    private SinhVienDao sinhVienDao;
 
    private Account acountAccount = null;
    public void init() {
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
 
        accountDao = new AccountDao(jdbcURL, jdbcUsername, jdbcPassword);
        sinhVienDao = new SinhVienDao(jdbcURL, jdbcUsername, jdbcPassword);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		String s1 = request.getParameter("goto");
        try {
            switch (s1) {
            case "edit":
            	editstudent(request,response);
            	break;
            case "trangchu":
            	showTrangChu(request,response);
            	break;
            case "listsinhvien":
                showList(request, response);
                break;
            case "login":
            	login(request, response);
                break;
            default:
            	if(acountAccount == null) {
            		login(request, response);
            	}
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
	}

	private void editstudent(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String maSV = request.getParameter("maSV");
		SinhVien sinhvien = null;
		if(maSV.equals("new")) {
			sinhvien = new SinhVien();
			System.out.println("new sinh vien");
		}else {
			sinhvien = sinhVienDao.getSinhVien(maSV);
			System.out.println(sinhvien.getTenSV());
		}
		

		request.setAttribute("sinhvien", sinhvien);
		RequestDispatcher dispatcher = request.getRequestDispatcher("editstudent.jsp");
		dispatcher.forward(request, response);
		
	}
	private void showTrangChu(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		acountAccount = accountDao.getUser(username);
		if(acountAccount == null) {
			login(request, response);
		}
		request.setAttribute("acountAccount", acountAccount);
		RequestDispatcher dispatcher = request.getRequestDispatcher("trangchu.jsp");
		dispatcher.forward(request, response);
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("formlogin.jsp");
		dispatcher.forward(request, response);
	}

	private void showList(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		if(acountAccount == null) {
    		login(request, response);
    	}
		// TODO Auto-generated method stub
		request.setAttribute("acountAccount", acountAccount);
		RequestDispatcher dispatcher = request.getRequestDispatcher("listsinhvien.jsp");
		dispatcher.forward(request, response);
	}
	
}
