package Entidad;


public class Comprobante {
    private int id_comprobante;
    private String nombre_comprobante;
    private String abreviatura;
    private int estado;

    public Comprobante() {
    }

    public int getId_comprobante() {
        return id_comprobante;
    }

    public void setId_comprobante(int id_comprobante) {
        this.id_comprobante = id_comprobante;
    }

    public String getNombre_comprobante() {
        return nombre_comprobante;
    }

    public void setNombre_comprobante(String nombre_comprobante) {
        this.nombre_comprobante = nombre_comprobante;
    }

    public String getAbreviatura() {
        return abreviatura;
    }

    public void setAbreviatura(String abreviatura) {
        this.abreviatura = abreviatura;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
}
