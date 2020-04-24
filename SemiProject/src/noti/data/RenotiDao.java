package noti.data;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import noti.data.RenotiDto;
import oracle.db.DbConnect;

public class RenotiDao {
   DbConnect db=new DbConnect();
   
   //댓글 추가
   public void insertRenoti(RenotiDto dto) {
      Connection conn=null;
      PreparedStatement pstmt=null;
      String sql="insert into tb_renoti values (seq_renoti.nextval,?,?,sysdate)";
      
      conn=db.getConnection();

   
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, dto.getNotiNum());
         pstmt.setString(2, dto.getRenotiCont());
         pstmt.execute();
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      
      }finally {
         db.dbClose(pstmt, conn);
      }

   }
   
   
   //댓글 불러오기
   public List<RenotiDto> getRenotiList(String notiNum)
   {
      Connection conn=null;
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      List<RenotiDto> list=new Vector<RenotiDto>();
      String sql="select * from tb_renoti where noti_num=? order by renoti_num asc";
      
      conn=db.getConnection();
      
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, notiNum);
         rs=pstmt.executeQuery();
         
         while(rs.next())
         {
            RenotiDto dto=new RenotiDto();
            dto.setRenotiNum(rs.getString("renoti_Num"));
            dto.setNotiNum(rs.getString("noti_num"));
            dto.setRenotiCont(rs.getString("renoti_cont"));
            dto.setRenotiDate(rs.getString("renoti_date"));
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
   
   //댓글 삭제
   public void deleteRenoti(String renotiNum) {
      Connection conn=null;
      PreparedStatement pstmt=null;
      String sql="delete tb_renoti where renoti_num=?";
      
      conn=db.getConnection();
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, renotiNum);
         pstmt.execute();
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      
      }finally {
         db.dbClose(pstmt, conn);
      }

   }


}