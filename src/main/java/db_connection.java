
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;

public class db_connection {
    private static final String URL = "jdbc:postgresql://localhost:5432/Hotel Chain";
    private static final String USER = "postgres";
    private static final String PASSWORD = "db_2025";

    public static void main(String[]args){
        try {
            Connection db = DriverManager.getConnection(URL, USER, PASSWORD);
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM hotel_chain");
            while (rs.next())
            {
                System.out.print("Column 1 returned: ");
                System.out.println(rs.getString(1));
            }
            rs.close();
            st.close();
            //db.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
