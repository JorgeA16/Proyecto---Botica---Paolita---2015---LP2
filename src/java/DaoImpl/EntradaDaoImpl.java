package DaoImpl;

import Conexion.Conexion;
import Dao.EntradaDao;
import Entidad.Entrada;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

public class EntradaDaoImpl implements EntradaDao {

    Conexion cn = Conexion.getInstance();

    @Override
    public String agregarEntrada(Entrada ent) {
        Statement st = null;
        ResultSet rs = null;
        String id_entrada = "";
        String query = "select registrar_entrada"
                + " ('" + ent.getSerie() + "',"
                + " to_date('" + ent.getFecha() + "','yyyy-mm-dd'), "
                + " " + ent.getId_proveedor() + ", "
                + " '" + ent.getNumero_comp() + "',"
                + " " + ent.getId_comprobante() + ","
                + " " + ent.getId_usuario() + ","
                + " " + ent.getId_forma_pago() + ","
                + " " + ent.getIgv() + ") id_entrada";
        try {
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
            cn.guardar();
            rs.next();
            id_entrada = rs.getString("id_entrada");
            cn.conexion().getAutoCommit();
//            cn.conexion().close();

        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
            System.out.println(query);
        }
        return id_entrada;
    }

    @Override
    public boolean actualizarEntrada(Entrada entrada) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean eliminarEntrada(int id_entrada) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<Entrada> listarEntrada() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public Entrada Datos_entrada(String id_entrada) {
        Statement st = null;
        ResultSet rs = null;
        Entrada ent = null;
        String query = "SELECT "
                + "  ent.id_entrada, "
                + "  to_char(ent.fecha,'dd/mm/yyyy') fecha, "
                + "  ent.serie, "
                + "  ent.numero_comp, "
                + "  prov.nombre proveedor, "
                + "  prov.ruc, "
                + "  fp.nombre_forma_pago, "
                + "  comb.nombre_comprobante, "
                + "  per.nombre||' '||per.apepat||' '||per.apemat usuario,"
                + " (select sum(cantidad*precio_compra-descuento) from entrada_detalle where id_entrada=ent.id_entrada) total " 
                + " FROM "
                + "  entrada ent, "
                + "  proveedor prov, "
                + "  comprobante comb, "
                + "  forma_pago fp, "
                + "  usuario us, "
                + "  persona per"
                + " WHERE "
                + "  prov.id_proveedor = ent.id_proveedor AND"
                + "  comb.id_comprobante = ent.id_comprobante AND"
                + "  fp.id_forma_pago = ent.id_forma_pago AND"
                + "  us.id_usuario = ent.id_usuario AND"
                + "  per.id_persona = us.id_usuario and"
                + "  ent.id_entrada=" + id_entrada;
        System.err.println(query);
        try {
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
//            cn.cerrar();
            rs.next();
            ent = new Entrada();
            ent.setId_entrada(rs.getString("id_entrada"));
            ent.setId_forma_pago(rs.getString("nombre_forma_pago"));
            ent.setId_usuario(rs.getString("usuario"));
            ent.setId_proveedor(rs.getString("proveedor"));
            ent.setFecha(rs.getString("fecha"));
            ent.setId_comprobante(rs.getString("nombre_comprobante"));
            ent.setNumero_comp(rs.getString("numero_comp"));
            ent.setSerie(rs.getString("serie"));
            ent.setTotal(rs.getString("total"));

        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            e.printStackTrace();
            try {
//                cn.cerrar();
            } catch (Exception ex) {
            }
        }
        return ent;
    }
}
