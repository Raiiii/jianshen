package Dal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Mod.*;
public class ProjectServer extends DB {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	///������
	public int Add(String type,double price)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("insert Project values('%s',%f)",type,price);
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
	
	///�޸���Ƭ��Ϣ
	public int Edit(String type,double price,int id)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("update Project set type='%s',price=%f where id=%d",type,price,id);
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
	
	///ɾ����Ƭ��Ϣ
	public int Del(int id)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("delete from Project where id=%d",id);
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
	
	///������־���ͻ�ȡ��־��Ϣ
	public List<Project> GetAll()
	{
		List<Project> list=new ArrayList<Project>();
		try
		{
			con=this.getcon();
			String sql="";
		    sql=String.format("select * from Project");
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				Project bt=new Project();
				bt.setId(rs.getInt("id"));
				bt.setType(rs.getString("type"));
				bt.setPrice(rs.getDouble("price"));
				list.add(bt);
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
	
	
	
	///������־���ͻ�ȡ��Ƭ��Ϣ
	public Project GetByID(int id)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from [Project] where ID=%d",id);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				Project bt=new Project();
				bt.setId(rs.getInt("id"));
				bt.setType(rs.getString("type"));
				bt.setPrice(rs.getDouble("price"));
				return bt;
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
