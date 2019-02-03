package plm.librarymanagementsystem;

import android.os.StrictMode;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionClass {
    String connectionClass = "com.mysql.jdbc.Driver";
    String url="jdbc:mysql://192.168.1.14/rblms";
    String userName= "phoneUser";
    String password= "rblms";

    public Connection CONN(){
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);
        Connection conn= null;
        String connURL = null;
        try {
            Class.forName(connectionClass);
            conn = DriverManager.getConnection(url,userName,password);
            conn = DriverManager.getConnection(connURL);


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    return conn;

    }

}
