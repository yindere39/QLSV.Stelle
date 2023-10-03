package com.stelle.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.stelle.models.Sinhvien;

public class SinhvienDAO {
	private String jdbcURL = "jdbc:oracle:thin:@DESKTOP-VVAIQP3:1521:test";
	private String jdbcUsername = "test";
	private String jdbcPassword = "test";
	private static final String INSERT_SINHVIEN_SQL = "INSERT INTO sinh_vien" + " (id,ten,lop_id) VALUES "
			+ " (SINHVIENS_SEQ.nextval, ?, ?)";
	private static final String SELECT_SINHVIEN_BY_ID = "select id,ten,lop_id from sinh_vien where id =?";
	private static final String SELECT_ALL_SINHVIEN = "select * from sinh_vien order by id";
	private static final String DELETE_SINHVIEN_SQL = "delete sinh_vien where id = ?";
	private static final String UPDATE_SINHVIEN_SQL = "update sinh_vien set ten = ?,lop_id = ? where id = ?";

	public SinhvienDAO() {
	}

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}

	public void insertSinhvien(Sinhvien sinhvien) throws SQLException {
		System.out.println(INSERT_SINHVIEN_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SINHVIEN_SQL)) {
			preparedStatement.setString(1, sinhvien.getTen());
			preparedStatement.setInt(2, sinhvien.getLop_id());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public Sinhvien selectSinhvien(int id) {
		Sinhvien sinhvien = null;
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SINHVIEN_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				String ten = rs.getString("ten");
				int lop_id = rs.getInt("lop_id");
				;
				sinhvien = new Sinhvien(id, ten, lop_id);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return sinhvien;
	}

	public List<Sinhvien> selectAllSinhvien() {
		List<Sinhvien> sinhviens = new ArrayList<>();
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_SINHVIEN);) {
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				String ten = rs.getString("ten");
				int lop_id = rs.getInt("lop_id");
				sinhviens.add(new Sinhvien(id, ten, lop_id));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return sinhviens;
	}

	public boolean deleteSinhvien(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_SINHVIEN_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateSinhvien(Sinhvien sinhvien) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_SINHVIEN_SQL);) {
			statement.setString(1, sinhvien.getTen());
			statement.setInt(2, sinhvien.getLop_id());
			statement.setInt(3, sinhvien.getId());
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}
