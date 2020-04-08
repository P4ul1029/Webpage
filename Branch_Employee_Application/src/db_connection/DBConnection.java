package db_connection;

import java.sql.*;

public class DBConnection {
	public static void main(String[] args) throws SQLException{
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("org.postgresql.Driver");
			
			Connection conn = DriverManager.getConnection("jdbc:postgresql://web0.site.uottawa.ca:15432/group_140","pbara036","Garden4946");
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT airbnb_group_40.properties_table.name, airbnb_group_40.users_table.name FROM airbnb_group_40.properties_table, airbnb_group_40.users_table WHERE airbnb_group_40.properties_table.host_id = airbnb_group_40.users_table.id");
			
			while(rs.next()) {
				System.out.print("Column 1 returned: ");
				System.out.println(rs.getString(1));
			}
			
			
		} catch (ClassNotFoundException e) {
			System.out.println();
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println();
			e.printStackTrace();
		} finally {
			rs.close();
			stmt.close();
		}
	}
}
