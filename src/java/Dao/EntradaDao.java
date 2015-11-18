package Dao;

import Entidad.Entrada;
import java.util.List;


public interface EntradaDao {
    public boolean agregarEntrada(Entrada entrada);
    public boolean actualizarEntrada(Entrada entrada);
    public boolean eliminarEntrada(int id_entrada);
    public List<Entrada> listarEntrada();
}
