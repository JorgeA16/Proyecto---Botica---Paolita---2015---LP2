package Dao;

import Entidad.EntradaDetalle;
import java.util.List;


public interface EntradaDetalleDao {
    public boolean agregarEntradaDetalle(EntradaDetalle entrada_detalle);
    public boolean actualizarEntradaDetalle(EntradaDetalle entrada_detalle);
    public boolean eliminarEntradaDetalle(int id_lote_interno);
    public List<EntradaDetalle> listarEntradaDetalle();
    public boolean agregarProducto(EntradaDetalle producto);
    public List<EntradaDetalle> listarEntradaDetalles(String id_entrada);
    public List<EntradaDetalle> listarEntradaFecha(String fecha1, String fecha2);
}
