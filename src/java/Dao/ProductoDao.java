package Dao;

import Entidad.Producto;
import Entidad.Seccion;
import Entidad.UnidadMedida;
import java.util.List;


public interface ProductoDao {
    public boolean agregarProducto(Producto producto);
    public boolean actualizarProducto(Producto producto);
    public boolean eliminarProducto(int id_producto);
    public List<Producto> listarProducto(String buscar);
    public List<Producto> listarProductoVista(String buscar);
    public List<Producto> filtrarProducto(String nombre_producto);
    public Producto DatosProducto_edit(String id_producto);
    public long contarProducto(int nombre_producto);
    public Producto buscarProductoID(int id_producto);
    public List<Producto> listarProductoFecha(String fecha1, String fecha2);
    public List<Producto> listarProductoDetalle(String buscar);
}
