package review.data;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import review.data.RevwDto;
import oracle.db.DbConnect;

public class RevwDao {
	DbConnect db=new DbConnect();
			
	
	
	//입력		
	public void insertReview(RevwDto dto)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into tb_review values (seq_noti.nextval,?,?,?,sysdate,?,?,sysdate,0)";
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getRevwCont());
			pstmt.setString(2, "test1");
			pstmt.setString(3, "null");
			
			pstmt.setString(4, dto.getRevwType());
			pstmt.setInt(5, dto.getRevwStar());//star
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	
	
	//조회수 카운트 
	public void ReviewCount(String revwNum) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="update tb_review set revw_cnt=revw_cnt+1 where revw_num=?";
		
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, revwNum);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
				
	}
	
	
	//출력
	public List<RevwDto> getReviewList()
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<RevwDto> list=new Vector<RevwDto>();
		String sql="select * from tb_review order by revw_num desc";
		
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				RevwDto dto = new RevwDto();
				dto.setRevwNum(rs.getInt("revw_num"));
				dto.setRevwCont(rs.getString("revw_cont"));
				dto.setUserId(rs.getString("user_id"));
				dto.setRevwTitle(rs.getString("revw_title"));
				dto.setRevwType(rs.getString("revw_type"));
				dto.setRevwStar(rs.getInt("revw_star"));
				dto.setRevwDate(rs.getTimestamp("revw_date"));
				dto.setRevwTime(rs.getTimestamp("revw_time"));
				dto.setRevwCnt(rs.getInt("revw_cnt"));
				
				list.add(dto);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	
	
	
	
	
	//페이징 처리 
	
	public List<RevwDto> getPageDatas(int start,int end){
		List<RevwDto> list=new Vector<RevwDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select a.* from (select rownum as rnum,b.* from (select * from tb_review order by revw_num desc)b)a where a.rnum>=? and a.rnum<=?";
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				RevwDto dto=new RevwDto();
				dto.setRevwNum(rs.getInt("revw_num"));
				dto.setRevwCont(rs.getString("revw_cont"));
				dto.setUserId(rs.getString("user_id"));
				dto.setRevwTitle(rs.getString("revw_title"));
				dto.setRevwDate(rs.getTimestamp("revw_date"));
				dto.setRevwType(rs.getString("revw_type"));
				dto.setRevwStar(rs.getInt("revw_star"));
				dto.setRevwTime(rs.getTimestamp("revw_time"));
				dto.setRevwCnt(rs.getInt("revw_cnt"));
				
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	
	
	//아이디 비번이 맞을경우만 true
	public boolean isLogin(String userId, String userPwd)
	{
		boolean bLogin=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from tb_user where user_id=? and user_pwd=?";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				bLogin=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return bLogin;
	}
	
	
	
	
	//수정폼에 가져올것
	public RevwDto getData(String revwNum)
	{
		RevwDto dto=new RevwDto();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from tb_review where revw_num=?";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, revwNum);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setRevwNum(rs.getInt("revw_num"));
				dto.setRevwCont(rs.getString("revw_cont"));
				dto.setUserId(rs.getString("user_id"));
				dto.setRevwTitle(rs.getString("revw_title"));
				dto.setRevwDate(rs.getTimestamp("revw_date"));
				dto.setRevwType(rs.getString("revw_type"));
				dto.setRevwStar(rs.getInt("revw_star"));
				dto.setRevwTime(rs.getTimestamp("revw_time"));
				dto.setRevwCnt(rs.getInt("revw_cnt"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	
	//수정 (리뷰) - 타입,제목,별점,내용
	public void updateReview (RevwDto dto)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="update tb_review set revw_type=?,revw_star=?,revw_cont=? where revw_num=?";
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getRevwType());
			pstmt.setInt(2, dto.getRevwStar());
			pstmt.setString(3, dto.getRevwCont());
			pstmt.setInt(4, dto.getRevwNum());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//삭제 
	public void deleteReview(String revwNum)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="delete from tb_review where revw_num=?";
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, revwNum);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//전체 카운트 
	public int getTotalCount() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from tb_review";
		int count=0;
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			count=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return count;
	}
}//class over
