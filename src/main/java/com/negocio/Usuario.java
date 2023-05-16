package com.negocio;

import java.sql.ResultSet;
import com.datos.*;

public class Usuario {

	private String nombre;
	private String direccion;
	private String login;
	private String clave;
	private Integer perfil;

	public Usuario() {

	}
	public boolean verificarUsuario(String nlogin, String nclave) {
		boolean respuesta=false;
		String sentencia= "Select * from tb_usuario where correo_us='"+nlogin+
				"' and clave_us='"+nclave+"';";
		//System.out.print(sentencia);
		try
		{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
			if(rs.next())
			{
				respuesta=true;
				this.setLogin(nlogin);
				this.setClave(nclave);
				this.setPerfil(rs.getInt(6));
				this.setNombre(rs.getString(2));
			}
			else
			{
				respuesta=false;
				rs.close();
			}
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return respuesta;
	}
	
	public boolean verificarExistencia(String ced) {
		boolean resp=true;
		String sentencia= "Select cedula_us from tb_usuario";
		try
		{
			ResultSet rs;
			Conexion clsCon=new Conexion();
			rs=clsCon.Consulta(sentencia);
			while(rs.next())
			{
				System.out.println(rs.getString(1));
				if(ced.equals(rs.getString(1))) {
					resp=false;
				}
			}
		}
		catch(Exception ex)
		{
			System.out.println( ex.getMessage());
		}
		return resp;
	}
	
	public void insertarUsuario(String nombre, String ced, String usuario, String clave, String edad, String correo, String direccion) {
		String sentencia="INSERT INTO public.tb_usuario(\r\n"
				+ "nombre_us, cedula_us, username_us, clave_us, edad_us, id_per, correo_us, direccion_us) "
				+ "values(" +"'"+ nombre + "',"
						+"'"+ced +"',"
						+"'"+usuario+"',"
						+"'"+clave+"',"
						+edad+","
						+"2,"
						+"'"+correo+"',"
						+"'"+direccion+"'"
						+ ");";
		Conexion clsCon=new Conexion();
		String resu = clsCon.Ejecutar(sentencia);
		System.out.println(resu);
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getClave() {
		return clave;
	}
	public void setClave(String clave) {
		this.clave = clave;
	}
	public Integer getPerfil() {
		return perfil;
	}
	public void setPerfil(Integer perfil) {
		this.perfil = perfil;
	}
	
	
}
