package box.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import oracle.db.DbConnect;

public class BoxDao {
	DbConnect db=new DbConnect();
	
	
	//예약된 박스 가져오기
	public List<BoxDto> ableResv(String placeCode,String stDate,String edDate){
		List<BoxDto> list=new Vector<BoxDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		sql="select distinct tb_box.*,tb_place.* from tb_box,tb_resv,tb_place where tb_box.box_code=tb_resv.box_code(+) and tb_box.place_code=tb_place.place_code and tb_box.place_code=? and (tb_resv.resv_st_date<='"+edDate+"' and tb_resv.resv_ed_date>='"+stDate+"') order by tb_box.box_code asc";
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, placeCode);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoxDto dto=new BoxDto();
				dto.setBoxCode(rs.getString("box_code"));
				dto.setPlaceCode(rs.getString("place_code"));
				dto.setBoxSize(rs.getString("box_size"));
				dto.setPlaceName(rs.getString("place_name"));
				if(rs.getString("box_etc")==null)
					dto.setBoxEtc("없음");
				else
					dto.setBoxEtc(rs.getString("box_etc"));
				dto.setBoxUseYn(rs.getString("box_use_yn"));
				if(rs.getString("user_id")==null)
					dto.setUserId("없음");
				else
					dto.setUserId(rs.getString("user_id"));
				
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
	
	
	//전체 박스 가져오기 및 사용 가능한 박스 가져오기
	public List<BoxDto> selectBox(String placeCode,boolean all, String stDate,String edDate){
		List<BoxDto> list=new Vector<BoxDto>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		if(all==false)
			sql="select distinct tb_box.*,tb_place.* from tb_box,tb_resv,tb_place where tb_box.box_code=tb_resv.box_code(+)and tb_box.place_code=tb_place.place_code and tb_box.place_code=? and ((tb_resv.resv_st_date<'"+edDate+"' and tb_resv.resv_ed_date<'"+stDate+"') or tb_resv.resv_st_date is null) and (tb_resv.resv_end_yn!=1 or tb_resv.resv_end_yn is null) order by tb_box.box_code asc";
		else
			sql="select distinct tb_box.*,tb_place.* from tb_box,tb_resv,tb_place where tb_box.box_code=tb_resv.box_code(+)and tb_box.place_code=tb_place.place_code and tb_box.place_code=? order by tb_box.box_code asc";
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, placeCode);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoxDto dto=new BoxDto();
				dto.setBoxCode(rs.getString("box_code"));
				dto.setPlaceCode(rs.getString("place_code"));
				dto.setBoxSize(rs.getString("box_size"));
				dto.setPlaceName(rs.getString("place_name"));
				if(rs.getString("box_etc")==null)
					dto.setBoxEtc("없음");
				else
					dto.setBoxEtc(rs.getString("box_etc"));
				dto.setBoxUseYn(rs.getString("box_use_yn"));
				if(rs.getString("user_id")==null)
					dto.setUserId("없음");
				else
					dto.setUserId(rs.getString("user_id"));
				
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
	
	public String getBoxAddr(String mapNum){
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select map_addr,place_name from tb_map where map_num=?";
		conn=db.getConnection();
		String boxAddr="";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mapNum);
			rs=pstmt.executeQuery();
			rs.next();
			boxAddr=rs.getString(1);
			boxAddr+=" "+rs.getString(2);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return boxAddr;
	}
	
	public void updateBox(String boxCode,String userId,String boxUse) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="";
		if(boxUse=="0")
			sql="update tb_box set box_use_yn='1' where box_Code=?";//0입력시 1(사용)
		else
			sql="update tb_box set box_use_yn='0' where box_Code=?";
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, boxCode);
			pstmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}
	
	
}
