package Dao;

import Entidad.Persona;
import java.util.List;


public interface PersonaDao {
    public boolean agregarPersona(Persona persona);
    public List<Persona> listarPersona();
    public boolean actualizarPersona(Persona persona);
    public Persona buscarPersonaId(int id_persona);
    public boolean eliminarPersona(int id_persona);
}
