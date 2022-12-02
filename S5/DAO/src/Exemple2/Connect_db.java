package Exemple2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect_db {
    private static Connection connection;
    static {
        try{
            String db = "jdbc:oracle:thin:@localhost:1521:xe";
            connection = DriverManager.getConnection(db, "tp_java", "java");
        } catch(SQLException sqlException){
            sqlException.printStackTrace();
        }
    }
    public static Connection getConnection(){
        return connection;
    }
}
