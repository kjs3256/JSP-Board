package survey;

import java.sql.*;

import util.ConnUtil;

public class SurveyDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static SurveyDao instance = null;
	private SurveyDao() {}
	public static SurveyDao getInstance() {
		if(instance == null) {
			synchronized(SurveyDao.class) {
				instance = new SurveyDao();
			}
		}
		return instance;
	}
	public void insertSurvey(SurveyDto dto) {
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("insert into SURVEY values(SURVEY_SEQ.nextval, ?, ?, ?, ?, ?)");
			pstmt.setString(1, dto.getSports());
			pstmt.setString(2, dto.getFav_team());
			pstmt.setString(3, dto.getHate_team());
			pstmt.setString(4, dto.getFav_player());
			pstmt.setString(5, dto.getHate_player());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public int getNum() {
		int num = 0;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select max(NUM) from SURVEY");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return num;
	}
	public SurveyDto surveyResult(int num) {
		SurveyDto tmp = null;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select * from SURVEY where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				tmp = new SurveyDto();
				tmp.setSports(rs.getString("sports"));
				tmp.setFav_team(rs.getString("fav_team"));
				tmp.setHate_team(rs.getString("hate_team"));
				tmp.setFav_player(rs.getString("fav_player"));
				tmp.setHate_player(rs.getString("hate_player"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return tmp;
	}
	public int surveySportsGet(String sports) {
		int number = 0;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select count(*) from SURVEY where sports = ?");
			pstmt.setString(1, sports);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				number = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return number;
	}
	public int surveyFavTeamGet(String favTeam) {
		int number = 0;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select count(*) from SURVEY where fav_team = ?");
			pstmt.setString(1, favTeam);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				number = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return number;
	}
	public int surveyHateTeamGet(String hateTeam) {
		int number = 0;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select count(*) from SURVEY where hate_team = ?");
			pstmt.setString(1, hateTeam);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				number = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return number;
	}
	public int surveyFavPlayerGet(String favPlayer) {
		int number = 0;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select count(*) from SURVEY where fav_player = ?");
			pstmt.setString(1, favPlayer);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				number = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return number;
	}
	public int surveyHatePlayerGet(String hatePlayer) {
		int number = 0;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select count(*) from SURVEY where hate_player = ?");
			pstmt.setString(1, hatePlayer);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				number = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return number;
	}
	public int surveyGetAll() {
		int all = 0;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select count(*) from SURVEY");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				all = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return all;
	}
}
