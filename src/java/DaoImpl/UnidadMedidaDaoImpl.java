package DaoImpl;

import Conexion.Conexion;
import Dao.UnidadMedidaDao;
import Entidad.UnidadMedida;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class UnidadMedidaDaoImpl implements UnidadMedidaDao{
    Conexion cn = Conexion.getInstance();
    
    @Override
    public boolean agregarUnidadMedida(UnidadMedida unimed) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarUnidadMedida(UnidadMedida unimed) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarUnidadMedida(int id_unidad_medida) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<UnidadMedida> listarUnidadMedida() {
        List<UnidadMedida> lista = null;
        String query = "SELECT id_unidad_medida, nombre_unida_med, abreviatura FROM unidad_medida";
        Statement st = null;
        ResultSet rs = null;
        UnidadMedida uni = null;
        try {
            lista = new ArrayList<>();
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                uni = new UnidadMedida();
                uni.setId_unidad_medida(rs.getInt("id_unidad_medida"));
                uni.setNombre_unida_med(rs.getString("nombre_unida_med"));
                uni.setAbreviatura(rs.getString("abreviatura"));
                lista.add(uni);
            }
        } catch (Exception e) {
            System.out.println("ERRROR:" + e.getMessage());
            e.printStackTrace();
            System.out.println("ERRRO: " + query);
            
        }

        return lista;
    }
    
}
