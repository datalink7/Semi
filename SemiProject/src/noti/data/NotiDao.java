package noti.data;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import noti.data.NotiDto;
import oracle.db.DbConnect;

public class NotiDao {
	DbConnect db=new DbConnect();
	
	
	
	
	
	//문의 추가 
	public void insertNoti (NotiDto dto)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into tb_noti values (seq_noti.nextval,?,?,?,?,sysdate,?,0,sysdate)";
		
		conn=db.getConnection();

	
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNotiType());
			pstmt.setString(2, dto.getNotiCont());
			pstmt.setString(3, ("admin"));
			pstmt.setString(4, dto.getNotiTitle());
			pstmt.setString(5, dto.getNotiPwd());
			pstmt.execute();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}



	//조회수 카운트 
	public void NotiCount(String notiNum) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="update tb_noti set noti_cnt=noti_cnt+1 where noti_num=?";
		
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, notiNum);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
				
	}
	
	
	
	
	
	
	//문의 출력
	public List<NotiDto> getNotiList()
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<NotiDto> list=new Vector<NotiDto>();
		String sql="select * from tb_noti order by noti_num asc";
		
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				NotiDto dto = new NotiDto();
				dto.setNotiNum(rs.getInt("noti_num"));
				dto.setNotiType(rs.getString("noti_type"));
				dto.setNotiTitle(rs.getString("noti_title"));
				dto.setNotiCont(rs.getString("noti_cont"));
				dto.setUserId(rs.getString("user_id"));
				dto.setNotiDate(rs.getTimestamp("noti_date"));
				dto.setNotiTime(rs.getTimestamp("noti_time"));
				dto.setNotiCnt(rs.getInt("noti_cnt"));
				
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
	
	//문의 출력
	public List<NotiDto> getNotiList(String userId)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<NotiDto> list=new Vector<NotiDto>();
		String sql="select * from tb_noti where user_id=? order by noti_num asc";
		
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				NotiDto dto = new NotiDto();
				dto.setNotiNum(rs.getInt("noti_num"));
				dto.setNotiType(rs.getString("noti_type"));
				dto.setNotiTitle(rs.getString("noti_title"));
				dto.setNotiCont(rs.getString("noti_cont"));
				dto.setUserId(rs.getString("user_id"));
				dto.setNotiDate(rs.getTimestamp("noti_date"));
				dto.setNotiTime(rs.getTimestamp("noti_time"));
				dto.setNotiCnt(rs.getInt("noti_cnt"));
				
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

	
	//관리자 문의 출력 
	public List<NotiDto> getaNotiList()
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<NotiDto> list=new Vector<NotiDto>();
		String sql="select * from tb_noti where noti_type='공지사항' order by noti_num asc";
		
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				NotiDto dto = new NotiDto();
				dto.setNotiNum(rs.getInt("noti_num"));
				dto.setNotiType(rs.getString("noti_type"));
				dto.setNotiTitle(rs.getString("noti_title"));
				dto.setNotiCont(rs.getString("noti_cont"));
				dto.setUserId(rs.getString("user_id"));
				dto.setNotiDate(rs.getTimestamp("noti_date"));
				dto.setNotiTime(rs.getTimestamp("noti_time"));
				dto.setNotiCnt(rs.getInt("noti_cnt"));
				
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
	public int getnotiNum()
	{
		int num=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select noti_num from tb_noti order by noti_num desc";
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
		
			
			rs=pstmt.executeQuery();
			
			if(rs.next())
				num=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return num;

	}
	
	
	
	//비번 맞으면 true, 틀리면 false
	public boolean isEqualpass(String notiNum, String notiPwd)
	{
		boolean equal=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from tb_noti where noti_num=? and noti_pass=?";
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, notiNum);
			pstmt.setString(2, notiPwd);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				equal=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return equal;
	}
	
	
	
	
	
	
	
	
	//페이징 처리 
	public List<NotiDto>getPageDatas(int start,int end)
	{
		List<NotiDto> list=new Vector<NotiDto>();
		String sql="select a.*from (select ROWNUM as RNUM, b.* from (select * from tb_noti order by noti_num desc)b)a where a.RNUM>=? and a.RNUM<=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				NotiDto dto=new NotiDto();
				dto.setNotiNum(rs.getInt("noti_num"));
				dto.setNotiType(rs.getString("noti_type"));
				dto.setNotiTitle(rs.getString("noti_title"));
				dto.setNotiCont(rs.getString("noti_cont"));
				dto.setUserId(rs.getString("user_id"));
				dto.setNotiPwd(rs.getString("noti_pwd"));
				dto.setNotiDate(rs.getTimestamp("noti_date"));
				dto.setNotiTime(rs.getTimestamp("noti_time"));
				dto.setNotiCnt(rs.getInt("noti_cnt"));
	
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
	
	// 비번이 맞을경우만 true
	public boolean isLogin(String notiPwd)
	{
		boolean bLogin=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from tb_noti where user_id and noti_pwd=?";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, notiPwd);
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
	
	
	
	
	
	//수정폼에 가져갈 dto
	public NotiDto getData(String notiNum)
	{
		NotiDto dto=new NotiDto();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from tb_noti where noti_num=?";
		
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, notiNum);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				dto.setNotiNum(rs.getInt("noti_num"));
				dto.setNotiType(rs.getString("noti_type"));
				dto.setNotiTitle(rs.getString("noti_title"));
				dto.setNotiCont(rs.getString("noti_cont"));
				dto.setUserId(rs.getString("user_id"));
				dto.setNotiDate(rs.getTimestamp("noti_date"));
				dto.setNotiTime(rs.getTimestamp("noti_time"));
				dto.setNotiCnt(rs.getInt("noti_cnt"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;		
	}
	
	//userId로 검색
	public List<NotiDto>getPageDatas(String userId,int start,int end)
	{
		List<NotiDto> list=new Vector<NotiDto>();
		String sql="select a.*from (select ROWNUM as RNUM, b.* from (select * from tb_noti where user_id=? order by noti_num desc)b)a where a.RNUM>=? and a.RNUM<=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				NotiDto dto=new NotiDto();
				dto.setNotiNum(rs.getInt("noti_num"));
				dto.setNotiType(rs.getString("noti_type"));
				dto.setNotiTitle(rs.getString("noti_title"));
				dto.setNotiCont(rs.getString("noti_cont"));
				dto.setUserId(rs.getString("user_id"));
				dto.setNotiPwd(rs.getString("noti_pwd"));
				dto.setNotiDate(rs.getTimestamp("noti_date"));
				dto.setNotiTime(rs.getTimestamp("noti_time"));
				dto.setNotiCnt(rs.getInt("noti_cnt"));
	
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

	
	
	
	//수정 (문의) -타입 제목 내용 
	public void updateNoti (NotiDto dto)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="update tb_noti set noti_type=?,noti_title=?,noti_cont=? where noti_num=?";
		
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getNotiType());
			pstmt.setString(2, dto.getNotiTitle());
			pstmt.setString(3, dto.getNotiCont());
			
			pstmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	
	
	//삭제 
	public void deleteNoti(String notiNum)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="delete from tb_noti where noti_num=?";
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, notiNum);
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
		String sql="select count(*) from tb_noti";
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
	
	//id별 카운트
	public int getTotalCount(String userId) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from tb_noti where user_id=?";
		int count=0;
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
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

}//public over


