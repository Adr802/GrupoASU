package com.negocio;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.datos.Conexion;

public class Postulacion {

	private Integer estado_pos;
	private Integer id_us;
	private String correo;
	

	public Postulacion() {
		
	}
	
	public Postulacion(String correo) {
		String sentencia="SELECT id_us FROM tb_usuario where correo_us='" + correo + "';";
		Conexion con=new Conexion();
		ResultSet rs=null;
		rs=con.Consulta(sentencia);
		this.setCorreo(correo);
		try {
			while(rs.next())
			{
				this.setId_us(rs.getInt(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
	}
	
	public boolean newPostulacion() {
	   String sentencia="INSERT INTO public.tb_postulaciones("
	   		+ "	estado_pos, ced_pos)"
	   		+ "	VALUES (1,"
	   		+ this.getId_us() + ")";
		Conexion clsCon=new Conexion();
		
		if(this.verificarPostulacion()) {
			clsCon.Ejecutar(sentencia);
			return true;
		}else {
			return false;
		}
	}
	
	/*FUNCIONAR PARA VERIFICAR SI EL USUARIO YA TIENE UNA POSTULACION ACTIVA O YA ES MIEMBRO*/
	
	public boolean verificarPostulacion() {
		String sentencia="SELECT ced_pos FROM public.tb_postulaciones, tb_usuario "
				+ "where tb_postulaciones.ced_pos = (select id_us from tb_usuario where tb_usuario.correo_us = '" + this.getCorreo()
				+ "')"
				+ "AND (tb_postulaciones.estado_pos = 1 OR tb_postulaciones.estado_pos = 4)"
				+ "group by ced_pos;";
		Conexion con=new Conexion();
		ResultSet rs=null;
		rs=con.Consulta(sentencia);
		try {
			if(rs != null && rs.next()) {
				return false;
			}else {
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean modificarEstado(int cod, String estado) {
		boolean agregado = true;
		Conexion obj = new Conexion();
		String sql="UPDATE public.tb_postulaciones"
				+ "	SET estado_pos=" + estado
				+ "	WHERE ced_pos=" + cod +";";
		String insert="";
		try {
			obj.Ejecutar(sql);
			if(estado.equals("4")) {
				insert = "INSERT INTO public.tb_miembros("
						+ "	ced)"
						+ "	VALUES (" + cod
						+ ");";
				obj.Ejecutar(insert);
			}
			agregado = true;
		}catch (Exception e) {
			// TODO: handle exception
			agregado=false;
		}
		return agregado;
	}
	
	public String tablaPostulacionPendiente() {
		String sql="SELECT * FROM tb_usuario, tb_postulaciones where tb_usuario.id_us = tb_postulaciones.ced_pos and estado_pos = 1 ORDER BY id_us";
		Conexion con=new Conexion();
		String tabla="<table class=\"table table-striped table-hover\"><th>ID Postulacion</th><th>Nombre</th><th>Correo</th><th>Estado</th><th></th><th></th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				String estado="";
				if(rs.getInt(10)==1)
					estado="Pendiente";
				else if(rs.getInt(10)==2) {
					estado="Rechazado";
				}
				tabla+="<tr><td>"+rs.getInt(9)+"</td>"
						+ "<td>"+rs.getString(2)+"</td>"
						+ "<td>"+rs.getString(4)+"</td>"
						+ "<td>"+estado+"</td>"
						+ "<td> <a href= aceptarPos.jsp?cod=" + rs.getInt(1) +"><img src=\"img/aceptar.png\" alt=\"Aceptar\" width=25></a></td>"
						+ "<td> <a href= rechazarPos.jsp?cod=" + rs.getInt(1) +"><img src=\"img/rechazar.png\" alt=\"Rechazar\" width=25></a></td>"
						+ "</td></tr>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		tabla+="</table>";
		return tabla;
	}
	
	
	
	public String tablaPostulacionRechazada() {
		String sql="SELECT * FROM tb_usuario, tb_postulaciones where tb_usuario.id_us = tb_postulaciones.ced_pos and estado_pos = 2 ORDER BY id_us";
		Conexion con=new Conexion();
		String tabla="<table class=\"table table-striped table-hover\"><th>ID Postulacion</th><th>Nombre</th><th>Correo</th><th>Estado</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				String estado="";
				if(rs.getInt(10)==1)
					estado="Pendiente";
				else if(rs.getInt(10)==2) {
					estado="Rechazado";
				}
				tabla+="<tr><td>"+rs.getInt(9)+"</td>"
						+ "<td>"+rs.getString(2)+"</td>"
						+ "<td>"+rs.getString(4)+"</td>"
						+ "<td>"+estado+"</td>"
						+ "</td></tr>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		tabla+="</table>";
		return tabla;
	}
	public String tablaPostulacionAceptada() {
		String sql="SELECT * FROM tb_usuario, tb_postulaciones where tb_usuario.id_us = tb_postulaciones.ced_pos and estado_pos = 4 ORDER BY id_us";
		Conexion con=new Conexion();
		String tabla="<table class=\"table table-striped table-hover\"><th>ID Postulacion</th><th>Nombre</th><th>Correo</th><th>Estado</th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				String estado="";
				if(rs.getInt(10)==1)
					estado="Pendiente";
				else if(rs.getInt(10)==2) {
					estado="Rechazado";
				}else if(rs.getInt(10)==4) {
					estado="Aceptado";
				}
				tabla+="<tr><td>"+rs.getInt(9)+"</td>"
						+ "<td>"+rs.getString(2)+"</td>"
						+ "<td>"+rs.getString(4)+"</td>"
						+ "<td>"+estado+"</td>"
						+ "</td></tr>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		tabla+="</table>";
		return tabla;
	}
	public Integer getEstado_pos() {
		return estado_pos;
	}
	public void setEstado_pos(Integer estado_pos) {
		this.estado_pos = estado_pos;
	}
	public Integer getId_us() {
		return id_us;
	}
	public void setId_us(Integer id_us) {
		this.id_us = id_us;
	}
	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}
}
