package Entidad;


public class Salida_Servicio {
    private int id_sevicio;
    private int id_salida;
    private int precio;
    private int cantidad;

    public Salida_Servicio() {
    }

    public int getId_sevicio() {
        return id_sevicio;
    }

    public void setId_sevicio(int id_sevicio) {
        this.id_sevicio = id_sevicio;
    }

    public int getId_salida() {
        return id_salida;
    }

    public void setId_salida(int id_salida) {
        this.id_salida = id_salida;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}
