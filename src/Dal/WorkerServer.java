package Dal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Mod.*;

public class WorkerServer extends DB {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	///添加类别
	public int Add(Worker w)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("insert Worker values('%s','%s',%d,'%s','%s','%s','111111',%f); select @@identity",
			w.getLogin(),w.getName(),w.getAge(),w.getTel(),w.getAddress(),w.getMid(),w.getMoney());
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
	
	///修改照片信息
	public int Edit(Worker w)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("update Worker set name='%s',age=%d,tel='%s',address='%s',mid='%s',money=%f where id=%d",
					w.getName(),w.getAge(),w.getTel(),w.getAddress(),w.getMid(),w.getMoney(),w.getId());
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
	
	
	
	///删除照片信息
	public int Del(int id)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("delete from Worker where id=%d",id);
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
	
	
	///根据日志类型获取日志信息
	public List<Worker> GetAll(int startindex,int pagesize,String key)
	{
		List<Worker> list=new ArrayList<Worker>();
		try
		{
			con=this.getcon();
			String sql="";
		    sql=SetPageSQL("Worker",startindex,pagesize,key,"id","id");
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				Worker w=new Worker();
				w.setId(rs.getInt("id"));
				w.setLogin(rs.getString("login"));
				w.setName(rs.getString("name"));
				w.setAge(rs.getInt("age"));
				w.setTel(rs.getString("tel"));
				w.setAddress(rs.getString("address"));
				w.setMid(rs.getString("mid"));
				w.setPass(rs.getString("pass"));
				w.setMoney(rs.getDouble("money"));
				list.add(w);
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
	
	///获取数量
	public int GetCount(String key)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=DB.SetCountSQL("worker", key, "count(*)");
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
	
	///获取员工详细信息
	public Worker GetByID(int id)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from [Worker] where ID=%d",id);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				Worker w=new Worker();
				w.setId(rs.getInt("id"));
				w.setLogin(rs.getString("login"));
				w.setName(rs.getString("name"));
				w.setAge(rs.getInt("age"));
				w.setTel(rs.getString("tel"));
				w.setAddress(rs.getString("address"));
				w.setMid(rs.getString("mid"));
				w.setPass(rs.getString("pass"));
				w.setMoney(rs.getDouble("money"));
				return w;
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
	
	///获取员工详细信息
	public Worker Login(String login)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from [Worker] where login='%s'",login);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				Worker w=new Worker();
				w.setId(rs.getInt("id"));
				w.setLogin(rs.getString("login"));
				w.setName(rs.getString("name"));
				w.setAge(rs.getInt("age"));
				w.setTel(rs.getString("tel"));
				w.setAddress(rs.getString("address"));
				w.setMid(rs.getString("mid"));
				w.setPass(rs.getString("pass"));
				w.setMoney(rs.getDouble("money"));
				return w;
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
