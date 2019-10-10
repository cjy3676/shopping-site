package shopping_site.Command;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import shopping_site.Dao.Dao;
import shopping_site.Dto.Board_Dto;
import shopping_site.jdbc.Connect;

public class ContentCommand {
	public ArrayList<Board_Dto> content(String id) throws SQLException {
		// DB연결
		Connection conn = Connect.connection2();
		// Dao에서 필요한 기능호출 Dao.메소드()
		Dao dao = new Dao();
		ArrayList<Board_Dto> list = dao.content(conn,id);
		return list;
	}
}
