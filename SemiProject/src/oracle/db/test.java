package oracle.db;



public class test {
	public static void main(String[] args) {
		DbConnect db = new DbConnect();	// 생성자 호출
		db.getConnection();
	}
}
