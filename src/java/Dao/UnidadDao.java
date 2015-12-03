package Dao;

import Entidad.Unidad;
import java.util.List;


public interface UnidadDao {
    public boolean agregarUnidad(Unidad unidad);
    public boolean actualizarUnidad(Unidad unidad);
    public boolean eliminarUnidad(int id_unidad);
    public List<Unidad> listarUnidad();
}
