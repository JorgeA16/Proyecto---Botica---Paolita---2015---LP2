package Entidad;


public class SalidaDetalle {
    private int id_lote_interno;
    private int id_salida;
    private int cantidad;
    private int precio;
    private int cantidad_uni;
    private int orden;
    private int id_unidad;
    private int descuento;

    public SalidaDetalle() {
    }

    public int getId_lote_interno() {
        return id_lote_interno;
    }

    public void setId_lote_interno(int id_lote_interno) {
        this.id_lote_interno = id_lote_interno;
    }

    public int getId_salida() {
        return id_salida;
    }

    public void setId_salida(int id_salida) {
        this.id_salida = id_salida;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getCantidad_uni() {
        return cantidad_uni;
    }

    public void setCantidad_uni(int cantidad_uni) {
        this.cantidad_uni = cantidad_uni;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

    public int getId_unidad() {
        return id_unidad;
    }

    public void setId_unidad(int id_unidad) {
        this.id_unidad = id_unidad;
    }

    public int getDescuento() {
        return descuento;
    }

    public void setDescuento(int descuento) {
        this.descuento = descuento;
    }
}
