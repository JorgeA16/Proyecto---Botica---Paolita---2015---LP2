package Dao;

import Entidad.SalidaDetalle;
import java.util.List;


public interface SalidaDetalleDao {
    public boolean agregarSalidaDetalle(SalidaDetalle salida_detalle);
    public boolean actualizarSalidaDetalle(SalidaDetalle salida_detalle);
    public boolean eliminarSalidaDetalle(int id_lote_interno);
    public List<SalidaDetalle> listarSalidaDetalle();
}
