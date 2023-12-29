import java.sql.*;

public class SimpleQueryMySQL {
    
    static final String CONN_URL = "jdbc:mysql://localhost/test";
    static final String USER = "root";              /* cuenta de usuario: "root" */
    static final String PASSWD = "password";        /* PASSWORD de la cuenta */
    static final String PRE_STMT = "select * from emp";
    
    public SimpleQueryMySQL() {
        
        try {
            
            // Registro del "driver"
            System.out.print( "Loading driver... " );
            Class.forName( "com.mysql.jdbc.Driver" ).newInstance();
            System.out.println( "loaded" );
            
            // Establece la connección con el servidor del SGBD
            System.out.print("Connecting to the database... ");
            
            Connection conn = DriverManager.getConnection( CONN_URL, USER, PASSWD);
            System.out.println( "connected" );
            
            // Creación de la consulta
            PreparedStatement stmt = conn.prepareStatement( PRE_STMT );
            
            // Ejecución de la consulta
            ResultSet rset = stmt.executeQuery();
            
            // Presentación del resultado
            System.out.println( "Results:" );
            dumpResultSet( rset );
            System.out.println( "" );
            
            // Cerrar y liberación de la memoria
            rset.close();
            stmt.close();
            conn.close();
            
        } catch( Exception e ) {
            
            System.err.println( "failed" );
            e.printStackTrace( System.err );
        }
    }
    
    private void dumpResultSet(ResultSet rset) throws SQLException {
        
        ResultSetMetaData rsetmd = rset.getMetaData();
        int i = rsetmd.getColumnCount();
        
        while (rset.next()) {
            for (int j = 1; j <= i; j++) {
                System.out.print(rset.getString(j) + "\t");
            }
            System.out.println();
        }
    }
    
    public static void main(String args[]) {
        
        new SimpleQueryMySQL();
    }
}
