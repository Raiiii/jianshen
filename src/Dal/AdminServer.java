package Dal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import Mod.*;
public class AdminServer extends DB {
	
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	///管理员登陆
	public Admin Login(String login)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from [admin] where login='%s'",login);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				Admin a=new Admin();
				a.setId(rs.getInt("id"));
				a.setLogin(rs.getString("login"));
				a.setPass(rs.getString("pass"));
				return a;
			}
			
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.closeAll(con, ps, rs);
		}
		return null;
	}
	
	///修改密码
	public int EditPass(int id,String pass)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("update admin set pass='%s' where id=%d",
					pass,id);
			ps=con.prepareStatement(sql);
			count=ps.executeUpdate();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.closeAll(con, ps, rs);
		}
		return count;
	}
	
	
	public Client LoginClient(String login)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from [Client] where CardID='%s'",login);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				Client a=new Client();
				a.setId(rs.getInt("id"));
				a.setCardID(rs.getString("CardID"));
				a.setName(rs.getString("name"));
				a.setPass(rs.getString("pass"));
				return a;
			}
			
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.closeAll(con, ps, rs);
		}
		return null;
	}
}
