package Dal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import Mod.*;

public class ClientServer extends DB {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	///获取所有会员信息
	public List<Client> GetAll(String key,int startindex,int pagesize)
	{
		List<Client> list=new ArrayList<Client>();
		try
		{
			con=this.getcon();
			String sql=DB.SetPageSQL("Client", startindex, pagesize, key, "id", " id desc");
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				Client v=new Client();
				v.setId(rs.getInt("id"));
				v.setName(rs.getString("name"));
				v.setSex(rs.getString("sex"));
				v.setAge(rs.getInt("age"));
				v.setTel(rs.getString("tel"));
				v.setAddress(rs.getString("address"));
				v.setMail(rs.getString("mail"));
				v.setCardID(rs.getString("cardID"));
				v.setMoney(rs.getInt("money"));
				list.add(v);
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.closeAll(con, ps, rs);
		}
		return list;
	}
	
	///获取日志的总数量
	public int GetCount(String key)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=DB.SetCountSQL("Client", key,"count(*)");
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
            count = rs.getInt(1);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.closeAll(con, ps, rs);
		}
		return count;
	}
	
	///会员注册
	public int Add(Client c)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("insert Client values('%s',%d,'%s','%s','%s','%s','%s',0,'123456')",
					c.getName(),c.getAge(),c.getSex(),c.getTel(),c.getAddress(),c.getMail(),c.getCardID());
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
	
	///修改资料信息
	public int Edit(Client c)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("update Client set name='%s',Sex='%s',age=%d,tel='%s',address='%s',mail='%s' where id=%d",
					c.getName(),c.getSex(),c.getAge(),c.getTel(),c.getAddress(),c.getMail(),c.getId());
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
	
	
	
	///删除信息
	public int Del(int id)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("delete from Client where id=%d",id);
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
	
	///删除信息
	public int EditMoney(int id,double money,String ext)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("update Client set money=money %s %f where id=%d",ext,money,id);
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
	
	///根据日志类型获取照片信息
	public Client GetByID(int id)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from [Client] where ID=%d",id);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				Client v=new Client();
				v.setId(rs.getInt("id"));
				v.setName(rs.getString("name"));
				v.setSex(rs.getString("sex"));
				v.setAge(rs.getInt("age"));
				v.setTel(rs.getString("tel"));
				v.setAddress(rs.getString("address"));
				v.setMail(rs.getString("mail"));
				v.setCardID(rs.getString("cardID"));
				v.setMoney(rs.getInt("money"));
				return v;
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
	
	///根据日志类型获取照片信息
	public Client Login(String login)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from [Client] where login='%s'",login);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				Client v=new Client();
				v.setId(rs.getInt("id"));
				v.setName(rs.getString("name"));
				v.setSex(rs.getString("sex"));
				v.setAge(rs.getInt("age"));
				v.setTel(rs.getString("tel"));
				v.setAddress(rs.getString("address"));
				v.setMail(rs.getString("mail"));
				v.setCardID(rs.getString("cardID"));
				v.setMoney(rs.getInt("money"));
				return v;
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
				String sql=String.format("update client set pass='%s' where id=%d",
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
		
}
