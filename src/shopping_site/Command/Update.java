package shopping_site.Command;

import java.sql.Connection;
import java.sql.SQLException;
import shopping_site.Dao.Dao;
import shopping_site.jdbc.Connect;

public class Update {
	public void update_exe(String userid) throws SQLException {
		Connection conn = Connect.connection2();
		Dao dao = new Dao();
		dao.update_exe(conn, userid); // 회원정보를 select해서 다시 돌려주는 역할
	}
}
