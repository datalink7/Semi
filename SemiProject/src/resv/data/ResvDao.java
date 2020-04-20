package resv.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import oracle.db.DbConnect;

public class ResvDao {
	DbConnect db=new DbConnect();
	
	public void insertResv(ResvDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into tb_resv values (seq_resv.nextval,?,?,?,?,?,?,?,?,?,?,0,0,0,sysdate,?,?)";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getResvType());
			pstmt.setString(2, dto.getBoxCode());
			pstmt.setString(3, dto.getBoxPwd());
			pstmt.setString(4, dto.getObjType());
			pstmt.setString(5, dto.getObjSize());
			pstmt.setString(6, dto.getObjCnt());
			pstmt.setString(7, dto.getResvPrice());
			pstmt.setString(8, dto.getResvStDate());
			pstmt.setString(9, dto.getResvEdDate());
			pstmt.setString(10, dto.getUserId());
			pstmt.setString(11, dto.getResvSendAddr());
			pstmt.setString(12, dto.getResvGetAddr());

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
				
	}
//	
//	public void insertGetResv(ResvDto dto) {
//		Connection conn=null;
//		PreparedStatement pstmt=null;
//		String sql="insert into tb_resv values (seq_resv.nextval,?,?,?,?,?,?,?,?,?,?,0,0,0,sysdate,?,?)";
//		
//		conn=db.getConnection();
//		try {
//			pstmt=conn.prepareStatement(sql);
//			pstmt.setString(1, dto.getResvType());
//			pstmt.setString(2, dto.getBoxCode());
//			pstmt.setString(3, dto.getBoxPwd());
//			pstmt.setString(4, dto.getObjType());
//			pstmt.setString(5, dto.getObjSize());
//			pstmt.setString(6, dto.getObjCnt());
//			pstmt.setString(7, dto.getResvPrice());
//			pstmt.setString(8, dto.getResvStDate());
//			pstmt.setString(9, dto.getResvEdDate());
//			pstmt.setString(10, dto.getUserId());
//			pstmt.setString(11, dto.getResvSendAddr());
//			pstmt.setString(12, dto.getResvGetAddr());
//			
//			pstmt.execute();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			db.dbClose(pstmt, conn);
//		}
//				
//	}
	
	//전체 db 불러오기
	public List<ResvDto> getAllDatas(){
		List<ResvDto> list=new Vector<ResvDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from tb_resv order by resv_num desc";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ResvDto dto=new ResvDto();
				dto.setResvNum(rs.getString("resv_num"));
				dto.setResvType(rs.getString("resv_type"));
				dto.setBoxCode(rs.getString("box_code"));
				dto.setBoxPwd(rs.getString("box_pwd"));
				dto.setObjType(rs.getString("obj_type"));
				dto.setObjSize(rs.getString("obj_size"));
				dto.setObjCnt(rs.getString("obj_cnt"));
				dto.setResvPrice(rs.getString("resv_price"));
				dto.setResvStDate(rs.getString("resv_st_date"));
				dto.setResvEdDate(rs.getString("resv_ed_date"));
				dto.setUserId(rs.getString("user_id"));
				dto.setResvCancelYn(rs.getString("resv_cancel_yn"));
				dto.setResvEndYn(rs.getString("resv_end_yn"));
				dto.setResvOverPrice(rs.getInt("resv_over_price"));
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
	
	public void cancelResv(String resvNum,String cancel) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="update tb_resv set resv_cancel_yn=?, resv_end_yn=1 where resv_Num=?";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cancel);
			pstmt.setString(2, resvNum);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}
}
