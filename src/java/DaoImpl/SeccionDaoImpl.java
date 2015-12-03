package DaoImpl;

import Conexion.Conexion;
import Dao.SeccionDao;
import Entidad.Seccion;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class SeccionDaoImpl implements SeccionDao{
    Conexion cn = Conexion.getInstance();
    
    @Override
    public boolean agregarSeccion(Seccion seccion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarSeccion(Seccion seccion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarSeccion(int id_seccion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Seccion> listarSeccion() {
        List<Seccion> lista = null;
        String query = "SELECT id_seccion,nombre_categoria FROM seccion,categoria WHERE  categoria.id_categoria = seccion.id_categoria";
        Statement st = null;
        ResultSet rs = null;
        Seccion seccion = null;
        try {
            lista = new ArrayList<>();
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                seccion = new Seccion();
                seccion.setId_seccion(rs.getInt("id_seccion"));
                seccion.setNombre_categoria(rs.getString("nombre_categoria"));
                lista.add(seccion);
            }
        } catch (Exception e) {
            System.out.println("ERRROR:" + e.getMessage());
            e.printStackTrace();
            System.out.println("ERRRO: " + query);
        }

        return lista;
    }
    
}
