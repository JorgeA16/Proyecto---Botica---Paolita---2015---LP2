package DaoImpl;

import Conexion.Conexion;
import Dao.ProductoDao;
import Entidad.Producto;
import Entidad.Seccion;
import Entidad.UnidadMedida;
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
        String query = "INSERT INTO producto(id_producto, cantidad, codigo, fecha_ven, estado, composicion,"
                + " id_seccion, id_unidad_medida, nombre_producto)"
                + " VALUES ((select nextval('sec_id_producto'))," + producto.getCantidad() + ","
                + " '" + producto.getCodigo() + "',"
                + " to_date('" + producto.getFecha_ven() + "','yyyy-mm-dd'),'1','" + producto.getComposicion() + "',"
                + " " + producto.getId_seccion() + ", "
                + "" + producto.getId_unidad_medida() + ","
                + " '" + producto.getNombre_producto() + "');";
//        System.out.println(query);
        try {
            st = cn.conexion().createStatement();
            st.executeUpdate(query);
            cn.conexion().getAutoCommit();
//            cn.conexion().close();
            flat = true;
            System.out.println("err" + query);
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
            flat = false;
        }
        return flat;
    }

    @Override
    public boolean actualizarProducto(Producto producto) {
        boolean flat = false;
        Statement st = null;
        String query = "UPDATE producto SET "
                + " cantidad = " + producto.getCantidad()
                + ", codigo = '" + producto.getCodigo()
                + "', fecha_ven=to_date('" + producto.getFecha_ven() + "','yyyy-mm-dd') "
                + ", estado = " + producto.getEstado()
                + ", composicion = '" + producto.getComposicion()
                + "', id_seccion = " + producto.getId_seccion()
                + ", id_unidad_medida = " + producto.getId_unidad_medida()
                + ", nombre_producto = '" + producto.getNombre_producto()
                + "' WHERE id_producto = " + producto.getId_producto();
        System.out.print(query);
        try {
            st = cn.conexion().createStatement();
            st.executeUpdate(query);
            cn.guardar();
//            cn.cerrar();
            flat = true;
        } catch (Exception e) {
            cn.restablecer();
//          cn.cerrar();
            System.out.println("ERROR: " + e.getMessage());
        } finally {
            if (cn.conexion() != null) {
//                      cn.cerrar();
            }
        }
        return flat;
    }

    @Override
    public boolean eliminarProducto(int id_producto) {
        boolean flat = false;

        Statement st = null;
        String query = "DELETE FROM producto WHERE id_producto= " + id_producto + "";
        try {
            st = cn.conexion().createStatement();
            st.executeUpdate(query);
            cn.guardar();
//            cn.cerrar();
            flat = true;
        } catch (Exception e) {
            cn.restablecer();
//                cn.cerrar();
            System.out.println("ERROR: " + e.getMessage());
        }
        return flat;
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
                + " upper(pro.nombre_producto) like upper('%" + buscar + "%')";
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
    public List<Producto> listarProductoVista(String buscar) {
        List<Producto> lista = null;
        String query = "SELECT * "
                + " FROM vista_producto "
                + " WHERE upper(nombre_producto) like upper('%" + buscar + "%')";
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
                pro.setAbreviatura(rs.getString("abreviatura"));
                pro.setFecha_ven(rs.getString("fecha_ven"));
                pro.setNombre_categoria(rs.getString("nombre_categoria"));
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
    public Producto DatosProducto_edit(String id_producto) {
        String query = "SELECT * "
                + " FROM producto  "
                + " WHERE id_producto=" + id_producto;
        Statement st = null;
        ResultSet rs = null;
        Producto pro = null;
        try {
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
            rs.next();
            pro = new Producto();
            pro.setId_producto(rs.getInt("id_producto"));
            pro.setNombre_producto(rs.getString("nombre_producto"));
            pro.setCantidad(rs.getInt("cantidad"));
            pro.setId_unidad_medida(rs.getInt("id_unidad_medida"));
            pro.setFecha_ven(rs.getString("fecha_ven"));
            pro.setId_seccion(rs.getInt("id_seccion"));

        } catch (Exception e) {
            System.out.println("ERRROR:" + e.getMessage());
            e.printStackTrace();
            System.out.println("ERRRO: " + query);
        }

        return pro;
    }

    @Override
    public List<Producto> filtrarProducto(String nombre_producto) {
        List<Producto> lista = null;
        String query = "SELECT pro.id_producto,"
                + " pro.nombre_producto, "
                + " pro.cantidad, "
                + " uni.id_unidad_medida,"
                + " sec.id_seccion "
                + " FROM producto pro,seccion sec,unidad_medida uni "
                + " WHERE pro.id_seccion = sec.id_seccion and "
                + " pro.id_unidad_medida = uni.id_unidad_medida and "
                + " upper(pro.nombre_producto) like upper('%" + nombre_producto + "%')";
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
    public long contarProducto(int nombre_producto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Producto buscarProductoID(int id_producto) {
        Producto producto = null;
        String query = "select * from Producto "
                + "where id_producto = '" + id_producto + "' ";
        Statement st = null;
        ResultSet rs = null;
        try {
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
//            cn.cerrar();
            if (rs.next()) {
                producto = new Producto();
                producto.setId_producto(rs.getInt("id_producto"));
                producto.setCantidad(rs.getInt("cantidad"));
                producto.setCodigo(rs.getInt("codigo"));
                producto.setFecha_ven(rs.getString("fecha_ven"));
                producto.setEstado(rs.getInt("estado"));
                producto.setComposicion(rs.getString("composicion"));
                producto.setId_seccion(rs.getInt("id_seccion"));
                producto.setId_unidad_medida(rs.getInt("id_unidad_medida"));
                producto.setNombre_producto(rs.getString("nombre_producto"));
            }
        } catch (Exception e) {
            try {
//                cn.cerrar();
            } catch (Exception ex) {
                System.out.println("ERROR: " + e.getMessage());
                ex.printStackTrace();
            } finally {
                if (cn.conexion() != null) {
//                    cn.cerrar();
                }
            }
        }

        return producto;
    }

    @Override
    public List<Producto> listarProductoFecha(String fecha1, String fecha2) {
        List<Producto> lista = null;
        String query = "select "
                + "pro.id_producto,"
                + "pro.cantidad,"
                + "pro.nombre_producto, "
                + "pro.fecha_ven, "
                + "cat.nombre_categoria, "
                + "uni.abreviatura "
                + "from "
                + "producto pro, "
                + "unidad_medida uni, "
                + "seccion sec, "
                + "categoria cat "
                + "where "
                + "pro.id_unidad_medida = uni.id_unidad_medida and "
                + "sec.id_seccion = pro.id_seccion and "
                + "sec.id_categoria = cat.id_categoria and "
                + "pro.fecha_ven between cast ('%"+fecha1+"%' as date) and cast ('%"+fecha2+"%' as date) "
                + "order by pro.fecha_ven";
        Statement st = null;
        ResultSet rs = null;
        Producto pro = null;
        System.out.println(query);
        try {
            lista = new ArrayList<>();
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                pro = new Producto();
                pro.setId_producto(rs.getInt("id_producto"));
                pro.setNombre_producto(rs.getString("nombre_producto"));
                pro.setFecha_ven(rs.getString("fecha_ven"));
                pro.setCantidad(rs.getInt("cantidad"));
                pro.setAbreviatura(rs.getString("abreviatura"));
                pro.setNombre_categoria(rs.getString("nombre_categoria"));
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
    public List<Producto> listarProductoDetalle(String buscar) {
        List<Producto> lista = null;
        String query = "SELECT pro.id_producto,"
                + " pro.nombre_producto, "
                + " pro.cantidad, "
                + " uni.id_unidad_medida,"
                + " sec.id_seccion "
                + " FROM producto pro,seccion sec,unidad_medida uni "
                + " WHERE pro.id_seccion = sec.id_seccion and "
                + " pro.id_unidad_medida = uni.id_unidad_medida and "
                + " upper(pro.nombre_producto) like upper('%" + buscar + "%')";
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
}
