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
            case "trangchu":
            	showTrangChu(request,response);
            	break;
            case "listsinhvien":
                showList(request, response);
                break;
            case "addsinhvien":
                addsinhvien(request, response);
                break;
            case "deletesinhvien":
                deletesinhvien(request, response);
                break;
            case "updatesinhvien":
                updatesinhvien(request, response);
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


	private void updatesinhvien(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		
	}

	private void deletesinhvien(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		
	}

	private void addsinhvien(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		
	}

	private void showList(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		
	}

}
