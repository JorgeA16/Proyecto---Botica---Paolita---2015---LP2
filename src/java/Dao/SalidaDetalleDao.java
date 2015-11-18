package Dao;

import Entidad.Salida_Detalle;
import java.util.List;


public interface SalidaDetalleDao {
    public boolean agregarSalidaDetalle(Salida_Detalle salida_detalle);
    public boolean actualizarSalidaDetalle(Salida_Detalle salida_detalle);
    public boolean eliminarSalidaDetalle(int id_lote_interno);
    public List<Salida_Detalle> listarSalidaDetalle();
}
