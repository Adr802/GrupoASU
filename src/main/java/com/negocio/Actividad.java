package com.negocio;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.datos.*;

public class Actividad {
	private int id;
	private String nombre;
	private String Descripcion;
	private String path;



	public Actividad() {

	}
	public Actividad(int cod, String nom, String des) {
		this.id = cod;
		this.nombre = nom;
		this.Descripcion = des;
	}
	public String mostrarActividades() {
		String sentencia="SELECT * FROM tb_actividades";
		Conexion con=new Conexion();
		ResultSet rs=null;
		rs=con.Consulta(sentencia);

		String resul = "<div id = \"tabla-Actividad\" ><table>";
		try {
			while(rs.next())
			{

				resul+="<tr>"
						+ "<td>"
						+ "<p id=\"titulo-act\">" + rs.getString(2) + "</p>"
						+ "<p>" + rs.getString(3) + "</p>"
						+ "</td>"
						+ "<td>"
						+ "<img src=\"" + rs.getString(4) + ".png\" class=\"imgInicio\">"
						+ "</td>"
						+"</tr>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resul+="</table></div>";
		return resul;
	}

	public String mostrarEditarActividades() {
		String sql="SELECT * FROM tb_actividades ORDER BY id_act";
		Conexion con=new Conexion();
		String tabla="<table class=\"table table-hover\" id=\"editar-table\"><th>ID Actividad</th><th>Nombre de la actividad</th><th></th><th></th>";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{

				tabla+="<tr><td>"+rs.getInt(1)+"</td>"
						+ "<td>"+rs.getString(2)+"</td>"
						+ "<td> <a href= modificarAct.jsp?cod=" + rs.getInt(1) +"><pre style=\"text-align: center\">Modificar</pre></a></td>"
						+ "<td> <a href= eliminarAct.jsp?cod=" + rs.getInt(1) + " \"><pre style=\"text-align: center\">Eliminar</pre></a></td>"
						+ "</td></tr>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		tabla+="</table>";
		return tabla;
	}

	public void consulEditarActividad(int cod) {
		Conexion obj = new Conexion();
		ResultSet rs = null;
		String sql = "SELECT * FROM tb_actividades where id_act = " + cod;
		try {
			rs=obj.Consulta(sql);
			while(rs.next()) {
				setId(cod);
				setNombre(rs.getString(2));
				setDescripcion(rs.getString(3));
			}
		}catch (Exception e) {
			// TODO: handle exception
		}

	}		

	public boolean updateActividad(Actividad mp) {
		boolean agregado = true;
		Conexion obj = new Conexion();
		String sql="UPDATE public.tb_actividades"
				+ "	SET id_act=" + mp.getId()
				+ ", nombre_act='" + mp.getNombre() + "'"
				+ ", descripcion_act='" + mp.getDescripcion()+ "'"
				+ ", img_act='img/misionero1'"
				+ "	WHERE id_act = " + mp.getId() + ";";
		try {
			obj.Ejecutar(sql);
			agregado = true;
		}catch (Exception e) {
			// TODO: handle exception
			agregado=false;
		}
		return agregado;
	}
	
	
	public boolean eliminarActividad(int cod) {
		boolean f = false;
		Conexion obj = new Conexion();
		String sql="DELETE FROM tb_actividades WHERE id_act='" + cod + "';";
		try {
			obj.Ejecutar(sql);
			f = true;
		}catch (Exception e) {
			// TODO: handle exception
			f=false;
		}
		return f;
	}

	
	
	public boolean agregarActividad(String nombre,String desc)
	{
		Conexion con=new Conexion();
		String sql="INSERT INTO tb_actividades ("
				+ "nombre_act,descripcion_act,img_act) "
				+ "VALUES('" + nombre + "'" 
				+ ",'" +  desc +"'"
				+ ",'img/misionero1')";
		if (con.Ejecutar(sql).equals("Datos insertados")) {
			return true;
		}else {
			return false;
		}
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return Descripcion;
	}

	public void setDescripcion(String descripcion) {
		Descripcion = descripcion;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}
