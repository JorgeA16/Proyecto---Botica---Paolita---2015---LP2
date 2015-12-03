package DaoImpl;

import Conexion.Conexion;
import Dao.EntradaDetalleDao;
import Entidad.EntradaDetalle;
import Entidad.Entrada;
import Entidad.Producto;
import Entidad.Unidad;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class EntradaDetalleDaoImpl implements EntradaDetalleDao{

    Conexion cn = Conexion.getInstance();
    
    @Override
    public boolean agregarEntradaDetalle(EntradaDetalle endeta) {
        boolean flat = false;
        Statement st = null;
        String query = "INSERT INTO entrada_detalle(cantidad, precio_compra, fecha_ven, estado,"
                + "stock, id_laboratorio, id_entrada, id_producto, id_unidad, cantidad_uni, lote, "
                + " descuento)"
                + "VALUES ("
                + " "+endeta.getCantidad()+", "
                + " "+endeta.getPrecio_compra()+","
                + " to_date('" + endeta.getFecha_ven()+ "','yyyy-mm-dd'), '1', "
                + " 0, "
                + " "+endeta.getId_laboratorio()+", "
                + " "+endeta.getId_entrada()+", "
                + " "+endeta.getId_producto()+", "
                + " "+endeta.getId_unidad()+", "
                + " "+endeta.getCantidad_uni()+", "
                + " '"+endeta.getLote()+"',"
                + " 0)";
        System.out.println("consulta: " + query);
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
    public boolean actualizarEntradaDetalle(EntradaDetalle entrada_detalle) {
        boolean flat = false;
        Statement st = null;
        String query = "UPDATE entrada_detalle SET "
                + " cantidad = " + entrada_detalle.getCantidad()
                + ", precio_compra = '" + entrada_detalle.getPrecio_compra()
                + "', fecha_ven=to_date('" + entrada_detalle.getFecha_ven() + "','yyyy-mm-dd') "
                + ", id_laboratorio = " + entrada_detalle.getId_laboratorio()
                + ", id_producto = '" + entrada_detalle.getId_producto()
                + "', id_unidad = " + entrada_detalle.getId_unidad()
                + ", cantidad_uni = " + entrada_detalle.getCantidad_uni()
                + ", total = '" + entrada_detalle.getTotal()
                + "' WHERE id_producto = " + entrada_detalle.getId_lote_interno();
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
    public boolean eliminarEntradaDetalle(int id_lote_interno) {
        boolean flat = false;

        Statement st = null;
        String query = "DELETE FROM entrada_detalle WHERE id_lote_interno= " + id_lote_interno + "";
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
    public List<EntradaDetalle> listarEntradaDetalle() {
        List<EntradaDetalle> Lista = null;
        Statement st = null;
        ResultSet rs = null;
        EntradaDetalle endeta = null;
        String query = "Select id_lote_interno, cantidad, precio_compra, fecha_ven, estado,"
                + "stock, id_laboratorio, id_entrada, id_producto, id_unidad, cantidad_uni, lote, descuento, igv, total_compra FROM entrada_detalle";
        try {
            Lista = new ArrayList<>();
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
//            cn.cerrar();
            while (rs.next()) {
                endeta = new EntradaDetalle();
                endeta.setId_lote_interno(rs.getString("id_lote_interno"));
                endeta.setCantidad(rs.getString("cantidad"));
                endeta.setPrecio_compra(rs.getString("precio_compra"));
                endeta.setFecha_ven(rs.getString("fecha_ven"));
                endeta.setEstado(rs.getString("estado"));
                endeta.setStock(rs.getString("stock"));
                endeta.setId_laboratorio(rs.getString("id_laboratorio"));
                endeta.setId_entrada(rs.getString("id_entrada"));
                endeta.setId_producto(rs.getString("id_producto"));
                endeta.setId_unidad(rs.getString("id_unidad"));
                endeta.setCantidad_uni(rs.getString("cantidad_uni"));
                endeta.setLote(rs.getString("lote"));
                endeta.setDescuento(rs.getString("descuento"));
                endeta.setTotal(rs.getString("total_compra"));
                Lista.add(endeta);
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

    @Override
    public boolean agregarProducto(EntradaDetalle producto) {
        boolean flat = false;
        /*Statement st = null;
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
        }*/
        return flat;
    }

    @Override
    public List<EntradaDetalle> listarEntradaDetalles(String id_entrada) {
        List<EntradaDetalle> Lista = null;
        Statement st = null;
        ResultSet rs = null;
        EntradaDetalle end = null;
        String query = "select ente.id_lote_interno, "
                + " pro.nombre_producto, "
                + " case ente.cantidad_uni "
                + " when 1 then unidad.nombre_unidad "
                + " else unidad.nombre_unidad||' x '||ente.cantidad_uni "
                + " end unidad, "
                + " to_char(ente.fecha_ven,'dd/mm/yyyy') fecha_ven, "
                + " ente.cantidad, "
                + " ente.precio_compra, "
                + " ente.cantidad*ente.precio_compra total "
                + " FROM "
                + " entrada_detalle ente, "
                + " producto pro, "
                + " unidad "
                + " WHERE "
                + " pro.id_producto = ente.id_producto AND "
                + " unidad.id_unidad = ente.id_unidad and "
                + " ente.id_entrada="+id_entrada+" "
                + " order by ente.id_lote_interno";
        System.out.println(query);
        try {
            Lista = new ArrayList<>();
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
//            cn.cerrar();
            while (rs.next()) {
                end = new EntradaDetalle();
                end.setId_lote_interno(rs.getString("id_lote_interno"));
                end.setId_producto(rs.getString("nombre_producto"));
                end.setId_unidad(rs.getString("unidad"));
                end.setFecha_ven(rs.getString("fecha_ven"));
                end.setCantidad(rs.getString("cantidad"));
              //  end.setCantidad_uni(rs.getString("cantidad_uni"));
                end.setPrecio_compra(rs.getString("precio_compra"));
                end.setTotal(rs.getString("total"));
                Lista.add(end);
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

    @Override
    public List<EntradaDetalle> listarEntradaFecha(String fecha1, String fecha2) {
        List<EntradaDetalle> lista = null;
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
        EntradaDetalle endeta = null;
        System.out.println(query);
        try {
            lista = new ArrayList<>();
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                endeta = new EntradaDetalle();
                endeta.setId_producto(rs.getString("id_producto"));
                /*endeta.setNombre_producto(rs.getString("nombre_producto"));
                endeta.setFecha_ven(rs.getString("fecha_ven"));
                endeta.setCantidad(rs.getInt("cantidad"));
                endeta.setAbreviatura(rs.getString("abreviatura"));
                endeta.setNombre_categoria(rs.getString("nombre_categoria"));
                lista.add(pro);*/
            }
        } catch (Exception e) {
            System.out.println("ERRROR:" + e.getMessage());
            e.printStackTrace();
            System.out.println("ERRRO: " + query);
        }

        return lista;
    }
    
}
