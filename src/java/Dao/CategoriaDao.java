package Dao;

import Entidad.Categoria;
import java.util.List;


public interface CategoriaDao {
    public boolean agregarCategoria(Categoria categoria);
    public boolean actualizarCategoria(Categoria categoria);
    public boolean eliminarCategoria(int id_categoria);
    public List<Categoria> listarCategoria();
}
