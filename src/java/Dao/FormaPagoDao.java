package Dao;

import Entidad.FormaPago;
import java.util.List;


public interface FormaPagoDao {
    public boolean agregarFormaPago(FormaPago formapago);
    public boolean actualizarFormaPago(FormaPago formapago);
    public boolean eliminarFormaPago(int id_forma_pago);
    public List<FormaPago> listarFormaPago();
}
