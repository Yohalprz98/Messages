package Messages.models;
import java.sql.*;
public class Connect {
    private static final String URL = "jdbc:mysql://localhost:3306/messages_db?serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = "qwerty";
    //method that returns connection to database
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }

    public static void close(ResultSet rs) throws SQLException {
        rs.close();
    }
    public static void close(PreparedStatement ps) throws SQLException {
        ps.close();
    }
    public static void close (Connection connection) throws SQLException {
        connection.close();
    }

}
