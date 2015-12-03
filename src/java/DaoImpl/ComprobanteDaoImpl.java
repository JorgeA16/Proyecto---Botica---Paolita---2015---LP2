package DaoImpl;

import Conexion.Conexion;
import Dao.ComprobanteDao;
import Entidad.Comprobante;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class ComprobanteDaoImpl implements ComprobanteDao{

    Conexion cn = Conexion.getInstance();
    
    @Override
    public boolean agregarComprobante(Comprobante comprobante) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarComprobante(Comprobante comprobante) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarComprobante(int id_comprobante) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Comprobante> listarComprobante() {
        List<Comprobante> Lista = null;
        Statement st = null;
        ResultSet rs = null;
        Comprobante comprobante = null;
        String query = "Select id_comprobante, nombre_comprobante, abreviatura, estado FROM comprobante";
        try {
            Lista = new ArrayList<>();
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
//            cn.cerrar();
            while (rs.next()) {
                comprobante = new Comprobante();
                comprobante.setId_comprobante(rs.getInt("id_comprobante"));
                comprobante.setNombre_comprobante(rs.getString("nombre_comprobante"));
                comprobante.setAbreviatura(rs.getString("abreviatura"));
                comprobante.setEstado(rs.getInt("estado"));
                Lista.add(comprobante);
            }
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
            try {
//                cn.cerrar();
            } catch (Exception ex) {
            }
        }
        return Lista;
    }
    
}
