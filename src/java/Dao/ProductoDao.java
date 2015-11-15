package Dao;

import Entidad.Producto;
import java.util.List;


public interface ProductoDao {
    public boolean agregarProducto(Producto producto);
    public boolean actualizarProducto(Producto producto);
    public boolean eliminarProducto(int id_producto);
    public List<Producto> listarProducto();
}
