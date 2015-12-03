package DaoImpl;

import Conexion.Conexion;
import Dao.UnidadDao;
import Entidad.Unidad;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class UnidadDaoImpl implements UnidadDao{

    Conexion cn = Conexion.getInstance();
    
    @Override
    public boolean agregarUnidad(Unidad unidad) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarUnidad(Unidad unidad) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarUnidad(int id_unidad) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Unidad> listarUnidad() {
        List<Unidad> lista = null;
        String query = "SELECT id_unidad, nombre_unidad, abreviatura, estado FROM unidad";
        Statement st = null;
        ResultSet rs = null;
        Unidad unidad = null;
        try {
            lista = new ArrayList<>();
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                unidad = new Unidad();
                unidad.setId_unidad(rs.getString("id_unidad"));
                unidad.setNombre_unidad(rs.getString("nombre_unidad"));
                unidad.setAbreviatura(rs.getString("abreviatura"));
                unidad.setEstado(rs.getString("estado"));
                lista.add(unidad);
            }
        } catch (Exception e) {
            System.out.println("ERRROR:" + e.getMessage());
            e.printStackTrace();
            System.out.println("ERRROR: " + query);
            
        }

        return lista;
    }
    
}
