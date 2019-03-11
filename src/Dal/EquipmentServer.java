package Dal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Mod.*;

public class EquipmentServer extends DB {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	///添加类别
	public int Add(Equipment w)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("insert equipment(equipmentName,count) values('%s',%d)",
			w.getEquipmentName(),w.getCount());
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
	
	///修改照片信息
	public int Edit(Equipment w)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("update equipment set equipmentName='%s',count=%d where id=%d",
					w.getEquipmentName(),w.getCount(),w.getId());
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
			String sql=String.format("delete from equipment where id=%d",id);
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
	public int Jie(int id,int userId)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("insert equip_client(equipId,clientId) values('%d',%d)",
					id,userId);
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
	
	///还照片信息
		public int Huan(int id,int userId)
		{
			int count=0;
			try
			{
				con=this.getcon();
				String sql=String.format("delete from equip_client where equipId="+id +"and clientId="+userId);
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
	public List<Equipment> GetAll(int startindex,int pagesize,String key)
	{
		List<Equipment> list=new ArrayList<Equipment>();
		try
		{
			con=this.getcon();
			String sql="";
		    sql=SetPageSQL("Equipment",startindex,pagesize,key,"id","id");
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				Equipment w=new Equipment();
				w.setId(rs.getInt("id"));
				w.setEquipmentName(rs.getString("equipmentName"));
				w.setCount(rs.getInt("count"));
				list.add(w);
			}
			
			
			for(Equipment one :list){
				//查询借出多少个
				String sql2="select count(*) from equip_client where equipId="+one.getId();
				ps=con.prepareStatement(sql2);
				ResultSet  result=ps.executeQuery();
				int count=0;
				while(result.next()){
					count=result.getInt(1);
				}
				one.setLendNum(count);
				one.setRemainNum(one.getCount()-count);
				System.out.println(one.getRemainNum());
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
	
	
	public List<Equipment> GetLendAll(int userId,int startindex,int pagesize,String key)
	{
		List<Equipment> list=new ArrayList<Equipment>();
		try
		{
			con=this.getcon();
			String sql="";
		    sql=SetPageSQL("Equipment",startindex,pagesize,key,"id","id");
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				Equipment w=new Equipment();
				w.setId(rs.getInt("id"));
				w.setEquipmentName(rs.getString("equipmentName"));
				w.setCount(rs.getInt("count"));
				list.add(w);
			}
			
			
			for(Equipment one :list){
				//查询我借出多少个
				String sql2="select count(*) from equip_client where equipId="+one.getId();
				ps=con.prepareStatement(sql2);
				ResultSet  result=ps.executeQuery();
				int count=0;
				while(result.next()){
					count=result.getInt(1);
				}
				String sql3="select count(*) from equip_client where equipId="+one.getId() +"and clientId="+userId;
				ps=con.prepareStatement(sql3);
				ResultSet  result2=ps.executeQuery();
				int count2=0;
				while(result2.next()){
					count2=result2.getInt(1);
				}
				
				one.setLendNum(count2);
				one.setRemainNum(one.getCount()-count);
				System.out.println(one.getRemainNum());
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
			String sql=DB.SetCountSQL("Equipment", key, "count(*)");
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
	public Equipment GetByID(int id)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from [Equipment] where ID=%d",id);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				Equipment w=new Equipment();
				w.setId(rs.getInt("id"));
				w.setEquipmentName(rs.getString("equipmentName"));
				w.setCount(rs.getInt("count"));
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
	public Equipment Login(String login)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from [Equipment] where login='%s'",login);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				Equipment w=new Equipment();
				w.setId(rs.getInt("id"));
				w.setEquipmentName(rs.getString("equipmentName"));
				w.setCount(rs.getInt("count"));
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
