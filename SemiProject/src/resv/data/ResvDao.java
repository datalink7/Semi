package resv.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import oracle.db.DbConnect;

public class ResvDao {
	DbConnect db=new DbConnect();
	
	public void insertResv(ResvDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into tb_resv values (seq_resv.nextval,?,?,?,?,?,?,?,?,?,?,0,0,0,sysdate)";
		
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
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
				
	}
}
