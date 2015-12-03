package Entidad;


public class EntradaDetalle {
    private String id_lote_interno;
    private String cantidad;
    private String precio_compra;
    private String fecha_ven;
    private String estado;
    private String stock;
    private String id_laboratorio;
    private String id_entrada;
    private String id_producto;
    private String id_unidad;
    private String cantidad_uni;
    private String lote;
    private String descuento;
     private String total;

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
     

    public EntradaDetalle() {
    }

    public String getId_lote_interno() {
        return id_lote_interno;
    }

    public void setId_lote_interno(String id_lote_interno) {
        this.id_lote_interno = id_lote_interno;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getPrecio_compra() {
        return precio_compra;
    }

    public void setPrecio_compra(String precio_compra) {
        this.precio_compra = precio_compra;
    }

    public String getFecha_ven() {
        return fecha_ven;
    }

    public void setFecha_ven(String fecha_ven) {
        this.fecha_ven = fecha_ven;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getStock() {
        return stock;
    }

    public void setStock(String stock) {
        this.stock = stock;
    }

    public String getId_laboratorio() {
        return id_laboratorio;
    }

    public void setId_laboratorio(String id_laboratorio) {
        this.id_laboratorio = id_laboratorio;
    }

    public String getId_entrada() {
        return id_entrada;
    }

    public void setId_entrada(String id_entrada) {
        this.id_entrada = id_entrada;
    }

    public String getId_producto() {
        return id_producto;
    }

    public void setId_producto(String id_producto) {
        this.id_producto = id_producto;
    }

    public String getId_unidad() {
        return id_unidad;
    }

    public void setId_unidad(String id_unidad) {
        this.id_unidad = id_unidad;
    }

    public String getCantidad_uni() {
        return cantidad_uni;
    }

    public void setCantidad_uni(String cantidad_uni) {
        this.cantidad_uni = cantidad_uni;
    }

    public String getLote() {
        return lote;
    }

    public void setLote(String lote) {
        this.lote = lote;
    }

    public String getDescuento() {
        return descuento;
    }

    public void setDescuento(String descuento) {
        this.descuento = descuento;
    }
    
}
