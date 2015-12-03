package DaoImpl;

import Conexion.Conexion;
import Dao.LaboratorioDao;
import Entidad.Laboratorio;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class LaboratorioDaoImpl implements LaboratorioDao{

    Conexion cn = Conexion.getInstance();
    
    @Override
    public boolean agregarLaboratorio(Laboratorio laboratorio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean actualizarLaboratorio(Laboratorio laboratorio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminarLaboratorio(int id_laboratorio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Laboratorio> listarLaboratorio() {
        List<Laboratorio> lista = null;
        String query = "SELECT id_laboratorio, nombre_laboratorio, estado FROM laboratorio";
        Statement st = null;
        ResultSet rs = null;
        Laboratorio lab = null;
        try {
            lista = new ArrayList<>();
            st = cn.conexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                lab = new Laboratorio();
                lab.setId_laboratorio(rs.getString("id_laboratorio"));
                lab.setNombre_laboratorio(rs.getString("nombre_laboratorio"));
                lab.setEstado(rs.getString("estado"));
                lista.add(lab);
            }
        } catch (Exception e) {
            System.out.println("ERRROR:" + e.getMessage());
            e.printStackTrace();
            System.out.println("ERRROR: " + query);
            
        }

        return lista;
    }
    
}
