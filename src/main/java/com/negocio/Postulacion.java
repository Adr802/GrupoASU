package com.negocio;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.datos.Conexion;

public class Postulacion {

	private Integer estado_pos;
	private Integer id_us;
	
	public Postulacion() {
		
	}
	
	public Postulacion(String correo) {
		String sentencia="SELECT id_us FROM tb_usuario where correo_us='" + correo + "';";
		Conexion con=new Conexion();
		ResultSet rs=null;
		rs=con.Consulta(sentencia);

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
	
	public void newPostulacion() {
	   String sentencia="INSERT INTO public.tb_postulaciones("
	   		+ "	estado_pos, ced_pos)"
	   		+ "	VALUES (1,"
	   		+ this.getId_us() + ")";
		System.out.println(sentencia);
		Conexion clsCon=new Conexion();
		String resu = clsCon.Ejecutar(sentencia);
		System.out.println(resu);
		
	}
	
	public String tablaPostulacion() {
		String sql="SELECT * FROM tb_usuario, tb_postulaciones where tb_usuario.id_us = tb_postulaciones.ced_pos ORDER BY id_us";
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
}
