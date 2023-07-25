package Messages.models;
import static Messages.models.Connect.*;
import java.sql.*;
import java.util.*;

public class MessageDao {
    private Connection connection = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    private Message message;

    public List<Message> select() throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM messages";
        List<Message> messages = new ArrayList<>();

        this.connection = getConnection();
        this.ps = this.connection.prepareStatement(sql);
        this.rs = this.ps.executeQuery();

        while (this.rs.next()) {
            int id = this.rs.getInt("id_messages");
            String message = this.rs.getString("message");
            String author = this.rs.getString("author");
            String date = this.rs.getString("date");

            this.message = new Message(id, message, author, date);
            messages.add(this.message);
        }
        close(this.rs);
        close(this.ps);
        close(this.connection);
        return messages;

    }

    public int insert(Message message) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO messages (message, author, date) VALUES (?, ?, CURRENT_TIME())";
        int entry = 0;
        this.connection = getConnection();
        this.ps = this.connection.prepareStatement(sql);

        this.ps.setString(1, message.getMessage());
        this.ps.setString(2, message.getAuthor());
        entry = this.ps.executeUpdate();

        close(this.ps);
        close(this.connection);

        return entry;
    }

    public int update(Message message) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE messages SET message=?, author=? WHERE id_messages=?";
        int entry = 0;
        this.connection = getConnection();
        this.ps = this.connection.prepareStatement(sql);

        this.ps.setString(1, message.getMessage());
        this.ps.setString(2, message.getAuthor());
        this.ps.setInt(3, message.getId());
        entry = this.ps.executeUpdate();

        close(this.ps);
        close(this.connection);

        return entry;
    }
    public int delete(Message message) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM messages WHERE id_messages=?";
        int entry = 0;
        this.connection = getConnection();
        this.ps = this.connection.prepareStatement(sql);

        this.ps.setInt(1, message.getId());
        entry = this.ps.executeUpdate();

        close(this.ps);
        close(this.connection);

        return entry;
    }

}
