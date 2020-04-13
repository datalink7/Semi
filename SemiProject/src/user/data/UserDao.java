package user.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import oracle.db.DbConnect;

public class UserDao {
	DbConnect db=new DbConnect();
	
	//아이디를 검색해서 있으면 true, 없으면 false 반환
	public void isEqualId(UserDto dto)
	{
		boolean find=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from tb_user where user_id=?";
		
		String userId=dto.getUserId();
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, userId);
			//실행
			rs=pstmt.executeQuery();
			//조건
			if(rs.next())
			{
				int n=rs.getInt(1);
				if(n==1) {
					find=true;
					System.out.println("아이디 중복 - 회원가입 불가능");
				} else {
					System.out.println("회원가입 가능");
					insertUser(dto);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
	}
	
	public void insertUser(UserDto dto)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into tb_user(user_id,user_pwd,user_name,user_phone,user_sex,user_email,user_addr1) values (?,?,?,?,?,?,?)";
		
		//db연결
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPwd());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getUserPhone());
			pstmt.setString(5, dto.getUserSex());
			pstmt.setString(6, dto.getUserEmail());
			pstmt.setString(7, dto.getUserAddr1());

			//실행
			pstmt.execute();
			System.out.println("회원가입완료!");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public boolean isLogin(String userId, String userPwd)
	{
		boolean bLogin=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from tb_user where user_id=? and user_pwd=?";
		
		conn=db.getConnection();
		
		System.out.println(sql);
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			//실행
			rs=pstmt.executeQuery();
			//조건 - 데이터가 있으면 아이디 비번이 일치한다.
			if(rs.next())
			{
				System.out.println("로그인성공");
				bLogin=true;
			}else {
				System.out.println("로그인실패");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		System.out.println(bLogin);
		return bLogin;
	}
}
