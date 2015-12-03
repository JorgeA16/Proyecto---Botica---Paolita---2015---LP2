package Entidad;


public class Entrada {
    private String id_entrada;
    private String serie;
    private String fecha;
    private String id_proveedor;
    private String numero_comp;
    private String id_comprobante;
    private String estado;
    private String id_usuario;
    private String id_forma_pago;
    private String igv;
    private String nombre_producto;
    private String nombre_unidad;
    private String lote_interno;
    private String total;

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
    
    public Entrada() {
    }

    public String getId_entrada() {
        return id_entrada;
    }

    public void setId_entrada(String id_entrada) {
        this.id_entrada = id_entrada;
    }
    

    public String getSerie() {
        return serie;
    }

    public void setSerie(String serie) {
        this.serie = serie;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getId_proveedor() {
        return id_proveedor;
    }

    public void setId_proveedor(String id_proveedor) {
        this.id_proveedor = id_proveedor;
    }

    public String getNumero_comp() {
        return numero_comp;
    }

    public void setNumero_comp(String numero_comp) {
        this.numero_comp = numero_comp;
    }

    public String getId_comprobante() {
        return id_comprobante;
    }

    public void setId_comprobante(String id_comprobante) {
        this.id_comprobante = id_comprobante;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getId_forma_pago() {
        return id_forma_pago;
    }

    public void setId_forma_pago(String id_forma_pago) {
        this.id_forma_pago = id_forma_pago;
    }

    public String getIgv() {
        return igv;
    }

    public void setIgv(String igv) {
        this.igv = igv;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public String getNombre_unidad() {
        return nombre_unidad;
    }

    public void setNombre_unidad(String nombre_unidad) {
        this.nombre_unidad = nombre_unidad;
    }

    public String getLote_interno() {
        return lote_interno;
    }

    public void setLote_interno(String lote_interno) {
        this.lote_interno = lote_interno;
    }
}
