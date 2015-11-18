package Dao;

import Entidad.Seccion;
import java.util.List;


public interface SeccionDao {
    public boolean agregarSeccion(Seccion seccion);
    public boolean actualizarSeccion(Seccion seccion);
    public boolean eliminarSeccion(int id_seccion);
    public List<Seccion> listarSeccion();
}
