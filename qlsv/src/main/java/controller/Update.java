package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import dao.SinhVienDao;
import model.Account;

/**
 * Servlet implementation class Update
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private AccountDao accountDao;
    private SinhVienDao sinhVienDao;

    public void init() {
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
 
        accountDao = new AccountDao(jdbcURL, jdbcUsername, jdbcPassword);
        sinhVienDao = new SinhVienDao(jdbcURL, jdbcUsername, jdbcPassword);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
        switch (action) {
        case "anhdaidien":
        	anhdaidien(request,response);
        	break;
        default:
        }
	}
	private void anhdaidien(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String base64 = request.getParameter("base64");
		boolean a = accountDao.updateImage(username, base64);
		System.out.println("base64 :"+base64);
		PrintWriter out = response.getWriter();
		if(a) out.print("ok");
		else out.print("notok");
	}

}
