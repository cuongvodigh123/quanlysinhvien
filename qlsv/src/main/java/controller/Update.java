package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import dao.SinhVienDao;
import model.Account;
import model.SinhVien;

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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException  {
		String action = request.getParameter("action");
		System.out.println("Update: "+action);
		try {
	        switch (action) {
	        case "addstudent":
	        	addstudent(request,response);
	        	break;
	        case "savestudent":
				saveStudent(request,response);
	        	break;
	        case "sort":
	        	sortlist(request,response);
	        	break;
	        case "getliststudent":
					getlist(request,response);
	        	break;
	        case "doimk":
	        	doimatkhau(request,response);
	        	break;
	        case "anhdaidien":
	        	anhdaidien(request,response);
	        	break;
	        default:
	        }
		}catch (SQLException ex) {
			throw new ServletException(ex);
		}catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void addstudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException{
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String base64 = request.getParameter("base64");
		String maSVold = request.getParameter("maSVold").trim();
		System.out.println("'"+maSVold+"'");
		if(!maSVold.equals("")) {
			out.print("notok");
			return;
		}
		String maSV = request.getParameter("maSV").trim();
		if(maSV.length()!=10) {
			out.print("notok");
			return;
		}
		String tenSV = request.getParameter("tenSV");
		String lopSV = request.getParameter("lopSV");
		Integer gioiTinh = Integer.parseInt(request.getParameter("gioiTinh"));
		String ngaySinh = request.getParameter("ngaySinh");
		String soDienThoai = request.getParameter("soDienThoai");
		String email = request.getParameter("email");
		String diaChi = request.getParameter("diaChi");
		String ghiChu = request.getParameter("ghiChu");
		byte[] bytes = Base64.getDecoder().decode(tenSV);
        String ten = new String(bytes);
		SinhVien sv = new SinhVien(maSV,ten,lopSV,gioiTinh,ngaySinh,soDienThoai,email,diaChi,ghiChu,base64);
		System.out.println("add "+sv);
		
		boolean x = sinhVienDao.addSinhVien(sv);
		
		if(x) out.print("ok");
		else out.print("notok");
	}
	private void saveStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException{
		// TODO Auto-generated method stub
		
		String base64 = request.getParameter("base64");
		String maSVold = request.getParameter("maSVold").trim();
		String maSV = request.getParameter("maSV").trim();
		String tenSV = request.getParameter("tenSV");
		String lopSV = request.getParameter("lopSV");
		Integer gioiTinh = Integer.parseInt(request.getParameter("gioiTinh"));
		String ngaySinh = request.getParameter("ngaySinh");
		String soDienThoai = request.getParameter("soDienThoai");
		String email = request.getParameter("email");
		String diaChi = request.getParameter("diaChi");
		String ghiChu = request.getParameter("ghiChu");
		byte[] bytes = Base64.getDecoder().decode(tenSV);
        String ten = new String(bytes);
		SinhVien sv = new SinhVien(maSV,ten,lopSV,gioiTinh,ngaySinh,soDienThoai,email,diaChi,ghiChu,base64);
		System.out.println("save "+sv);
		
		boolean x = sinhVienDao.updateSinhVien(sv, maSVold);
		PrintWriter out = response.getWriter();
		if(x) out.print("ok");
		else out.print("notok");
		
	}
	private void doimatkhau(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String mkcu = request.getParameter("mkcu");
		String mkmoi = request.getParameter("mkmoi");
		String mkmoi1 = request.getParameter("mkmoi1");
		Account k = accountDao.checklogin(username, mkcu);
		if(k==null || !mkmoi.equals(mkmoi1)) {
			out.print("notok");
		}else {
			boolean x = accountDao.updateAccount(username, mkmoi);
			if(x) out.print("ok");
			else out.print("notok");
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

	private void getlist(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException, ServletException  {
		// TODO Auto-generated method stub
		List<SinhVien> list = sinhVienDao.findAll("maSV", "", "maSV", false);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(taocodeHTML(list));
	}
	
	private void sortlist(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException, ServletException  {
		// TODO Auto-generated method stub
		
		String typesort = request.getParameter("typesort");
		String desc = request.getParameter("desc");
		boolean x = desc.equals("1") ?  true : false;
		String strFind = request.getParameter("strFind");
		byte[] bytes = Base64.getDecoder().decode(strFind);
		strFind = new String(bytes);
		String sortBy = request.getParameter("sortBy");	
//		System.out.println(typesort+" '"+strFind+"' "+sortBy+" "+desc.toString());
		List<SinhVien> list = sinhVienDao.findAll(typesort, strFind, sortBy, x);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(taocodeHTML(list));
	}
	
	private String taocodeHTML(List<SinhVien> list) {
		String res = "";
		for(SinhVien x:list) {
			res+=	"                <tr>\r\n"
					+ "                    <td><a href=\"/qlsv/ServletQLSV?goto=edit&maSV="+x.getMaSV()+"\" target=\"_blank\">"+x.getMaSV()+"</td>\r\n"
					+ "                    <td>"+x.getTenSV()+"</td>\r\n"
					+ "                    <td>"+x.getLopSV()+"</td>\r\n"
					+ "                    <td>"+x.getGioiTinhString()+"</td>\r\n"
					+ "                    <td>"+x.getNgaySinh()+"</td>\r\n"
					+ "                    <td>"+x.getSoDienThoai()+"</td>\r\n"
					+ "                </tr>\r\n";
		}
		
		return res;
	}
}

