package com.sist.dao;
import java.util.*;
import java.sql.*;
public class StudentDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	// 드라이버 등록
	public StudentDAO()
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(Exception ex) {}
	}
	// 오라클 연결
	public void getConnection()
	{
		try
		{
			conn=DriverManager.getConnection(URL,"hr","happy");
		}catch(Exception ex) {}
	}
	// 오라클 연결 해제
	public void disConnection()
	{
		try
		{
			if (ps!=null) ps.close();
			if (conn!=null) conn.close();
		}catch(Exception ex) {}
	}
	//기능
	// 1. 추가
	public void studentInsert(StudentVO vo)
	{
		try
		{
			//1. 연결
			getConnection();
			//2. sql 문장
			String sql="INSERT INTO student VALUES((SELECT NVL(MAX(hakbun)+1,1) FROM student),?,?,?,?)";
			//3. SQL문장 전송
			ps=conn.prepareStatement(sql);
			//4. 실행 전에 ? 값을 채운다
			ps.setString(1, vo.getName()); // setString ==> '홍길동'
			ps.setInt(2, vo.getKor());
			ps.setInt(3, vo.getEng());
			ps.setInt(4, vo.getMath());
			// INSERT 실행 -> 자바는 auto COMMIT
			ps.executeUpdate(); // INSERT, UPDATE, DELETE -> excuteUpdate() -> COMMIT -> 트랜잭션(스프링)
                    			// SELECT => excuteQuery() -> COMMIT이 없다
		}catch(Exception ex)
		{
			ex.printStackTrace(); // 오류 확인
		}
		finally
		{
			// 닫기
			disConnection();
		}
		
	}
	// 2. 데이터 읽기
	public ArrayList<StudentVO> studentListData()
	{
		ArrayList<StudentVO> list=new ArrayList<StudentVO>();
		try
		{
			// 1. 연결
			getConnection();
			// 2. sql문장 제작
			String sql="SELECT hakbun,name,kor,eng,math,(kor+eng+math) total, "
					  +"ROUND((kor+eng+math)/3,2) avg "
					  +"FROM student";
			// 3. sql문장 전송
			ps=conn.prepareStatement(sql);
			// 4. 실행 후 데이터 요청
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				StudentVO vo=new StudentVO();
				vo.setHakbun(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setKor(rs.getInt(3));
				vo.setEng(rs.getInt(4));
				vo.setMath(rs.getInt(5));
				vo.setTotal(rs.getInt(6));
				vo.setAvg(rs.getDouble(7));
				list.add(vo);
			}
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			disConnection();
		}
		return list;
	}
	// 3. 수정
	// 4. 삭제
}
