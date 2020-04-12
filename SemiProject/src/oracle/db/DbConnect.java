package oracle.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnect {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";

	public DbConnect() {
		// TODO Auto-generated constructor stub
		try {
			Class.forName(driver);
			//System.out.println("드라이버 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 실패:"+e.getMessage());
		}
	}

	//오라클 연결 후connection 을 반환하는 메서드
	public Connection getConnection()
	{
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(url, "project", "a1234");
			//System.out.println("오라클 연결 성공");
		} catch (SQLException e) {
			System.out.println("오라클 연결  실패:"+e.getMessage());
		}
		return conn;
	}

	//강사 pc 연결
	public Connection getGangsaConnection()
	{
		String gangsaurl="jdbc:oracle:thin:@192.168.0.3:1521:xe";
		
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(gangsaurl, "angel", "a1234");
			//System.out.println("오라클 연결 성공");
		} catch (SQLException e) {
			System.out.println("오라클 연결 실패:"+e.getMessage());
		}
		return conn;
	}
	//sql 자원들을 닫는 메서드
	public void dbClose(PreparedStatement pstmt,Connection conn)
	{
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void dbClose(ResultSet rs,PreparedStatement pstmt,Connection conn)
	{
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void dbClose(Statement pstmt,Connection conn)
	{
		try {
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void dbClose(ResultSet rs,Statement pstmt,Connection conn)
	{
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

