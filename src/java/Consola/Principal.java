package Consola;

import Dao.PersonaDao;
import Dao.ProductoDao;
import Dao.UsuarioDao;
import DaoImpl.PersonaDaoImpl;
import DaoImpl.ProductoDaoImpl;
import DaoImpl.UsuarioDaoImpl;
import Entidad.Persona;
import Entidad.Producto;
import Entidad.Usuario;
import java.util.List;
import java.util.Scanner;


public class Principal {

    
    public static void main(String[] args) {
        Principal p = new Principal();
        //p.agregarPersona();
        p.mostrarproducto();
        //p.listarPersona();
        //p.actualizarPersona();
        //p.buscarPersonaId();
        //p.eliminarPersona();
        //p.validarUsuario();
    }
    
    public void agregarPersona(){
        PersonaDao dao = new PersonaDaoImpl();
        Persona persona = new Persona();
        
        persona.setId_persona(1);
        persona.setNombre("Marcia");
        persona.setApepat("Herrera");
        persona.setApemat("Ocampo");
        persona.setCelular(952451872);
        persona.setDni(10254896);
        persona.setSexo("F");
        
        if (dao.agregarPersona(persona)) {
            System.out.println("Se Agrego Correctamente");
        } else {
            System.out.println("Error al Agregar");
        }
    }
    
    public void listarPersona(){
        PersonaDao dao = new PersonaDaoImpl();
        List<Persona> lista = dao.listarPersona();
        
        for (Persona p : lista) {
            System.out.println("Id: "+p.getId_persona()+
                               " Nombres: "+p.getNombre()+
                               " Apellido Pat: "+p.getApepat()+
                               " Apellido Mat: "+p.getApemat()+
                               " Celular: "+p.getCelular()+
                               " DNI: "+p.getDni()+
                               " Sexo: "+p.getSexo());
        }
    }
    
    public void actualizarPersona(){
        PersonaDao dao = new PersonaDaoImpl();
        Persona persona = new Persona();
        
        persona = dao.buscarPersonaId(2);
        persona.setNombre("Edwin");
        persona.setApepat("Alcantara");
        persona.setApemat("Garcia");
        persona.setCelular(987654321);
        persona.setDni(79415232);
        persona.setSexo("M");
        
        if (dao.actualizarPersona(persona)) {
            System.out.println("Se Actualizo Correctamente");
        } else {
            System.out.println("Error al Actualizar");
        }
    }
    
    public void buscarPersonaId(){
        PersonaDao dao = new PersonaDaoImpl();
        Persona persona = new Persona();
        persona = dao.buscarPersonaId(2);
        
        if (persona != null) {
            System.out.println("ID: "+persona.getId_persona()+
                               " Nombres: "+persona.getNombre()+
                               " Apellido Pat: "+persona.getApepat()+
                               " Apellido Mat: "+persona.getApemat()+
                               " Celular: "+persona.getCelular()+
                               " DNI: "+persona.getDni()+
                               " Sexo: "+persona.getSexo());
        } else {
            System.out.println("No Existe Persona");
        }
    }
    
    public void eliminarPersona(){
        PersonaDao dao = new PersonaDaoImpl();
        Persona persona = new Persona();
        
        Scanner sc = new Scanner(System.in);
        System.out.println("Ingrese ID de Persona a Eliminar");
        int id = sc.nextInt();
        persona = dao.buscarPersonaId(id);
        persona.setId_persona(id);
        if (dao.eliminarPersona(id)) {
            System.out.println("Se Elimino Correctamente");
        } else {
            System.out.println("Error al Eliminar");
        }
    }
    
    //USUARIO
    public void validarUsuario(){
        UsuarioDao dao = new UsuarioDaoImpl();
        Usuario usuario = new Usuario();
        usuario = dao.validarUsuario("jorge", "123");
        System.out.println("Usuario: "+usuario.getUsuario());
    }
    public void mostrarproducto(){
        ProductoDao dao=new ProductoDaoImpl();
        for (Producto usa :dao.listarProducto("")) {
            
            System.out.println("NOMBRE: "+usa.getNombre_producto());
        }
    
    }
}
