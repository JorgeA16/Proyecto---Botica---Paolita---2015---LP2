package Dao;

import Entidad.Entrada;
import java.util.List;


public interface EntradaDao {
    public String agregarEntrada(Entrada entrada);
    public boolean actualizarEntrada(Entrada entrada);
    public boolean eliminarEntrada(int id_entrada);
    public List<Entrada> listarEntrada();
    public Entrada Datos_entrada(String id_entrada);
}
