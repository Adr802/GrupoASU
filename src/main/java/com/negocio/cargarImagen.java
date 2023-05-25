package com.negocio;

import com.datos.*;

import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/cargarImagen")
@MultipartConfig
public class cargarImagen extends HttpServlet{
	
	// CARGAR TODOS LOS DATOS 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InputStream inputStream = null;
        Conexion con=new Conexion();
        PreparedStatement pr=null;

        try {
            // Obtén el archivo seleccionado desde el campo de carga de archivos
            Part filePart = request.getPart("foto");
            String descripcion = request.getParameter("txtDesc");
        	String Nombre = request.getParameter("txtNombre");

            // Obtén el nombre del archivo
            String fileName = filePart.getSubmittedFileName();

            // Obtén el contenido del archivo como un InputStream
            inputStream = filePart.getInputStream();

            // Prepara la sentencia SQL para la inserción
            String sql = "INSERT INTO tb_actividades (nombre_act, descripcion_act, img_act, img_byte)"
            		+ "	VALUES (?, ?, ?, ?)";
            pr=con.getConexion().prepareStatement(sql);

            // Lee el contenido de la imagen en un arreglo de bytes
            byte[] imageBytes = inputStream.readAllBytes();
            pr.setString(1, Nombre);
			pr.setString(2, descripcion);
			pr.setString(3, "a");
            pr.setBytes(4, imageBytes);
            
            if(pr.executeUpdate()==1)
			{
				System.out.println("Insercion Correcta");
			}
			else
			{
				System.out.println("Insercion Incorrecta");
			}
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/agregarAct.jsp");
    }
}