package Entidad;


public class Entrada_Detalle {
    private int id_lote_interno;
    private int cantidad;
    private int precio_compra;
    private String fecha_ven;
    private int estado;
    private int stock;
    private int id_laboratorio;
    private int id_entrada;
    private int id_producto;
    private int id_unidad;
    private int cantidad_uni;
    private int orden;
    private int lote;

    public Entrada_Detalle() {
    }

    public int getId_lote_interno() {
        return id_lote_interno;
    }

    public void setId_lote_interno(int id_lote_interno) {
        this.id_lote_interno = id_lote_interno;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getPrecio_compra() {
        return precio_compra;
    }

    public void setPrecio_compra(int precio_compra) {
        this.precio_compra = precio_compra;
    }

    public String getFecha_ven() {
        return fecha_ven;
    }

    public void setFecha_ven(String fecha_ven) {
        this.fecha_ven = fecha_ven;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getId_laboratorio() {
        return id_laboratorio;
    }

    public void setId_laboratorio(int id_laboratorio) {
        this.id_laboratorio = id_laboratorio;
    }

    public int getId_entrada() {
        return id_entrada;
    }

    public void setId_entrada(int id_entrada) {
        this.id_entrada = id_entrada;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getId_unidad() {
        return id_unidad;
    }

    public void setId_unidad(int id_unidad) {
        this.id_unidad = id_unidad;
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

    public int getLote() {
        return lote;
    }

    public void setLote(int lote) {
        this.lote = lote;
    }
}
