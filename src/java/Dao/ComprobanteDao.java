package Dao;

import Entidad.Comprobante;
import java.util.List;


public interface ComprobanteDao {
    public boolean agregarComprobante(Comprobante comprobante);
    public boolean actualizarComprobante(Comprobante comprobante);
    public boolean eliminarComprobante(int id_comprobante);
    public List<Comprobante> listarComprobante();
}
