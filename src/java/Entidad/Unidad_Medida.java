package Entidad;


public class Unidad_Medida {
    private int id_unidad_medida;
    private String nombre_unida_med;
    private String abreviatura;

    public Unidad_Medida() {
    }

    public int getId_unidad_medida() {
        return id_unidad_medida;
    }

    public void setId_unidad_medida(int id_unidad_medida) {
        this.id_unidad_medida = id_unidad_medida;
    }

    public String getNombre_unida_med() {
        return nombre_unida_med;
    }

    public void setNombre_unida_med(String nombre_unida_med) {
        this.nombre_unida_med = nombre_unida_med;
    }

    public String getAbreviatura() {
        return abreviatura;
    }

    public void setAbreviatura(String abreviatura) {
        this.abreviatura = abreviatura;
    }
}
