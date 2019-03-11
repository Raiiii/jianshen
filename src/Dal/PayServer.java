package Dal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import Mod.*;

public class PayServer extends DB {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	///获取所有会员信息
	public List<Pay> GetAll(String key,int startindex,int pagesize)
	{
		List<Pay> list=new ArrayList<Pay>();
		try
		{
			con=this.getcon();
			String sql=DB.SetPageSQL("Pay", startindex, pagesize, key, "id", " id desc");
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				Pay v=new Pay();
				v.setId(rs.getInt("id"));
				v.setIntime(rs.getDate("intime"));
				v.setMoney(rs.getDouble("money"));
				v.setProject(new ProjectServer().GetByID(rs.getInt("Project_ID")));
				v.setWorker(new WorkerServer().GetByID(rs.getInt("Worker_ID")));
				v.setClient(new ClientServer().GetByID(rs.getInt("Client_ID")));
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
	
	
	
	
	
	public List<Pay> GetClientAll(int id,String key,int startindex,int pagesize)
	{
		List<Pay> list=new ArrayList<Pay>();
		key="Client_ID="+id;
		try
		{
			con=this.getcon();
			String sql=DB.SetPageSQL("Pay", startindex, pagesize, key, "id", " id desc");
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				Pay v=new Pay();
				v.setId(rs.getInt("id"));
				v.setIntime(rs.getDate("intime"));
				v.setMoney(rs.getDouble("money"));
				v.setProject(new ProjectServer().GetByID(rs.getInt("Project_ID")));
				v.setWorker(new WorkerServer().GetByID(rs.getInt("Worker_ID")));
				v.setClient(new ClientServer().GetByID(rs.getInt("Client_ID")));
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
			String sql=DB.SetCountSQL("Pay", key,"count(*)");
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
	public int Add(int pid,int wid,int cid,double money)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("insert Pay values(%d,%d,%d,getdate(),%f)",
					pid,wid,cid,money);
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
			String sql=String.format("delete from Pay where id=%d",id);
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
	public Pay GetByID(int id)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from [Pay] where ID=%d",id);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				Pay v=new Pay();
				v.setId(rs.getInt("id"));
				v.setIntime(rs.getDate("intime"));
				v.setMoney(rs.getDouble("money"));
				v.setProject(new ProjectServer().GetByID(rs.getInt("Project_ID")));
				v.setWorker(new WorkerServer().GetByID(rs.getInt("Worker_ID")));
				v.setClient(new ClientServer().GetByID(rs.getInt("Client_ID")));
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
}
