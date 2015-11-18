package Conexion;

import java.sql.*;

public class Conexion {

    private static Connection cn = null;
    private static Statement st = null;
    private static ResultSet rs = null;
    private static String MError = new String();
    private static CallableStatement cst = null;
    private static Conexion INSTANCE = null;
   
    public Conexion() {
       try {
            Class.forName("org.postgresql.Driver");
            cn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/botica","postgres","system");
        } catch (Exception e) {
            System.out.println("Error coneccion:"+e.getMessage());
            e.printStackTrace();
        }
        
    }

    private synchronized static void createInstance() {
        if (INSTANCE == null) {
            INSTANCE = new Conexion();
         }
    }

    public static Conexion getInstance() {
        if (INSTANCE == null) {
            System.out.println("Se creó una nueva conexion");
            createInstance();
        }
       else{
            System.out.println("Se usó la conexión existente");
        }
        return INSTANCE;
    }

    public static void deleteInstance() {
        INSTANCE = null;
        try {
            rs.close();
            st.close();
            cn.close();
            System.err.println("Conexión cerrada");
        } catch (Exception e) {
            MError = e.getMessage();
        }
    }
// 


    public static Connection conexion (){
     
        return cn;
   }
    /*public void cerrar(){
        try {
            ConexionPostgres.conecta();
            
        } catch (Exception e) {
        }
    }*/
    
    public void guardar(){
        try {
            Conexion.cn.commit();
        } catch (Exception e) {
        }
    }
    
    public void restablecer(){
        try {
            Conexion.cn.rollback();
        } catch (Exception e) {
        }
    }
    
    
    
    
    ///PARA EJECUTAR PROCEDIMIENTOS

    public void procPreparar(String procNombre) {
        // int numParam = paramNom.length;
        try {
            cst = cn.prepareCall("{call " + procNombre + " }");

        } catch (Exception e) {
            MError = e.getMessage();
        }
    }

    public void procAsignaParam(int nomParam, String valParam) {
        try {
            cst.setString(nomParam, valParam);
        } catch (Exception e) {
            MError = e.getMessage();
        }
    }

    public void procAsignaParam(String nomParam, int valParam) {
        try {
            cst.setInt(nomParam, valParam);
        } catch (Exception e) {
            MError = e.getMessage();
        }
    }

    public void procEjecutar() {
        try {
            cst.execute();
            cn.commit();
            cn.close();
            cst.close();
        } catch (Exception e) {
            try {
                MError = e.getMessage();
                cn.rollback();
                cst.close();
                cn.close();
            } catch (Exception ex) {
                MError += ex.getMessage();
            }
        }

    }

    public void cerrar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
