package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DangKyHocDao;
import dao.KetQuaDao;
import dao.KyHocDao;
import dao.LopHocPhanDao;
import dao.MonHocDao;
import dao.MonHocKyHocDao;
import dao.SinhVienDao;
import dao.UpdateMKSV;
import model.Account;
import model.KetQua;
import model.KyHoc;
import model.LopHocPhan;
import model.MonHocKyHoc;
import model.SinhVien;

/**
 * Servlet implementation class ServerSinhVien
 */
@WebServlet("/ServerSinhVien")
public class ServerSinhVien extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SinhVien accountSinhVien = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s1 = request.getParameter("action");
		if(s1==null) {
			s1="login";
		}
        try {
            switch (s1) {
            case "xoadangkylophocphan":
            	xoadangkylophocphan(request,response);
            	break;
            case "luudangkylophocphan":
            	luudangkylophocphan(request,response);
            	break;
            case "thaydoidangky":
            	thaydoidangky(request,response);
            	break;
            case "getdangkymonhoc":
            	getdangkymonhoc(request,response);
            	break;
            case "dangkymon":
            	dangkymon(request,response);
            	break;
            case "xemdiem":
            	xemdiemSV(request,response);
            	break;
            case "edit":
            	editstudent(request,response);
            	break;
            case "doimk":
            	doimatkhau(request,response);
            	break;
            case "dangxuat":
            	login(request, response);
                break;
            case "trangchu":
            	showTrangChu(request,response);
            	break;
            default:
            	if(accountSinhVien == null) {
            		login(request, response);
            	}
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
	}

	private void xoadangkylophocphan(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String idlophocphan = request.getParameter("idlophocphan");
//		System.out.println("xoa dang ky hoc "+idlophocphan);
		boolean x = new DangKyHocDao().deleteDangKyHoc(idlophocphan,accountSinhVien.getMaSV());

	}
		
	private void luudangkylophocphan(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String idlophocphan = request.getParameter("idlophocphan");
//		System.out.println("luu dang ky hoc "+idlophocphan);
		Integer slconlai = new DangKyHocDao().getSLConLai(idlophocphan);
		LopHocPhan lhp = new LopHocPhanDao().getLopHocPhanSTT(idlophocphan);
		if(lhp.getSoluong()-slconlai>0) {
			boolean x = new DangKyHocDao().insertDangKyHoc(idlophocphan,accountSinhVien.getMaSV());
		}
	}

	private void thaydoidangky(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String idkyhoc = request.getParameter("idkyhoc");
		KyHoc kyhoc = new KyHocDao().getNamHoc(idkyhoc);
		request.setAttribute("kyhoc", kyhoc);
		List<LopHocPhan> list = new LopHocPhanDao().getListLopHocPhanChoKyHoc(idkyhoc);
		request.setAttribute("list", list);
		DangKyHocDao dangkyhocDao = new DangKyHocDao();
		request.setAttribute("dangkyhocDao", dangkyhocDao);
		request.setAttribute("sinhvien", accountSinhVien);
		request.setAttribute("accountSinhVien", accountSinhVien);
		RequestDispatcher dispatcher = request.getRequestDispatcher("sinhvien/dangkymon/thaydoidangky.jsp");
		dispatcher.forward(request, response);
	}

	private void getdangkymonhoc(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		request.setAttribute("sinhvien", accountSinhVien);
		request.setAttribute("accountSinhVien", accountSinhVien);
		String idkyhoc = request.getParameter("idkyhoc");
		KyHoc kyhoc = new KyHocDao().getNamHoc(idkyhoc);
		request.setAttribute("kyhoc", kyhoc);
		List<KetQua> listketqua = new KetQuaDao().getListKetQuachoSinhVien(accountSinhVien.getMaSV());
		List<KetQua> list = new ArrayList<KetQua>();
		for(KetQua x:listketqua) {
			if(x.getDangkyhoc().getLophocphan().getMhkh().getKyhoc().getId() == kyhoc.getId()) 
				list.add(x);
		}
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("sinhvien/dangkymon/danhsachdangky.jsp");
		dispatcher.forward(request, response);
	}

	private void dangkymon(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		request.setAttribute("accountSinhVien", accountSinhVien);
		request.setAttribute("sinhvien", accountSinhVien);
		List<KyHoc> list = new KyHocDao().getListKyDangKy();
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("sinhvien/dangkymon/chonkyhoc.jsp");
		dispatcher.forward(request, response);
	}

	private void xemdiemSV(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		request.setAttribute("sinhvien", accountSinhVien);
		request.setAttribute("accountSinhVien", accountSinhVien);
		List<KyHoc> listkyhoc = new KyHocDao().getListNamHoc();
		request.setAttribute("listkyhoc", listkyhoc);
		
		List<KetQua> list = new KetQuaDao().getListKetQuachoSinhVien(accountSinhVien.getMaSV());
		Collections.sort(list);
		List<Float> listkqtb = new ArrayList<Float>();
		for(KyHoc kh:listkyhoc) {
			float k=0;
			int d=0;
			for(KetQua x:list) {
				if(kh.getId()==x.getDangkyhoc().getLophocphan().getMhkh().getKyhoc().getId()) {
					k+=Float.parseFloat(x.getDiemHeSo4(x.getDiemHeSo())) * x.getDangkyhoc().getLophocphan().getMhkh().getMh().getTinchi();
					d+=x.getDangkyhoc().getLophocphan().getMhkh().getMh().getTinchi();
				}
			}
			listkqtb.add((float)Math.round((k/d)*100)/100);
		}
//		for(float i:listkqtb) System.out.println(i);
		request.setAttribute("listkqtb", listkqtb);
		request.setAttribute("list", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("sinhvien/xemdiem/diemsinhvien.jsp");
		dispatcher.forward(request, response);
	}

	private void editstudent(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		request.setAttribute("accountSinhVien", accountSinhVien);
		request.setAttribute("sinhvien", accountSinhVien);
		RequestDispatcher dispatcher = request.getRequestDispatcher("sinhvien/editstudent.jsp");
		dispatcher.forward(request, response);
		
	}
	
	private void doimatkhau(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String username = accountSinhVien.getMaSV();
		String mkcu = request.getParameter("mkcu");
		String mkmoi = request.getParameter("mkmoi");
		String mkmoi1 = request.getParameter("mkmoi1");
		boolean k = new UpdateMKSV().checkTK(username, mkcu);
//		System.out.println(mkcu+" "+mkmoi+" "+mkmoi1+" "+k);
		if(!k || !mkmoi.equals(mkmoi1)) {
			out.print("notok");
		}else {
			boolean x = new UpdateMKSV().updateTKDN(username, mkmoi);
			if(x) out.print("ok");
			else out.print("notok");
		}
	}

	private void showTrangChu(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException{
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		accountSinhVien = new SinhVienDao().getSinhVien(username);
		if(accountSinhVien == null) {
			login(request, response);
		}
		request.setAttribute("accountSinhVien", accountSinhVien);
		RequestDispatcher dispatcher = request.getRequestDispatcher("sinhvien/trangchu.jsp");
		dispatcher.forward(request, response);
	}
	
	private void login(HttpServletRequest request, HttpServletResponse response) throws SQLException,IOException,ServletException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("formlogin.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
