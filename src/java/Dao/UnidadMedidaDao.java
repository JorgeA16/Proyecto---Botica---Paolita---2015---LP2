package Dao;

import Entidad.UnidadMedida;
import java.util.List;


public interface UnidadMedidaDao {
    public boolean agregarUnidadMedida(UnidadMedida unimed);
    public boolean actualizarUnidadMedida(UnidadMedida unimed);
    public boolean eliminarUnidadMedida(int id_unidad_medida);
    public List<UnidadMedida> listarUnidadMedida();
}
