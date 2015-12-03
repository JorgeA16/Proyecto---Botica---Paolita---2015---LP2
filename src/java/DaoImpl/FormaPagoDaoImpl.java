package DaoImpl;

import Conexion.Conexion;
import Dao.FormaPagoDao;
import Entidad.FormaPago;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class FormaPagoDaoImpl implements FormaPagoDao{

    Conexion cn = Conexion.getInstance();
    
    @Override
    public boolean agregarFormaPago(FormaPago formapago) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarFormaPago(FormaPago formapago) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarFormaPago(int id_forma_pago) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<FormaPago> listarFormaPago() {
        List<FormaPago> Lista = null;
        Statement st = null;
        ResultSet rs = null;
        FormaPago formapago = null;
        String query = "Select id_forma_pago, nombre_forma_pago FROM forma_pago";
        try {
            Lista = new ArrayList<>();
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
//            cn.cerrar();
            while (rs.next()) {
                formapago = new FormaPago();
                formapago.setId_forma_pago(rs.getInt("id_forma_pago"));
                formapago.setNombre_forma_pago(rs.getString("nombre_forma_pago"));
                Lista.add(formapago);
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
