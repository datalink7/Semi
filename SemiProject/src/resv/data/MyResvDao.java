package resv.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import oracle.db.DbConnect;

public class MyResvDao {
	DbConnect db=new DbConnect();
	
	public List<MyResvDto> getAllDatas(String userId,int start,int end){
		List<MyResvDto> list=new Vector<MyResvDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select a.* from (select rownum as rnum,b.* from (select * from tb_resv where user_id like ? order by resv_num desc)b)a where a.rnum>=? and a.rnum<=?";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);

			rs=pstmt.executeQuery();
			while(rs.next()) {
				MyResvDto dto=new MyResvDto();
				dto.setResvNum(rs.getString("resv_num"));
				dto.setResvType(rs.getString("resv_type"));
				dto.setBoxCode(rs.getString("box_code"));
				dto.setBoxPwd(rs.getString("box_pwd"));
				dto.setObjType(rs.getString("obj_type"));
				dto.setObjSize(rs.getString("obj_size"));
				dto.setObjCnt(rs.getString("obj_cnt"));
				dto.setResvPrice(rs.getString("resv_price"));
				dto.setResvStDate(rs.getTimestamp("resv_st_date"));
				dto.setResvEdDate(rs.getTimestamp("resv_ed_date"));
				dto.setUserId(rs.getString("user_id"));
				dto.setResvCancelYn(rs.getString("resv_cancel_yn"));
				dto.setResvEndYn(rs.getString("resv_end_yn"));
				dto.setResvOverPrice(rs.getString("resv_over_price"));
				dto.setResvDate(rs.getTimestamp("resv_date"));
				dto.setResvSendAddr(rs.getString("resv_send_addr"));
				dto.setResvGetAddr(rs.getString("resv_get_addr"));
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
	
	public List<MyResvDto> getAllDatas(String userId,String resvType,int start,int end){
		List<MyResvDto> list=new Vector<MyResvDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		System.out.println(resvType);
		String sql="select a.* from (select rownum as rnum,b.* from (select * from tb_resv where user_id like ? and resv_type=? order by resv_num desc)b)a where a.rnum>=? and a.rnum<=?";

//		String sql="select * from tb_resv where user_id=? and resv_type=? order by resv_num desc";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, resvType);
			pstmt.setInt(3, start);
			pstmt.setInt(4, end);

			rs=pstmt.executeQuery();
			while(rs.next()) {
				MyResvDto dto=new MyResvDto();
				dto.setResvNum(rs.getString("resv_num"));
				dto.setResvType(rs.getString("resv_type"));
				dto.setBoxCode(rs.getString("box_code"));
				dto.setBoxPwd(rs.getString("box_pwd"));
				dto.setObjType(rs.getString("obj_type"));
				dto.setObjSize(rs.getString("obj_size"));
				dto.setObjCnt(rs.getString("obj_cnt"));
				dto.setResvPrice(rs.getString("resv_price"));
				dto.setResvStDate(rs.getTimestamp("resv_st_date"));
				dto.setResvEdDate(rs.getTimestamp("resv_ed_date"));
				dto.setUserId(rs.getString("user_id"));
				dto.setResvCancelYn(rs.getString("resv_cancel_yn"));
				dto.setResvEndYn(rs.getString("resv_end_yn"));
				dto.setResvOverPrice(rs.getString("resv_over_price"));
				dto.setResvDate(rs.getTimestamp("resv_date"));
				dto.setResvSendAddr(rs.getString("resv_send_addr"));
				dto.setResvGetAddr(rs.getString("resv_get_addr"));
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
	
	public int getTotalCount() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from tb_resv";
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
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return count;
	}

	
	public int getTotalCount(String resvType) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from tb_resv where resv_type=?";
		int count=0;
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, resvType);
			rs=pstmt.executeQuery();
			rs.next();
			count=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return count;
	}

	
	
	public MyResvDto getData(String resvNum){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from tb_resv where resv_num=?";
		MyResvDto dto=new MyResvDto();
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, resvNum);
			rs=pstmt.executeQuery();
			rs.next();
			dto.setResvNum(rs.getString("resv_num"));
			dto.setResvType(rs.getString("resv_type"));
			dto.setBoxCode(rs.getString("box_code"));
			dto.setBoxPwd(rs.getString("box_pwd"));
			dto.setObjType(rs.getString("obj_type"));
			dto.setObjSize(rs.getString("obj_size"));
			dto.setObjCnt(rs.getString("obj_cnt"));
			dto.setResvPrice(rs.getString("resv_price"));
			dto.setResvStDate(rs.getTimestamp("resv_st_date"));
			dto.setResvEdDate(rs.getTimestamp("resv_ed_date"));
			dto.setUserId(rs.getString("user_id"));
			dto.setResvCancelYn(rs.getString("resv_cancel_yn"));
			dto.setResvEndYn(rs.getString("resv_end_yn"));
			dto.setResvOverPrice(rs.getString("resv_over_price"));
			dto.setResvDate(rs.getTimestamp("resv_date"));
			dto.setResvSendAddr(rs.getString("resv_send_addr"));
			dto.setResvGetAddr(rs.getString("resv_get_addr"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
}
