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
	
	public String mostrarActividades() {
		String sentencia="SELECT * FROM tb_actividades";
		Conexion con=new Conexion();
		ResultSet rs=null;
		rs=con.Consulta(sentencia);

		String resul = "";
		try {
			while(rs.next())
			{

				resul+="<div class=\"contenido\">"
						+ "<div>"
						+ "<p>" + rs.getString(2) + "</p>"
						+ "<p>" + rs.getString(3) + "</p>"
						+ "</div>"
						+ "<img src=\"" + rs.getString(4) + ".png\" class=\"imgInicio\">"
						+"</div>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
		return resul;
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
