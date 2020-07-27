import java.sql.*;

import static Configs.Config.*;

public class TestClass {

    public static void main(String[] args){
        System.setProperty("jdbc.drivers", "sun.jdbc.odbc.JdbcodbcDriver");
        try {
            Connection connection = DriverManager.getConnection(URL+DATABASE_NAME, USERNAME, PASSWORD);
            CallableStatement cs = connection.prepareCall("call get_next_user_ID(?)");
//            int ID = -1;
//            cs.registerOutParameter(1, Types.INTEGER);
//            String sql = "call get_next_user_ID()";

            cs.execute();


//            System.out.println("ID " + ID);
//            int ID = rs.getInt("ID");
            int ID = cs.getInt(1);
            System.out.println("ID " + ID);
//            cs.close();
            connection.close();
        } catch (SQLException unused) {
            System.out.println("SQLEcxeption: during creating connection in Connector");
        }
    }
}
