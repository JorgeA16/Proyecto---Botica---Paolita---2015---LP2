package DaoImpl;

import Conexion.ConexionPostgres;
import Dao.PersonaDao;
import Entidad.Persona;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class PersonaDaoImpl implements PersonaDao{
    
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
    public boolean agregarPersona(Persona persona) {
        boolean flat = false;
        Statement st = null;
        String query = "Insert into persona values ('"+persona.getId_persona()+"','"+persona.getNombre()+"','"+persona.getApepat()+
                                                        "','"+persona.getApemat()+"','"+persona.getCelular()+
                                                        "','"+persona.getDni()+"','"+persona.getSexo()+
                                                        "')";
        try {
            st = conexion().createStatement();
            st.executeUpdate(query);
            conexion().setAutoCommit(false);
            guardar();
            cerrar();
            flat = true;
        } catch (Exception e) {
            System.out.println("Error : "+e.getMessage());
            e.printStackTrace();
            flat = true;
            try {
            restablecer();
            cerrar();
            } catch (Exception ex) {
            }
        }finally{
            if (conexion() != null) {
                try {
                    restablecer();
                    cerrar();
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
            st = conexion().createStatement();
            rs = st.executeQuery(query);
            cerrar();
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
                cerrar();
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
            st = conexion().createStatement();
            st.executeUpdate(query);
            guardar();
            cerrar();
            flat = true;
        } catch (Exception e) {
            restablecer();
            cerrar();
            System.out.println("ERROR: "+e.getMessage());
        }finally{
            if (conexion() != null) {
                cerrar();
            }
        }
        return flat;
    }

    @Override
    public Persona buscarPersonaId(long id_persona) {
        Persona persona = null;
        String query = "SELECT * FROM persona WHERE id_persona = "+id_persona;
        Statement st = null;
        ResultSet rs = null;
        try {
            st = conexion().createStatement();
            rs = st.executeQuery(query);
            cerrar();
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
                cerrar();
            } catch (Exception ex) {
                System.out.println("ERROR: "+e.getMessage());
                ex.printStackTrace();
            }finally{
                if (conexion() != null) {
                    cerrar();
                }
            }
        }
        return persona;
    }

    @Override
    public boolean eliminarPersona(long id_persona) {
        boolean flat = false;
        Statement st = null;
        String query = "DELETE FROM persona WHERE id_persona="+id_persona+";";
        try {
            st = conexion().createStatement();
            st.executeUpdate(query);
            guardar();
            cerrar();
            flat = true;
        } catch (Exception e) {
            restablecer();
            cerrar();
            System.out.println("ERROR: "+e.getMessage());
        }finally{
            if (conexion() != null) {
                cerrar();
            }
        }
        return flat;
    }
    
}