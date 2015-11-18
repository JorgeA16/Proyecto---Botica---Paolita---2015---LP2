package DaoImpl;

import Conexion.Conexion;
import Dao.UsuarioDao;
import Entidad.Usuario;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class UsuarioDaoImpl implements UsuarioDao{
//    ConexionPostgres cn = new ConexionPostgres();
    Conexion cn = Conexion.getInstance();

    @Override
    public boolean agregarUsuario(Usuario usuario) {
        boolean flat = false;
        Statement st = null;
        String query = "INSERT INTO usuario VALUES ("+usuario.getId_usuario()+
                                                   ",'"+usuario.getUsuario()+
                                                   "','"+usuario.getContraseña()+
                                                   "','"+usuario.getRol()+"',1)";
        try {
            st = cn.conexion().createStatement();
            st.executeQuery(query);
            cn.conexion().getAutoCommit();
            cn.conexion().close();
            flat = true;
        } catch (Exception e) {
            System.out.println("ERROR: "+e.getMessage());
        }try {
            cn.conexion().rollback();
            cn.conexion().close();
        } catch (Exception e) {
        }finally{
            if (cn.conexion() !=null)
                try {
                    cn.restablecer();
//                    cn.cerrar();
                } catch (Exception e) {
                }
        }
        return flat;
    }

    @Override
    public boolean actualizarUsuario(Usuario usuario) {
        boolean flat = false;
        Statement st = null;
        String query = "UPDATE usuario SET usuario = '"+usuario.getUsuario()+
                                                      "','"+usuario.getContraseña()+
                                                      "','"+usuario.getRol()+"','"+usuario.getEstado()+
                                                      "', WHERE id_usuario = "+usuario.getId_usuario()+"";
        try {
            st = cn.conexion().createStatement();
            st.executeUpdate(query);
            cn.guardar();
//            cn.cerrar();
            flat = true;
        } catch (Exception e) {
            System.out.println("ERROR: "+e.getMessage());
            cn.restablecer();
//            cn.cerrar();
        }finally{
            if (cn.conexion() != null) {
//                cn.cerrar();
            }
        }
        return flat;
    }

    @Override
    public boolean eliminarUsuario(int id_usuario) {
        boolean flat = false;
        Statement st = null;
        String query = "DELETE FROM usuario WHERE id_usuario = "+id_usuario+";";
        try {
            st = cn.conexion().createStatement();
            st.executeUpdate(query);
            cn.guardar();
//            cn.cerrar();
        } catch (Exception e) {
            System.out.println("ERROR: "+e.getMessage());
            cn.restablecer();
//            cn.cerrar();
        }finally{
            if (cn.conexion() != null) {
//                cn.cerrar();
            }
        }
        return flat;
    }

    @Override
    public List<Usuario> listarUsuario() {
        List<Usuario> Lista = null;
        Statement st = null;
        ResultSet rs = null;
        Usuario usuario = null;
        String query = "SELECT id_usuario, usuario, contraseña, rol, estado FROM usuario";
        try {
            Lista = new ArrayList<>();
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
//            cn.cerrar();
            while(rs.next()){
                usuario = new Usuario();
                usuario.setId_usuario(rs.getInt("id_usuario"));
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setContraseña(rs.getString("contraseña"));
                usuario.setRol(rs.getString("rol"));
                usuario.setEstado(rs.getInt("estado"));
                Lista.add(usuario);
            }
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
            e.printStackTrace();
        }finally{
            if (cn.conexion() != null) {
//                cn.cerrar();
            }
        }
        return Lista;
    }

    @Override
    public Usuario validarUsuario(String usuario, String contraseña) {
        Usuario u = null;
        String query = "select * from usuario where usuario = '"+usuario+"' and contraseña = '"+contraseña+"'";
        Statement st;
        ResultSet rs;
        try {
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
            u = new Usuario();
            while (rs.next()) {                
                u.setId_usuario(rs.getInt("id_usuario"));
                u.setUsuario(rs.getString("usuario"));
                u.setContraseña(rs.getString("contraseña"));
                u.setRol(rs.getString("rol"));
                u.setEstado(rs.getShort("estado"));
//                cn.cerrar();
            }
        } catch (Exception e) {
            System.out.println("ERROR: "+e.getMessage());
//            cn.cerrar();
        }finally{
            if (cn.conexion() != null) {
//                cn.cerrar();
            }
        }
        return u;
    }
}
