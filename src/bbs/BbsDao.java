package bbs;

import java.sql.*;
import java.util.*;

import util.ConnUtil;

public class BbsDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static BbsDao instance = null;
	private BbsDao() {}
	public static BbsDao getInstance() {
		if(instance == null) {
			synchronized(BbsDao.class) {
				instance = new BbsDao();
			}
		}
		return instance;
	}
	public void insertArticle(String id, BbsDto article) {
		Connection conn2 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;
		int num = article.getNum();
		int ref = article.getRef();
		int step = article.getStep();
		int depth = article.getDepth();
		int number = 0;
		String sql="";
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select max(NUM) from BBS");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				number = rs.getInt(1)+1;
			}
			else {
				number = 1;
			}
			if(num != 0) {//답 글일 경우
				sql = "update BBS set STEP=STEP+1 where REF=? and STEP > ?";
				pstmt.close();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				pstmt.executeUpdate();
				step++;
				depth++;
			}
			else { //새 글일 경우
				ref = number;
				step = 0;
				depth = 0;
			}
			//쿼리 작성
			conn2 = ConnUtil.getConnection();
			pstmt2 = conn2.prepareStatement("select NICKNAME from MEMBER where id=?");
			pstmt2.setString(1, id);
			rs2 = pstmt2.executeQuery();
			if(rs2.next()) {
				article.setNickname(rs2.getString("nickname"));
			}
			sql = "insert into BBS"
					+ "(NUM, NICKNAME, SUBJECT, "
					+ "REGDATE, REF, STEP, DEPTH, CONTENT, IP, ID) "
					+ "values(BBS_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getNickname());
			pstmt.setString(2, article.getSubject());
			pstmt.setTimestamp(3, article.getRegdate());
			pstmt.setInt(4, ref);
			pstmt.setInt(5, step);
			pstmt.setInt(6, depth);
			pstmt.setString(7, article.getContent());
			pstmt.setString(8, article.getIp());
			pstmt.setString(9, article.getId());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs2 != null) rs2.close();
				if(pstmt2 != null) pstmt2.close();
				if(conn2 != null) conn2.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	public int getArticleCount() {
		int x = 0;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select count(*) from BBS");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
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
		return x;
	}
	public List<BbsDto> getArticles(int start, int end){
		List<BbsDto> articleList = null;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select * from (select rownum rnum, num, nickname, subject, "
					+"regdate, readcount, ref, step, depth, content, ip from ("
					+"select * from bbs order by ref desc, step asc)) where rnum>=? and rnum<=?");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				articleList = new ArrayList<BbsDto>(10);
				do {
					BbsDto article = new BbsDto();
					article.setNum(rs.getInt("num"));
					article.setNickname(rs.getString("nickname"));
					article.setSubject(rs.getString("subject"));
					article.setRegdate(rs.getTimestamp("regdate"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setStep(rs.getInt("step"));
					article.setDepth(rs.getInt("depth"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
					articleList.add(article);
				}while(rs.next());
		}
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
	return articleList;
	}
	public BbsDto getArticle(int num) {
		BbsDto article = null;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("update BBS set READCOUNT=READCOUNT+1 where NUM =?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = conn.prepareStatement("select * from BBS where NUM=?");
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				article = new BbsDto();
				article.setNum(rs.getInt("num"));
				article.setNickname(rs.getString("nickname"));
				article.setSubject(rs.getString("subject"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setStep(rs.getInt("step"));
				article.setDepth(rs.getInt("depth"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
				article.setId(rs.getString("id"));
			}
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
		return article;
	}
	public BbsDto updateGetArticle(int num) {
		BbsDto article = null;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select * from BBS where num=?");
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				article = new BbsDto();
				article.setNum(rs.getInt("num"));
				article.setNickname(rs.getString("nickname"));
				article.setSubject(rs.getString("subject"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setStep(rs.getInt("step"));
				article.setDepth(rs.getInt("depth"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
				article.setId(rs.getString("id"));
			}
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
		return article;
	}
	
	public int updateArticle(BbsDto article) {
		int ret = -1;
		String sql = "update BBS set subject=?, content=? where num=?";
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getSubject());
			pstmt.setString(2, article.getContent());
			pstmt.setInt(3, article.getNum());
			ret = pstmt.executeUpdate();
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
		return ret;
	}
	public int deleteArticle(int num) {
		int result = -1; //결과 값
		try {
			conn = ConnUtil.getConnection();
			pstmt=conn.prepareStatement("delete from BBS where NUM=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			result = 1; //글 삭제 성공
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
		return result;
	}
}
