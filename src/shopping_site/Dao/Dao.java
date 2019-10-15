package shopping_site.Dao;

import java.sql.*;
import java.util.ArrayList;
import shopping_site.Dto.Board_Dto;
import shopping_site.Dto.Dto;
import shopping_site.jdbc.Connect;


public class Dao {
	public void insert(Connection conn, Board_Dto dto) throws SQLException {
		String sql = "insert into board(name,title,content,writeday) values(?,?,?,now())";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTitle());
		pstmt.setString(3, dto.getContent());
		pstmt.execute();
		pstmt.close();
		conn.close();
	}
	
	public ArrayList<Board_Dto> select(Connection conn) throws SQLException {
		ArrayList<Board_Dto> list = new ArrayList<Board_Dto>();
		String sql = "select * from board order by id desc";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
		int i = rs.getInt("id");
		String n = rs.getString("name");
		String t = rs.getString("title");
		String c = rs.getString("content");
		String w = rs.getString("writeday");
		int r = rs.getInt("readnum");
		Board_Dto dto = new Board_Dto(i,n,t,c,w,r);
		list.add(dto);
		}
		
		return list; 
	}
	
	
	public ArrayList<Board_Dto> content(Connection conn, String id) throws SQLException { // content.jsp => ContentCommand => Dao 메소드
		// board테이블에서 id에 해당하는 레코드 1개만 읽어와서 return
		ArrayList<Board_Dto> list = new ArrayList<Board_Dto>();
		String sql = "select * from board where id="+id;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
        rs.next();
		int i = rs.getInt("id");
		String n = rs.getString("name");
		String t = rs.getString("title");
		String c = rs.getString("content");
		String w = rs.getString("writeday");
		int r = rs.getInt("readnum");
		Board_Dto dto = new Board_Dto(i,n,t,c,w,r);
		list.add(dto);
		
		stmt.close();
		conn.close();
		rs.close();
		
		return list;
	}
	
	public ArrayList<Board_Dto> update(Connection conn, String id) throws SQLException {
		ArrayList<Board_Dto> list = new ArrayList<Board_Dto>();
		String sql = "select * from board where id="+id;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
        rs.next();
		int i = rs.getInt("id");
		String n = rs.getString("name");
		String t = rs.getString("title");
		String c = rs.getString("content");
		String w = rs.getString("writeday");
		int r = rs.getInt("readnum");
		Board_Dto dto = new Board_Dto(i,n,t,c,w,r);
		list.add(dto);
		
		stmt.close();
		conn.close();
		rs.close();
		
		return list;
	}
	
	public void updateok(Connection conn, Board_Dto dto) throws SQLException {
		String sql = "update board set name=?, title=?, content=? where id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTitle());
		pstmt.setString(3, dto.getContent());
		pstmt.setInt(4, dto.getId());
		pstmt.execute();
		pstmt.close();
		conn.close();
	}
	
	public void delete(Connection conn, String id) throws SQLException {
		String sql = "delete from board where id="+id;
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		stmt.close();
		conn.close();
				
	}
	
	public Dto update_exe(Connection conn, String userid) throws SQLException {
		String sql = "select * from member where userid='"+userid+"'";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		Dto dto = new Dto(rs); // 생성자에 rs객체를 넘겨준다
		return dto;
	}
}

