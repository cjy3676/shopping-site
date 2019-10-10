package shopping_site.Command;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import shopping_site.Dao.Dao;
import shopping_site.Dto.Board_Dto;
import shopping_site.jdbc.Connect;

public class ListCommand { // list.jsp에서 호출이 되면 레코드를 읽어오는 Dao 메소드를 호출
	public ArrayList<Board_Dto> listCom() throws SQLException {
		Connection conn = Connect.connection2();
		Dao dao = new Dao();
		ArrayList<Board_Dto> list = dao.select(conn);
		return list;
	}
}
