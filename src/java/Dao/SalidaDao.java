package Dao;

import Entidad.Salida;
import java.util.List;


public interface SalidaDao {
    public boolean agregarSalida(Salida salida);
    public boolean actualizarSalida(Salida salida);
    public boolean eliminarSalida(int id_salida);
    public List<Salida> listarSalida();
}
