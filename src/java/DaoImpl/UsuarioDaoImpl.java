/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DaoImpl;

import Conexion.ConexionPostgres;
import Dao.UsuarioDao;
import Entidad.Usuario;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author lenovo
 */
public class UsuarioDaoImpl implements UsuarioDao{
    public Connection conexion(){
        Connection cn = ConexionPostgres.conecta();
        return cn;
    }
    
    public void cerrar(){
        try {
            ConexionPostgres.conecta();
            
        } catch (Exception e) {
        }
    }
    
    public void guardar(){
        try {
            ConexionPostgres.conecta().commit();
        } catch (Exception e) {
        }
    }
    
    public void restablecer(){
        try {
            ConexionPostgres.conecta().rollback();
        } catch (Exception e) {
        }
    }

    @Override
    public boolean agregarUsuario(Usuario usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarUsuario(Usuario usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarUsuario(int id_usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Usuario> listarUsuario() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Usuario validarUsuario(String usuario, String contraseña) {
        Usuario u = null;
        String query = "select * from usuario where usuario = '"+usuario+"' and contraseña = '"+contraseña+"'";
        Statement st;
        ResultSet rs;
        try {
            st = conexion().createStatement();
            rs = st.executeQuery(query);
            u = new Usuario();
            while (rs.next()) {                
                u.setId_usuario(rs.getInt("id_usuario"));
                u.setUsuario(rs.getString("usuario"));
                u.setContraseña(rs.getString("contraseña"));
                u.setRol(rs.getString("rol"));
                u.setEstado(rs.getShort("estado"));
                cerrar();
            }
        } catch (Exception e) {
            System.out.println("ERROR: "+e.getMessage());
            cerrar();
        }finally{
            if (conexion() != null) {
                cerrar();
            }
        }
        return u;
    }
}
