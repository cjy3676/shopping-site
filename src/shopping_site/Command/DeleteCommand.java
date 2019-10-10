package shopping_site.Command;

import java.sql.Connection;
import java.sql.SQLException;
import shopping_site.Dao.Dao;
import shopping_site.jdbc.Connect;

public class DeleteCommand {
	public void delete(String id) throws SQLException {
		Connection conn = Connect.connection2();
		Dao dao = new Dao();
		dao.delete(conn, id);
	}
}
