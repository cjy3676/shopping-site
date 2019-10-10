package shopping_site.Command;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import shopping_site.Dao.Dao;
import shopping_site.Dto.Board_Dto;
import shopping_site.jdbc.Connect;

public class UpdateCommand {
	public ArrayList<Board_Dto> update(String id) throws SQLException {
		Connection conn = Connect.connection2();
		Dao dao = new Dao();
		ArrayList<Board_Dto> list = dao.update(conn, id);
		return list;
	}
}
