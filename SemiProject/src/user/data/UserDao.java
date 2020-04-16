package user.data;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties; 
import java.util.Random;

import javax.mail.Message; 
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication; 
import javax.mail.Session; 
import javax.mail.Transport; 
import javax.mail.internet.InternetAddress; 
import javax.mail.internet.MimeMessage; 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import oracle.db.DbConnect;

public class UserDao {
	DbConnect db=new DbConnect();
	
	//아이디를 검색해서 있으면 true, 없으면 false 반환
	public boolean isEqualId(UserDto dto, String state)
	{
		boolean find=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from tb_user where user_id=?";
		
		String userId=dto.getUserId();
		
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
				if(n==1) {
					find=true;
					System.out.println("아이디 중복 - 회원가입 불가능");
				} else {
					System.out.println("회원가입 가능");
					if(state == "join") {
						insertUser(dto);
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		System.out.println(find);
		
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
			System.out.println("회원가입완료!");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	public boolean isLogin(String userId, String userPwd)
	{
		boolean bLogin=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from tb_user where user_id=? and user_pwd=?";
		
		conn=db.getConnection();
		
		System.out.println(sql);
		
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			//실행
			rs=pstmt.executeQuery();
			//조건 - 데이터가 있으면 아이디 비번이 일치한다.
			if(rs.next())
			{
				System.out.println("로그인성공");
				bLogin=true;
			}else {
				System.out.println("로그인실패");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		System.out.println(bLogin);
		return bLogin;
	}
	
	//아이디에 해당하는 이름 반환
	public String getUserName(String userId)
	{
		String name="";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select user_name from tb_user where user_id=?";

		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, userId);
			//실행
			rs=pstmt.executeQuery();
			//해당 아이디가 있을 경우 이름얻기
			if(rs.next())
				name=rs.getString(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return name;
	}
		
	//아이디 찾기
	public String getFindId(String userName, String userEmail)
	{
		String findid="";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select user_id from tb_user where user_name=? and user_email=?";

		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, userName);
			pstmt.setString(2, userEmail);
			//실행
			rs=pstmt.executeQuery();
			//해당 정보가 있을 경우 아이디얻기
			if(rs.next())
				findid=rs.getString(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return findid;
	}

	//비밀번호 찾기
	public String getFindPwd(String userId, String userName, String userEmail)
	{
		String findid="";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select user_pwd from tb_user where user_id=? and user_name=? and user_email=?";

		conn=db.getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, userId);
			pstmt.setString(2, userName);
			pstmt.setString(3, userEmail);
			//실행
			rs=pstmt.executeQuery();
			//해당 정보가 있을 경우 패스워드얻기
			if(rs.next())
				findid=rs.getString(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return findid;
	}
	
	//이메일 인증하기
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String userEmail = request.getParameter("userEmail");
        
        //먼저 아이디로 회원정보를 받아오고 가져온 데이터에서 email값을 비교하여 존재하지 않으면 인증메일 보내지 못함
        //Member m = new MemberService().memberLogin(userId);
        if(userId==null || !userEmail.equals(userEmail))
        {
            request.setAttribute("msg", "아이디나 이메일 정보가 맞지 않습니다");
            request.setAttribute("loc", "/member/pwdSearch");
            request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
            return;
        }
        
                //mail server 설정
                String host = "smtp.naver.com";
                String user = "feelproject_sh"; //자신의 네이버 계정
                String password = "dkssudgktpdy90";//자신의 네이버 패스워드
                
                //메일 받을 주소
                String to_email = userEmail;
                
                //SMTP 서버 정보를 설정한다.
                Properties props = new Properties();
                props.put("mail.smtp.host", host);
                props.put("mail.smtp.port", 465);
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.ssl.enable", "true");
                
                //인증 번호 생성기
                StringBuffer temp =new StringBuffer();
                Random rnd = new Random();
                for(int i=0;i<10;i++)
                {
                    int rIndex = rnd.nextInt(3);
                    switch (rIndex) {
                    case 0:
                        // a-z
                        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                        break;
                    case 1:
                        // A-Z
                        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                        break;
                    case 2:
                        // 0-9
                        temp.append((rnd.nextInt(10)));
                        break;
                    }
                }
                String AuthenticationKey = temp.toString();
                System.out.println(AuthenticationKey);
                
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(user,password);
                    }
                });
                
                //email 전송
                try {
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom(new InternetAddress(user, "KH Books"));
                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
                    
                    //메일 제목
                    msg.setSubject("안녕하세요 QuickBox 인증 메일입니다.");
                    //메일 내용
                    msg.setText("인증 번호는 :"+temp);
                    
                    Transport.send(msg);
                    System.out.println("이메일 전송");
                    
                }catch (Exception e) {
                    e.printStackTrace();// TODO: handle exception
                }
                HttpSession saveKey = request.getSession();
                saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
                //패스워드 바꿀때 뭘 바꿀지 조건에 들어가는 id
                request.setAttribute("userId", userId);
                request.getRequestDispatcher("/views/login_myPage/searchPasswordEnd.jsp").forward(request, response);
    }
}
