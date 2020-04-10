package map.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import oracle.db.DbConnect;

public class MapDao {
	DbConnect db=new DbConnect();
	
	public List<MapDto> searchPlaces(String location){
		List<MapDto> list=new Vector<MapDto>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select tb_map.*,tb_place.place_addr place_addr from tb_map,tb_place where tb_map.place_code=tb_place.place_code and tb_map.map_addr like ?";
		
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,"%"+location.toUpperCase()+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MapDto dto=new MapDto();
				dto.setMapNum(rs.getString("map_num"));
				dto.setMapLat(rs.getDouble("map_lat"));
				dto.setMapLng(rs.getDouble("map_lng"));
				dto.setMapAddr(rs.getString("map_addr"));
				dto.setPlaceName(rs.getString("place_name"));
				dto.setPlaceCode(rs.getString("place_code"));
				dto.setPlaceAddr(rs.getString("place_addr"));
				dto.setMapBoxCnt(rs.getString("map_box_cnt"));
				dto.setMapBoxRemain(rs.getString("map_box_remain"));
				
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
	
	public void updateMapBoxRemain(String mapNum) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="update tb_map set map_box_remain=map_box_remain-1 where map_num=?";
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mapNum);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose( pstmt, conn);
		}

	}
	
}
