package ra.admin.notice;

public class NoticeVO {
	String empno, ntitle, ncontent, input_date, writer;
	int nno;
	public NoticeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeVO(String empno, String ntitle, String ncontent, String input_date, String writer, int nno) {
		super();
		this.empno = empno;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.input_date = input_date;
		this.writer = writer;
		this.nno = nno;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public String getInput_date() {
		return input_date;
	}
	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	@Override
	public String toString() {
		return "NoticeVO [empno=" + empno + ", ntitle=" + ntitle + ", ncontent=" + ncontent + ", input_date="
				+ input_date + ", writer=" + writer + ", nno=" + nno + "]";
	}
	
	
	
	

}
