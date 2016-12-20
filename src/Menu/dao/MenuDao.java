package Menu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import order.OrderDto;

public class MenuDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DataSource ds;
	
	public MenuDao(){
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/MysqlDB");
			
		}catch(Exception err){
			System.out.println("연결 실패" + err);
		}
	}
	
	
	public ArrayList SauceList(String sauce){
			ArrayList list = new ArrayList();
			String sql = "select * from sauce where class='"+sauce+"'";
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
				
		while(rs.next()){
				OrderDto dto = new OrderDto();
				dto.setSauce_no(rs.getInt("sauce_no"));
				dto.setSauce_class(rs.getString("class"));
				dto.setSauce_name(rs.getString("name"));
				list.add(dto);
			}
				
			}catch(Exception err){
				System.out.println("SouceList" + err);
			}finally{
				freeConnection();
			}
			return list;
		}



public void freeConnection(){
	if(rs!= null){try{rs.close();}catch(Exception err){}}
	if(con!= null){try{con.close();}catch(Exception err){}}
	if(stmt!= null){try{stmt.close();}catch(Exception err){}}
}

}

