package com.negocio;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.datos.*;

public class Pagina {

	private String nombre;
	private String path;

	public Pagina() {

	}

	public String mostrarMenu(int nperfil) {
		{
			Conexion con = new Conexion();
			ResultSet rs=null;
			String sql="Select * from tb_perfil;";
			String menu="";
				
			try
			{
				rs=con.Consulta(sql);
				while(rs.next())
				{
					if(nperfil == rs.getInt(1)) {
						menu+="<p class=\"puser\">Menu de " + rs.getString(2)+"</p>";
					}
				}
			}
			catch(SQLException e)
			{
				System.out.print(e.getMessage());
			}
			
			menu+="<nav class=\"menu>\">";
			sql="	SELECT * FROM tb_pagina pag, tb_perfil per, \"tb_perfilPagina\" pper WHERE pag.id_pag=pper.id_pag AND pper.id_per=per.id_per AND pper.id_per="+nperfil+";";

			try
			{
				rs=con.Consulta(sql);
				while(rs.next())
				{
					menu+="<a href=\""+rs.getString(3)+"\"accesskey="+rs.getInt(1)+">"+rs.getString(2)+
					"</a>";
				}
			}
			catch(SQLException e)
			{
				System.out.print(e.getMessage());
			}
			menu+="</nav>";
			return menu;
		}

	}


	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}


}
