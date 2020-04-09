package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.UserDto;
import oracle.db.DbConnect;

public class UserDao {
	DbConnect db=new DbConnect();
	
	//아이디를 검색해서 있으면 true, 없으면 false 반환
	public boolean isEquarId(String userId)
	{
		boolean find=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from tb_user where user_id=?";
		
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
				if(n==1)
					find=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return find;
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}
}
