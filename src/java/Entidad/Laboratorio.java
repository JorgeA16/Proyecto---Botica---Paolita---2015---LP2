package Entidad;

import java.io.Serializable;


public class Laboratorio implements Serializable{
    private String id_laboratorio;
    private String nombre_laboratorio;
    private String estado;

    public Laboratorio() {
    }

    public String getId_laboratorio() {
        return id_laboratorio;
    }

    public void setId_laboratorio(String id_laboratorio) {
        this.id_laboratorio = id_laboratorio;
    }

    public String getNombre_laboratorio() {
        return nombre_laboratorio;
    }

    public void setNombre_laboratorio(String nombre_laboratorio) {
        this.nombre_laboratorio = nombre_laboratorio;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
