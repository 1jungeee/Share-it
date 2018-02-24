package ShareIt;

import java.sql.*;
import org.json.simple.*;

public class MysqlDBHandle {

	String mysqlURL = "jdbc:mysql://localhost:3306/shareit";
	// sql database�� �ִ� url�� ������ database��
	String sID = "root";
	String sPass = "1234";
	String sqlJoin = "insert into member_info(member_id, member_pw, member_email) values(?, ?, ?)";
	String sql_insert_board_info = "insert into board_info(board_id, board_name, group_id) values(?, ?, ?)";
	String sql_insert_group_info = "insert into group_info(group_id, group_name) values(?, ?)";
	String sql_select_board_info = "SELECT * FROM board_info WHERE group_id=?";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs;
	PreparedStatement pstmt = null;
	public JSONArray board_array = new JSONArray();

	public MysqlDBHandle() {
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	public boolean join(String id, String pw, String email) {
		boolean result = false;
		try {
			conn = DriverManager.getConnection(mysqlURL, sID, sPass);
			pstmt = conn.prepareStatement(sqlJoin);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, email);
			pstmt.execute();
			conn.close();
			return true;
		} catch (Exception ex) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return result;
		}
	}

	public int login(String id, String pw) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbPW = ""; // db���� ���� ��й�ȣ�� ���� ����
		int x = -1;

		try {
			// ���� - ���� �Էµ� ���̵�� DB���� ��й�ȣ�� ��ȸ�Ѵ�.
			StringBuffer query = new StringBuffer();
			query.append("SELECT member_pw FROM member_info WHERE member_id=?");

			conn = DriverManager.getConnection(mysqlURL, sID, sPass);
			pstmt = conn.prepareStatement(query.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) // �Է��� ���̵� �ش��ϴ� ��� �������
			{
				dbPW = rs.getString("member_pw"); // ����� ������ �ִ´�.
				if (dbPW.equals(pw))
					x = 1; // �Ѱܹ��� ����� ������ ��� ��. ������ ��������
				else
					x = 0; // DB�� ��й�ȣ�� �Է¹��� ��й�ȣ �ٸ�, ��������
			} else {
				x = -1; // �ش� ���̵� ���� ���
			}
			return x;
		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}

	public boolean group_insert(String group_id, String group_name) {
		try {
			conn = DriverManager.getConnection(mysqlURL, sID, sPass);
			pstmt = conn.prepareStatement(sql_insert_group_info);
			System.out.println("sql_insert_group_info");
			System.out.println(group_id);
			System.out.println(group_name);

			pstmt.setString(1, group_id);
			pstmt.setString(2, group_name);
			pstmt.execute();
			conn.close();
			return true;
		} catch (Exception ex) {
			try {
				conn.close();
				System.out.println("aaaaaa");
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("aaaaaa");
			}
			return false;
		}
	}
	
	public boolean board_insert(String board_id, String board_name, String group_id) {
		try {
			conn = DriverManager.getConnection(mysqlURL, sID, sPass);
			pstmt = conn.prepareStatement(sql_insert_board_info);
			System.out.println("sql_insert_board_info");
			System.out.println(board_id);
			System.out.println(board_name);
			System.out.println(group_id);

			pstmt.setString(1, board_id);
			pstmt.setString(2, board_name);
			pstmt.setString(3, group_id);
			pstmt.execute();
			conn.close();
			return true;
		} catch (Exception ex) {
			try {
				conn.close();
				System.out.println("aaaaaa");
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("aaaaaa");
			}
			return false;
		}
	}

	public boolean board_select(String group_id) {

		try {
			conn = DriverManager.getConnection(mysqlURL, sID, sPass);
			pstmt = conn.prepareStatement(sql_select_board_info);
			pstmt.setString(1, group_id);
			rs = pstmt.executeQuery();

			while (rs.next()) { // ����� �� �྿ ���ư��鼭 �����´�.
				JSONObject temp_arry = new JSONObject();
				String DB_board_id = rs.getString("board_id");
				String DB_board_name = rs.getString("board_name");

				temp_arry.put("board_id", DB_board_id);
				temp_arry.put("board_name", DB_board_name);
				board_array.add(temp_arry);

				System.out.println(DB_board_id + " " + DB_board_name);

			}
			System.out.print(board_array.toJSONString());

			rs.close();
			pstmt.close();
			conn.close();

			return true;
		} catch (Exception e) { // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.

			e.printStackTrace();

			System.out.println("member ���̺� ȣ�⿡ �����߽��ϴ�.");
			return false;
		}
	}
}