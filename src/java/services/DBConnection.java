package services;

import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author ayanp
 */
@FunctionalInterface
public interface DBConnection {
    
    public Connection connection() throws SQLException, ClassNotFoundException;
    
}
