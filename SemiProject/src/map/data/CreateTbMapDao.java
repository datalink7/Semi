package map.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import oracle.db.DbConnect;

public class CreateTbMapDao {
	DbConnect db=new DbConnect();
	
	public void insertTbPlace(CreateTbMapDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into tb_place values (?,?,?)";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPlaceCode());
			pstmt.setString(2, dto.getPlaceName());
			pstmt.setString(3, dto.getMapAddr());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void insertTbMap(CreateTbMapDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into tb_map values (seq_map.nextval,?,?,?,?,?,20,0)";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMapLat());
			pstmt.setString(2, dto.getMapLng());
			pstmt.setString(3, dto.getMapAddr());
			pstmt.setString(4, dto.getPlaceName());
			pstmt.setString(5, dto.getPlaceCode());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public void deleteTbPlace(String placeCode) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="delete tb_place where place_code=?";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, placeCode);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	
	public void createBoxes(String boxCode,String placeCode) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into tb_box values (?,?,'50*50*50',' ',0,null)";
		
		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, boxCode);
			pstmt.setString(2, placeCode);
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}
	
	public List<CreateTbMapDto> searchPlaces(String placeName){
		List<CreateTbMapDto> list=new Vector<CreateTbMapDto>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from tb_place where place_name like ? order by place_code asc";
		
		conn=db.getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,"%"+placeName+"%");
			rs=pstmt.executeQuery();
			while(rs.next()) {
				CreateTbMapDto dto=new CreateTbMapDto();
				dto.setPlaceName(rs.getString("place_name"));
				dto.setPlaceCode(rs.getString("place_code"));
				dto.setMapAddr(rs.getString("place_addr"));
				
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

	
	
}
