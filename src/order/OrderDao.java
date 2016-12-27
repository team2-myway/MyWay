package order;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class OrderDao {
	private Connection con;
	private PreparedStatement stmt;
	private ResultSet rs;
	private DataSource ds;
	
	public OrderDao(){
		try{
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysqlDB");
			
		}catch(Exception err){
			System.out.println("���� ����" + err);
		}
	}
	public void StampAdd(int account_no, int count){
		String sql = "";
		try{
		sql = "select stamp from account where account_no = ?";
		con = ds.getConnection();
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, account_no);
		rs = stmt.executeQuery();
		rs.next();
		int stamp = rs.getInt("stamp");
		int countstamp = stamp+count;
		// ȸ���� �������� ������ �ø�
		sql ="update account set stamp=? where account_no = ?";
		con = ds.getConnection();
		stmt = con.prepareStatement(sql);
		stmt.setInt(1, countstamp);
		stmt.setInt(2, account_no);
		stmt.executeUpdate();
		}catch(Exception err){
			System.out.println("StampAdd"+err);
		}finally{
			freeConnection();
		}
	}
	public void DetailOrderSave(OrderDto dto){
		String sql = "";
		
		try{
			sql = "insert into detail_order(order_code, bread_no, menu_no, vegetable_no, sauce_no, count, price, favorite)"
					+ " values (?, ?, ?, ?, ?, ?,?,?);";
			
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getOrder_code());
			stmt.setInt(2, dto.getBread_no());
			stmt.setInt(3, dto.getMenu_no());
			stmt.setString(4, dto.getVegetable_no_List());
			stmt.setString(5, dto.getSauce_no_List());
			stmt.setInt(6, dto.getMenu_count());
			stmt.setInt(7, dto.getMenu_price());
			stmt.setString(8, dto.getFavorite());
			stmt.executeUpdate();
		//	System.out.println(sql);
			//ȸ���� ���� �������� ���� �˱�����
			StampAdd(dto.getAccount_no(), dto.getMenu_count());
			OrderSave(dto);
		}catch(Exception err){
			System.out.println("DetailOrderSave"+err);
		}finally{
			freeConnection();
		}
	}
	//결제완료시 pay_com 주문완료 order_com
	public void OrderSave(OrderDto dto){
		String sql = "insert into main_order(order_code,account_no, account_name, account_tel, store_no, total, date, status) "
				+ "values (?, ?, ?, ?, ?, ?, date_format(now(),'%Y/%m/%d %H:%i:%s'),'order_com')";
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			stmt.setString(1, dto.getOrder_code());
			stmt.setInt(2, dto.getAccount_no());
			stmt.setString(3, dto.getAccount_name());
			stmt.setString(4, dto.getAccount_tel());
			stmt.setInt(5, dto.getManage_no());
			stmt.setInt(6, dto.getOrder_price());
			
			stmt.executeUpdate();
			//System.out.println(sql);
		}catch(Exception err){
			System.out.println("OrderSave"+err);
		}finally{
			freeConnection();
		}
	
	}
	
	public String Order_Code(int account_no, String date){
		String ordermax_no = "";
		String sql = "select id from account where account_no = "+account_no;
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			rs.next();
			String dates = date.substring(1,6);
			String id = rs.getString("id").substring(2);
			ordermax_no = "ORD"+id+"NO"+dates;
			//System.out.println(ordermax_no);
			
		}catch(Exception err){
			System.out.println("Order_Code" + err);
		}finally{
			freeConnection();
		}
		return ordermax_no;
	}
	// 나의 즐겨찾기와 주문내역 보기 
	public ArrayList MyOrderList(int account_no, String map, String StartDate, String EndDate){
		ArrayList list = new ArrayList();
		String sql = "";
		if(map.equals("orderlist")){
			sql="select a.manager_area manager_area, a.manager_name, m.total, d.vegetable_no, substr(m.date,1,16) date, "
					+ "d.sauce_no, d.count, menu.menu_name, side.count, sm.side_menu_name, side.price, b.name bread_name from main_order m "
					+ "left join detail_order d on m.order_code = d.order_code "
					+ "left join bread b on b.bread_no = d.bread_no "
					+ "left join side_order side on side.order_code = m.order_code "
					+ "left join side_menu sm on sm.side_menu_no = side.side_menu_no "
					+ "left join menu on menu.menu_no = d.menu_no "
					+ "left join account a on a.account_no = m.store_no "
					+ "where m.account_no="+account_no;
			if(StartDate == null || StartDate.isEmpty() || StartDate == null || StartDate.isEmpty()){
				sql += " order by date desc";
			}else{
				sql += " and substr(date,1,10)>='"+StartDate+"' and substr(date,1,10)<='"+EndDate+"' order by date desc";
			
			}
		}else{
			//즐겨찾기
			sql="select a.manager_area manager_area, a.manager_name, m.total, d.vegetable_no, substr(m.date,1,16) date, "
					+ "d.sauce_no, d.count, menu.menu_name, menu.menu_size, d.menu_no, d.bread_no, b.name bread_name from main_order m "
					+ "left join detail_order d on m.order_code = d.order_code "
					+ "left join bread b on b.bread_no = d.bread_no "
					+ "left join menu on menu.menu_no = d.menu_no "
					+ "left join account a on a.account_no = m.store_no "
					+ "where m.account_no="+account_no +" and d.favorite ='ok'";
		}
		System.out.println(sql);
		//System.out.println(sql);
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			if(map.equals("orderlist")){
				while(rs.next()){
					OrderDto dto = new OrderDto();
					dto.setManage_addr(rs.getString("manager_area"));
					dto.setManage_name(rs.getString("a.manager_name"));
					dto.setMenu_price(rs.getInt("m.total"));
					dto.setMenu_count(rs.getInt("d.count"));
					dto.setMenu_name(rs.getString("menu.menu_name"));
					dto.setBread_name(rs.getString("bread_name"));
					dto.setOrder_date(rs.getString("date"));
					dto.setVegetable_no_List(rs.getString("d.vegetable_no"));
					dto.setSauce_no_List(rs.getString("d.sauce_no"));
					dto.setSide_menu_name(rs.getString("sm.side_menu_name"));
					dto.setSide_menu_count(rs.getInt("side.count"));
					dto.setSide_menu_countPirce(rs.getInt("side.price"));
					list.add(dto);
				}
			}else{
				while(rs.next()){
					OrderDto dto = new OrderDto();
					dto.setMenu_name(rs.getString("menu.menu_name"));
					dto.setBread_name(rs.getString("bread_name"));
					dto.setVegetable_no_List(rs.getString("d.vegetable_no"));
					dto.setSauce_no_List(rs.getString("d.sauce_no"));
					dto.setMenu_no(rs.getInt("d.menu_no"));
					dto.setBread_no(rs.getInt("d.bread_no"));
					dto.setMenu_size(rs.getString("menu.menu_size"));
					list.add(dto);
				}
				
			}
			
		}catch(Exception err){
			System.out.println("MyOrderList" + err);
		}finally{
			freeConnection();
		}
		
		return list;
	}
	
	public ArrayList VegetableOrderList(String vegetable_no){
		ArrayList list = new ArrayList();
		try{
			String[] vegetalbe = vegetable_no.split("\\|");
			String ordervegetable = "";
			String sql1="select name from vegetable where ";
				
				for(int i=0; i<vegetalbe.length; i++){
					ordervegetable = vegetalbe[i];
					// �迭�� �������� Ȯ�� ���������� or �� ������ �ȵǱ� ����
					if(vegetalbe[i]==vegetalbe[vegetalbe.length-1]){
						sql1 += "vegetable_no = '"+ ordervegetable +"'";
					}else{
						sql1 += "vegetable_no = '"+ ordervegetable +"' or ";
					}
				}
				//System.out.println(sql1);
				con = ds.getConnection();
				stmt = con.prepareStatement(sql1);
				rs = stmt.executeQuery();
				
				for(int i=0; i<vegetalbe.length; i++){
					rs.next();
					list.add(rs.getString("name"));
				}
				
		}catch(Exception err){
			System.out.println("VegetableOrderList" + err);
		}finally{
			freeConnection();
		}
		return list;
	}
	//������ �ҽ��� �̸��� �˱�����
	public ArrayList SauceOrderList(String sauce_no){
		ArrayList list = new ArrayList();
		try{
			String[] sauce = sauce_no.split("\\|");
			String ordersauce = "";
			String sql2="select name from sauce where ";
			//System.out.println(sql1);
			for(int i=0; i<sauce.length; i++){
				ordersauce = sauce[i];
				// �迭�� �������� Ȯ�� ���������� or �� ������ �ȵǱ� ����
				if(sauce[i]==sauce[sauce.length-1]){
					sql2 += "sauce_no = '"+ ordersauce +"'";
				}else{
					sql2 += "sauce_no = '"+ ordersauce +"' or ";
				}
			}
			con = ds.getConnection();
			stmt = con.prepareStatement(sql2);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				list.add(rs.getString("name"));
				
			}
		}catch(Exception err){
			System.out.println("SauceOrderList" + err);
		}finally{
			freeConnection();
		}
		
		return list;
	}

	//�޴� ������ ���� ������ �ϴ� �͵� Ŭ������ ����
	public ArrayList MenuSizeList(String menusize, String menuclass){
		ArrayList list = new ArrayList();
		String sql="";
		if(menuclass.equals("All")){
			sql = "select * from menu where menu_size = '"+menusize+"'";
		}else{
			sql = "select * from menu where menu_size = '"+menusize+"' and class = '"+menuclass+"'";
		}
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				OrderDto dto = new OrderDto();
				dto.setMenu_no(rs.getInt("menu_no"));
				dto.setMenu_class(rs.getString("class"));
				dto.setMenu_name(rs.getString("menu_name"));
				dto.setMenu_image(rs.getString("image"));
				dto.setMenu_price(rs.getInt("price"));
				dto.setMenu_bestSouce(rs.getString("sauce_no"));
				dto.setMenu_calorie(rs.getInt("calorie"));
				dto.setMenu_detail(rs.getString("detail"));
				list.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("MenuSizeList" + err);
		}finally{
			freeConnection();
		}
		
		return list;
	}
	
	// �޴��� ��õ�ҽ��� �̾ƿ��� 
	public ArrayList BestSauce(String menu_no){
		ArrayList list = new ArrayList();
		OrderDto dto = new OrderDto();
		
			try{
				String sql = "select sauce_no from menu where menu_no = '"+menu_no+"'";
				
				con = ds.getConnection();
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();
				while(rs.next()){
					dto.setMenu_bestSouce(rs.getString("sauce_no"));
				}
				
				String[] sauce = dto.getMenu_bestSouce().split("\\|");
				String bestsauce = "";
				String sql1="select name from sauce where ";
					
					for(int i=0; i<sauce.length; i++){
						bestsauce = sauce[i];
						// �迭�� �������� Ȯ�� ���������� or �� ������ �ȵǱ� ����
						if(sauce[i]==sauce[sauce.length-1]){
							sql1 += "sauce_no = '"+ bestsauce +"'";
						}else{
							sql1 += "sauce_no = '"+ bestsauce +"' or ";
						}
					}
					con = ds.getConnection();
					stmt = con.prepareStatement(sql1);
					rs = stmt.executeQuery();
					
					
					for(int i=0; i<sauce.length; i++){
						rs.next();
						list.add(rs.getString("name"));
					}
			
			}catch(Exception err){
				System.out.println("BestSauce" + err);
			}finally {
				freeConnection();
				
			}
		return list;
	}
	
	
	// �޴� Ŭ���� �� ���� ����Ʈ
	public ArrayList MenuClassList(){
		ArrayList list = new ArrayList();
		String sql = "select class from menu group by class";
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				OrderDto dto = new OrderDto();
				dto.setMenu_class(rs.getString("class"));
				list.add(dto);
			}
		}catch(Exception err){
			System.out.println("MenuClassList" + err);
		}finally{
			freeConnection();
		}
		
		return list;
	}
	public ArrayList SideMenuClassList(){
		ArrayList list = new ArrayList();
		String sql = "select category from side_menu group by category";
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				OrderDto dto = new OrderDto();
				dto.setSide_category(rs.getString("category"));;
				list.add(dto);
			}
		}catch(Exception err){
			System.out.println("SideMenuClassList" + err);
		}finally{
			freeConnection();
		}
		
		return list;
	}
	public ArrayList SideMenuList(String category){
		ArrayList list = new ArrayList();
		String sql="";
		if(category.equals("All")){
			sql = "select * from side_menu";
		}else{
			sql = "select * from side_menu where category = '"+category+"'";
		}
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				OrderDto dto = new OrderDto();
				dto.setSide_menu_no(rs.getInt("side_menu_no"));
				dto.setSide_menu_name(rs.getString("side_menu_name"));
				dto.setSide_menu_img(rs.getString("image"));
				dto.setSide_menu_price(rs.getInt("price"));
				list.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("SideMenuList" + err);
		}finally{
			freeConnection();
		}
		
		return list;
	}
	//�� ����Ʈ �̱�
	public ArrayList BreadList(){
		ArrayList list = new ArrayList();
		String sql = "select * from bread";
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				OrderDto dto = new OrderDto();
				dto.setBread_no(rs.getInt("bread_no"));
				dto.setBread_name(rs.getString("name"));
				dto.setBread_detail(rs.getString("detail"));
				list.add(dto);
			}
		}catch(Exception err){
			System.out.println("BreadList" + err);
		}finally{
			freeConnection();
		}
		
		return list;
	}
	
	
	//�ҽ� ����Ʈ 
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
	// ä�� ����Ʈ
	public ArrayList VegetableList(){
		ArrayList list = new ArrayList();
		String sql = "select * from vegetable";
	try{
		con = ds.getConnection();
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			OrderDto dto = new OrderDto();
			dto.setVegetable_no(rs.getInt("vegetable_no"));
			dto.setVegetable_name(rs.getString("name"));
			dto.setVegetable_img(rs.getString("img"));
			list.add(dto);
		}
		
	}catch(Exception err){
		System.out.println("SauceList" + err);
	}finally{
		freeConnection();
	}
		return list;
	}
	// ���� �������� ������ ��
	public ArrayList ManagerAddrList(){
		ArrayList list = new ArrayList();
		String sql = "SELECT manager_area FROM myway.account where level = 'super' or level = 'manager' group by manager_area;";
	try{
		con = ds.getConnection();
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			OrderDto dto = new OrderDto();
			dto.setManage_addr(rs.getString("manager_area"));;
			list.add(dto);
		}
		
	}catch(Exception err){
		System.out.println("ManagerAddrList" + err);
	}finally{
		freeConnection();
	}
		return list;
	}
	
	public ArrayList ManagerList(String area){
		
		ArrayList list = new ArrayList();
		String sql = "SELECT * FROM myway.account where (level = 'super' or level = 'manager') and manager_area='"+area+"'";
	try{
		con = ds.getConnection();
		stmt = con.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			OrderDto dto = new OrderDto();
			dto.setManage_no(rs.getInt("account_no"));
			dto.setManage_name(rs.getString("manager_name"));
			dto.setManage_addr(rs.getString("manager_area"));
			list.add(dto);
		}
		
	}catch(Exception err){
		System.out.println("ManagerList" + err);
	}finally{
		freeConnection();
	}
		return list;
	}
	// ȸ������ �������� 
	public ArrayList MyAccountList(int account_no){
		String sql ="select account_name, tel from account where account_no = "+account_no;
		ArrayList list = new ArrayList();
		try{
			con = ds.getConnection();
			stmt = con.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()){
				OrderDto dto = new OrderDto();
				dto.setAccount_name(rs.getString("account_name"));
				dto.setAccount_tel(rs.getString("tel"));
				list.add(dto);
			}
			
		}catch(Exception err){
			System.out.println("MyAccountList" + err);
		}finally{
			freeConnection();
		}
		return list;
		
	}
	
	public void SideOrderSave(OrderDto dto){
		String sql="insert into side_order(order_code, side_menu_no, count, price) value(?,?,?,?)";
		try{
			for(int i=0; i<dto.getSide_menu_countList().length; i++){
				con = ds.getConnection();
				stmt = con.prepareStatement(sql);
				int[] sideno = dto.getSide_menu_noList();
				int[] count = dto.getSide_menu_countList();
				int[] price = dto.getSide_meun_count_priceList();
				
				stmt.setString(1, dto.getOrder_code());
				stmt.setInt(2, sideno[i]);
				stmt.setInt(3, count[i]);
				stmt.setInt(4, price[i]);
				
				System.out.println(sql);
				stmt.executeUpdate();
			}
			
			OrderSave(dto);
			
			
		}catch(Exception err){
			System.out.println("MyAccountList" + err);
		}finally{
			freeConnection();
		}
	}
		
	public void freeConnection(){
		if(rs!= null){try{rs.close();}catch(Exception err){}}
		if(con!= null){try{con.close();}catch(Exception err){}}
		if(stmt!= null){try{stmt.close();}catch(Exception err){}}
	}
	
}
