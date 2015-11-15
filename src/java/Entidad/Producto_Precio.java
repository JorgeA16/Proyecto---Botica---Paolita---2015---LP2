package Entidad;


public class Producto_Precio {
    private int id_producto_precio;
    private int cantidad_uni;
    private int id_producto;
    private int id_unidad;
    private int precio;

    public Producto_Precio() {
    }

    public int getId_producto_precio() {
        return id_producto_precio;
    }

    public void setId_producto_precio(int id_producto_precio) {
        this.id_producto_precio = id_producto_precio;
    }

    public int getCantidad_uni() {
        return cantidad_uni;
    }

    public void setCantidad_uni(int cantidad_uni) {
        this.cantidad_uni = cantidad_uni;
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

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }
}
