package Dao;

import Entidad.Laboratorio;
import java.util.List;



public interface LaboratorioDao {
    public boolean agregarLaboratorio(Laboratorio laboratorio);
    public boolean actualizarLaboratorio(Laboratorio laboratorio);
    public boolean eliminarLaboratorio(int id_laboratorio);
    public List<Laboratorio> listarLaboratorio();
}
