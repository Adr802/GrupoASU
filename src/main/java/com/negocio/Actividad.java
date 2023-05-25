package com.negocio;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import com.datos.*;

import java.io.*;
import java.nio.file.Files;

public class Actividad {
	private int id;
	private String nombre;
	private String Descripcion;
	private String path;
	private byte[] img;


	public Actividad() {

	}
	
	public Actividad(int cod, String nom, String des) {
		this.id = cod;
		this.nombre = nom;
		this.Descripcion = des;
	}
	
	public String mostrarIndex() throws SQLException {
		String sql="SELECT * FROM tb_informacion";
		String act="SELECT * FROM tb_actividades";
		Conexion con=new Conexion();
		String tabla="";
		ResultSet rs=null;
		rs=con.Consulta(sql);
		try {
			while(rs.next())
			{
				tabla+="<div class=\"contenido\">"
						+ "<img alt=\"\" src=\"img/misionero1.png\" class=\"imgInicio\">"
						+ "<div>"
						+ "	<p>Descripcion</p>"
						+ "	<p>" + rs.getString(2) + "</p></div></div>"
						+ "<div class=\"contenido\">"
						+ "<div>"
						+ "<p>Historia</p>"
						+ "<p>" + rs.getString(3) + "</p></div>"
						+ "	<img alt=\"\" src=\"img/misionero2.png\" class=\"imgInicio\">"
						+ "	</div>"
						+ "<div class=\"contenido\">"
						+ "<div class=\"act-box\">"
						+ "<p>Actividades</p>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		rs = con.Consulta(act);
		tabla+="<ul>";
		while(rs.next()) {
			tabla+="<li>" + rs.getString(2) + "</li>";
		}
		tabla+="</ul></div>"
				+ "<div class=\"act-box\">"
				+ "	<p>Horarios</p>"
				+ "	<ul>"
				+ "	<li>Sábados. 17:00-18:00</li>"
				+ " </ul>"
				+ "	</div>"
				+ "</div>";
		
		return tabla;
	}
	
	public String mostrarActividades() throws IOException{
		String sentencia="SELECT * FROM tb_actividades";
		Conexion con=new Conexion();
		ResultSet rs=null;
		rs=con.Consulta(sentencia);
		String resul = "<div id = \"tabla-Actividad\" ><table>";

		File ruta = new File("D:\\OneDrive - Universidad Politecnica Salesiana\\Universidad\\Nivel 5\\Programacion Web\\programas-eclipse\\examen\\src\\main\\webapp\\temporales"); 
		File tempFile;
		FileOutputStream fos;
		int cont=0;


		try {
			while(rs.next())
			{
				tempFile = new File(ruta+"\\imgEvento"+cont+".jpg");
				fos = new FileOutputStream(tempFile);
				byte[] foto = rs.getBytes("img_byte");
				fos.write(foto); 
				fos.close();
				
				resul+="<tr>"
						+ "<td>"
						+ "<p id=\"titulo-act\">" + rs.getString(2) + "</p>"
						+ "<p>" + rs.getString(3) + "</p>"
						+ "</td>"
						+ "<td>"
						
						+ "<img src='temporales/imgEvento"+cont+".jpg' alt='Imagen de la actividad' width='150px' height='auto' class=\"imgInicio\">"
						+ "</td>"
						+"</tr>";
				cont++;
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

	
	
	public boolean agregarActividad(String nombre,String desc, String img)
	{
		img = "D:\\OneDrive - Universidad Politecnica Salesiana\\Universidad\\Nivel 5\\Programacion Web\\programas-eclipse\\examen\\src\\main\\webapp\\examen\\img\\aceptar.png";
		String result = "";
		Conexion con = new Conexion();
		PreparedStatement pr = null;
		String sql = "INSERT INTO tb_actividades (nombre_act, descripcion_act, img_act, img_data) VALUES (?, ?, ?, ?)";
		File imageFile = new File(img);
	
		System.out.println(imageFile.toPath());
		try {
		    byte[] imageData = Files.readAllBytes(imageFile.toPath());
		    pr = con.getConexion().prepareStatement(sql);
		    pr.setString(1, nombre);
		    pr.setString(2, desc);
		    pr.setString(3, img);
		    pr.setBytes(4, imageData);
		    this.setImg(imageData);
		    if (pr.executeUpdate() == 1) {
		        result = "Inserción correcta";
		    } else {
		        result = "Error en inserción";
		    }
		} catch (IOException | SQLException e) {
		    e.printStackTrace();
		} finally {
		    try {
		        if (pr != null) {
		            pr.close();
		        }
		        con.getConexion().close();
		    } catch (Exception ex) {
		        System.out.print(ex.getMessage());
		    }
		}

		System.out.println(img);
				
		return true;
	}
	
	public byte[] getImg() {
		return img;
	}
	public void setImg(byte[] img) {
		this.img = img;
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
