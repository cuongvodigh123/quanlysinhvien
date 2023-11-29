package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import dao.UpdateMKSV;
import model.Account;

/**
 * Servlet implementation class CheckLogin
 */
@WebServlet("/CheckLogin")
public class CheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private AccountDao accountDao;

    public void init() {
        accountDao = new AccountDao();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String vaitro = request.getParameter("vaitro");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
//		System.out.println(vaitro+" "+username+" "+password);
		PrintWriter out = response.getWriter();
		if(vaitro.equals("giangvien")) {
			Account acc = accountDao.checklogin(username, password);
			if(acc==null) {
				out.print("error");
			}else {
				out.print("giangvien");
			}
		}else {
			boolean x = new UpdateMKSV().checkTK(username, password);
			if(!x) {
				out.print("error");
			}else {
				out.print("sinhvien");
			}
		}
		
		
	}

}
