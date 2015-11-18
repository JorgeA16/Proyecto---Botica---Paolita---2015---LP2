package Dao;

import Entidad.Usuario;
import java.util.List;


public interface UsuarioDao {
    public boolean agregarUsuario(Usuario usuario);
    public boolean actualizarUsuario(Usuario usuario);
    public boolean eliminarUsuario(int id_usuario);
    public List<Usuario> listarUsuario();
    public Usuario validarUsuario(String usuario, String contraseña);
}
