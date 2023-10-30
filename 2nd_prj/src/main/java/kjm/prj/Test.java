package kjm.prj;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class Test {

	public static void main(String[] args) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date today = new java.util.Date(); 
		
		String strtoday = sdf.format(today);
		
		System.out.println(strtoday);
		//Date d = new Date();

	}

}
