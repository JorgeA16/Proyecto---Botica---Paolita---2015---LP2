package DaoImpl;

import Conexion.Conexion;
import Dao.PersonaDao;
import Entidad.Persona;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class PersonaDaoImpl implements PersonaDao{
//    ConexionPostgres cn = new ConexionPostgres();
    Conexion cn = Conexion.getInstance();

    @Override
    public boolean agregarPersona(Persona persona) {
        boolean flat = false;
        Statement st = null;
        String query = "Insert into persona values ('"+persona.getId_persona()+"','"+persona.getNombre()+"','"+persona.getApepat()+
                                                        "','"+persona.getApemat()+"','"+persona.getCelular()+
                                                        "','"+persona.getDni()+"','"+persona.getSexo()+
                                                        "')";
        try {
            st = cn.conexion().createStatement();
            st.executeUpdate(query);
            cn.conexion().setAutoCommit(false);
            cn.guardar();
            flat = true;
        } catch (Exception e) {
            System.out.println("Error : "+e.getMessage());
            e.printStackTrace();
            flat = true;
            try {
            cn.restablecer();
            } catch (Exception ex) {
            }
        }finally{
            if (cn.conexion() != null) {
                try {
                    cn.restablecer();
                } catch (Exception e) {
                }
            }
        }
        return flat;
    }

    @Override
    public List<Persona> listarPersona() {
        List<Persona> Lista = null;
        Statement st = null;
        ResultSet rs = null;
        Persona persona = null;
        String query = "Select id_persona, nombre, apepat, apemat, celular, dni, genero FROM persona";
        try {
            Lista = new ArrayList<>();
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
//            cn.cerrar();
            while (rs.next()) {                
                persona = new Persona();
                persona.setId_persona(rs.getInt("id_persona"));
                persona.setNombre(rs.getString("nombre"));
                persona.setApepat(rs.getString("apepat"));
                persona.setApemat(rs.getString("apemat"));
                persona.setCelular(rs.getInt("celular"));
                persona.setDni(rs.getInt("dni"));
                persona.setSexo(rs.getString("sexo"));
                Lista.add(persona);
            }
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
            e.printStackTrace();
            try {
//                cn.cerrar();
            } catch (Exception ex) {
            }
        }
        return Lista;
    }

    @Override
    public boolean actualizarPersona(Persona persona) {
        boolean flat = false;
        Statement st = null;
        String query = "UPDATE persona SET id_persona= '"+persona.getId_persona()+
                       "', nombre = '"+persona.getNombre()+
                       "', apepat = '"+persona.getApepat()+
                       "', apemat = '"+persona.getApemat()+
                       "', celular = '"+persona.getCelular()+
                       "', dni = '"+persona.getDni()+
                       "', sexo = '"+persona.getSexo()+
                       "' WHERE id_persona = "+persona.getId_persona();
        
        try {
            st = cn.conexion().createStatement();
            st.executeUpdate(query);
            cn.guardar();
//            cn.cerrar();
            flat = true;
        } catch (Exception e) {
            cn.restablecer();
//            cn.cerrar();
            System.out.println("ERROR: "+e.getMessage());
        }finally{
            if (cn.conexion() != null) {
//                cn.cerrar();
            }
        }
        return flat;
    }

    @Override
    public Persona buscarPersonaId(int id_persona) {
        Persona persona = null;
        String query = "SELECT * FROM persona WHERE id_persona = "+id_persona;
        Statement st = null;
        ResultSet rs = null;
        try {
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
//            cn.cerrar();
            if (rs.next()) {
                persona = new Persona();
                persona.setId_persona(rs.getInt("id_persona"));
                persona.setNombre(rs.getString("nombre"));
                persona.setApepat(rs.getString("apepat"));
                persona.setApemat(rs.getString("apemat"));
                persona.setCelular(rs.getInt("celular"));
                persona.setDni(rs.getInt("dni"));
                persona.setSexo(rs.getString("sexo"));
            }
        } catch (Exception e) {
            try {
//                cn.cerrar();
            } catch (Exception ex) {
                System.out.println("ERROR: "+e.getMessage());
                ex.printStackTrace();
            }finally{
                if (cn.conexion() != null) {
//                    cn.cerrar();
                }
            }
        }
        return persona;
    }

    @Override
    public boolean eliminarPersona(int id_persona) {
        boolean flat = false;
        Statement st = null;
        String query = "DELETE FROM persona WHERE id_persona="+id_persona+";";
        try {
            st = cn.conexion().createStatement();
            st.executeUpdate(query);
            cn.guardar();
//            cn.cerrar();
            flat = true;
        } catch (Exception e) {
            cn.restablecer();
//            cn.cerrar();
            System.out.println("ERROR: "+e.getMessage());
        }finally{
            if (cn.conexion() != null) {
//                cn.cerrar();
            }
        }
        return flat;
    }
    
}
