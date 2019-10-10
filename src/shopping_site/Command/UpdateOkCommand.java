package shopping_site.Command;

import java.sql.Connection;
import java.sql.SQLException;
import shopping_site.Dao.Dao;
import shopping_site.Dto.Board_Dto;
import shopping_site.jdbc.Connect;

public class UpdateOkCommand {
	public void updateok(Board_Dto dto) throws SQLException {
		Connection conn = Connect.connection2();
		
		Dao dao = new Dao();
		dao.updateok(conn, dto);
	}
}
