<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="dao" class="order.OrderDao"></jsp:useBean>
<jsp:useBean id="dto" class="order.OrderDto"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");

	//회원정보
	int account_no = Integer.parseInt(request.getParameter("account_no"));
	String account_name = request.getParameter("account_name");
	String account_tel = request.getParameter("tel");
	// 매장 정보
	int manage_no = Integer.parseInt(request.getParameter("store_no"));
	//주문코드
	String order_code = request.getParameter("order_code");
	// saveType 은 샌드위치 저장할 것인지 사이드메뉴 저장할 것인지를 판단
	String saveType = request.getParameter("OrderTypes");
	
	System.out.println(saveType);
	
	if(saveType.equals("bread")){
		int menu_no = Integer.parseInt(request.getParameter("menu_no"));
		int bread_no = Integer.parseInt(request.getParameter("bread_no"));
		String menu_size = request.getParameter("menu_size");
		String vegetable_no_List = request.getParameter("VegetableList");
		String sauce_no_List = request.getParameter("SelectSauceValue"); 
		int menu_count = Integer.parseInt(request.getParameter("count"));
		int menu_price = Integer.parseInt(request.getParameter("CountPirce"));
		String favorite = request.getParameter("favorite");
		System.out.println(favorite);
		dto.setMenu_no(menu_no);
		dto.setBread_no(bread_no);
		dto.setMenu_size(menu_size);
		dto.setVegetable_no_List(vegetable_no_List);
		dto.setSauce_no_List(sauce_no_List);
		dto.setMenu_count(menu_count);
		dto.setMenu_price(menu_price);
		
		dto.setOrder_code(order_code);
		//즐겨찾기 여부
		dto.setFavorite(favorite);
		//회원들의 정보
		dto.setAccount_no(account_no);
		dto.setAccount_name(account_name);
		dto.setAccount_tel(account_tel);
		
		dto.setManage_no(manage_no);
		// 총합계(임시)
		dto.setOrder_price(menu_price);
		
		dao.DetailOrderSave(dto);
	}else{
		
		int SideTotalPrice = Integer.parseInt(request.getParameter("SideCountPrice"));
		//String sidemeuns = request.getParameter();
		
		//String 배열을 int 배열로 바꾸기 위함
		String[] sidemenus = request.getParameterValues("side_menu_no[]");
		int[] SideNo = new int[sidemenus.length];
		for(int i=0; i<sidemenus.length; i++){
			SideNo[i] = Integer.parseInt(sidemenus[i]);
		}

		String[] sidemenucount = request.getParameterValues("sidemenu_count");
		int[] SideCount = new int[sidemenucount.length];
		for(int i=0; i<sidemenucount.length; i++){
			SideCount[i] = Integer.parseInt(sidemenucount[i]);
		}
		
		String[] sidemeuncountprice = request.getParameterValues("side_countprice");
		int[] SideCountPrice = new int[sidemeuncountprice.length];
		for(int i=0; i<sidemeuncountprice.length; i++){
			SideCountPrice[i] = Integer.parseInt(sidemeuncountprice[i]);
		}
		
		
		dto.setSide_menu_noList(SideNo);
		dto.setSide_menu_countList(SideCount);
		dto.setSide_meun_count_priceList(SideCountPrice);
		dto.setAccount_no(account_no);
		dto.setAccount_name(account_name);
		dto.setAccount_tel(account_tel);
		dto.setManage_no(manage_no);
		dto.setOrder_code(order_code);
		dto.setOrder_price(SideTotalPrice);
		
		dao.SideOrderSave(dto);
		
	}
	
%>
