package DaoImpl;

import Conexion.Conexion;
import Dao.ProductoDao;
import Entidad.Producto;
import Entidad.Seccion;
import Entidad.Unidad_Medida;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductoDaoImpl implements ProductoDao {
//    ConexionPostgres cn = new ConexionPostgres();

    Conexion cn = Conexion.getInstance();

    @Override
    public boolean agregarProducto(Producto producto) {
        boolean flat = false;
        Statement st = null;
        String query = "INSERT INTO producto( id_producto, cantidad, codigo, fecha_ven, estado, composicion,"
                + " id_seccion, id_unidad_medida, nombre_producto)"
                + " VALUES ((select nextval('sec_id_producto'))," + producto.getCantidad() + ",'" + producto.getCodigo() + "',"
                + "'" + producto.getFecha_ven() + "','1','" + producto.getComposicion() + "'," + producto.getId_seccion() + ", "
                + "" + producto.getId_unidad_medida() + ",'" + producto.getNombre_producto() + "');";
        System.out.println(query);
        try {
            st = cn.conexion().createStatement();
            st.executeUpdate(query);
            cn.conexion().getAutoCommit();
            cn.conexion().close();
            flat = true;
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
            flat = false;

        }
        return flat;
    }

    @Override
    public boolean actualizarProducto(Producto producto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarProducto(int id_producto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Producto> listarProducto(String buscar) {
        List<Producto> lista = null;
        String query = "SELECT pro.id_producto,"
                + " pro.nombre_producto, "
                + " pro.cantidad, "
                + " uni.id_unidad_medida,"
                + " sec.id_seccion "
                + " FROM producto pro,seccion sec,unidad_medida uni "
                + " WHERE pro.id_seccion = sec.id_seccion and "
                + " pro.id_unidad_medida = uni.id_unidad_medida and "
                + " upper(pro.nombre_producto) like upper('%"+buscar+"%')";
        Statement st = null;
        ResultSet rs = null;
        Producto pro = null;
        try {
            lista = new ArrayList<>();
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                pro = new Producto();
                pro.setId_producto(rs.getInt("id_producto"));
                pro.setNombre_producto(rs.getString("nombre_producto"));
                pro.setCantidad(rs.getInt("cantidad"));
                pro.setId_unidad_medida(rs.getInt("id_unidad_medida"));
                pro.setId_seccion(rs.getInt("id_seccion"));
                lista.add(pro);
            }
        } catch (Exception e) {
            System.out.println("ERRROR:" + e.getMessage());
            e.printStackTrace();
            System.out.println("ERRRO: " + query);
        }

        return lista;
    }

    @Override
    public List<Producto> filtrarProducto(String nombre_producto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public long contarProducto(int nombre_producto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Unidad_Medida> listaruni_med() {
        List<Unidad_Medida> lista = null;
        String query = "SELECT id_unidad_medida, nombre_unida_med, abreviatura FROM unidad_medida";
        Statement st = null;
        ResultSet rs = null;
        Unidad_Medida uni = null;
        try {
            lista = new ArrayList<>();
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                uni = new Unidad_Medida();
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

    @Override
    public List<Seccion> listarseccion() {
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
