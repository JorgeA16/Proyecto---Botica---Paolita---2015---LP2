package Dao;

import Entidad.Entrada_Detalle;
import java.util.List;


public interface EntradaDetalleDao {
    public boolean agregarEntradaDetalle(Entrada_Detalle entrada_detalle);
    public boolean actualizarEntradaDetalle(Entrada_Detalle entrada_detalle);
    public boolean eliminarEntradaDetalle(int id_lote_interno);
    public List<Entrada_Detalle> listarEntradaDetalle();
}
