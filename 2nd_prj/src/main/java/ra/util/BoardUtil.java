package ra.util;

import ra.util.BoardUtilVO;

public class BoardUtil {
	static {
		try {
			Class.forName("jdbc/dbcp");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static DbConnection getConnection(String id, ) {
		DbConnection con = null;

		try {
			con = DriverManager.getConnection(url, id, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void close(ResultSet rs, Statement stmt, Connection conn) {
		try {
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}