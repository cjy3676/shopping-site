package shopping_site.Command;

import java.sql.Connection;
import java.sql.SQLException;
import shopping_site.Dao.Dao;
import shopping_site.Dto.Dto;
import shopping_site.jdbc.Connect;

public class Update {
	public Dto update_exe(String userid) throws SQLException {
		Connection conn = Connect.connection2();
		Dao dao = new Dao();
		Dto dto = dao.update_exe(conn, userid); // 회원정보를 select해서 다시 돌려주는 역할
		return dto;
	}
}
