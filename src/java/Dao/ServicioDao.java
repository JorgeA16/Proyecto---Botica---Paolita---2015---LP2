package Dao;

import Entidad.Servicio;
import java.util.List;


public interface ServicioDao {
    public boolean agregarServicio(Servicio servicio);
    public boolean actualizarServicio(Servicio servicio);
    public boolean eliminarServicio(int id_servicio);
    public List<Servicio> listarServicio();
}
