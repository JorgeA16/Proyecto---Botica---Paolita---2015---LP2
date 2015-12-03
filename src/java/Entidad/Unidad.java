package Entidad;


public class Unidad {
    private String id_unidad;
    private String nombre_unidad;
    private String abreviatura;
    private String estado;

    public Unidad() {
    }

    public String getId_unidad() {
        return id_unidad;
    }

    public void setId_unidad(String id_unidad) {
        this.id_unidad = id_unidad;
    }

    public String getNombre_unidad() {
        return nombre_unidad;
    }

    public void setNombre_unidad(String nombre_unidad) {
        this.nombre_unidad = nombre_unidad;
    }

    public String getAbreviatura() {
        return abreviatura;
    }

    public void setAbreviatura(String abreviatura) {
        this.abreviatura = abreviatura;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
