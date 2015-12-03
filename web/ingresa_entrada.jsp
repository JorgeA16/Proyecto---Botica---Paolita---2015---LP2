<%@page import="DaoImpl.EntradaDaoImpl"%>
<%@page import="Dao.EntradaDao"%>
<%@page import="Entidad.Entrada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            String id_entrada, serie, fecha, id_proveedor, numero_comp, id_comprobante, id_forma_pago, igv, opcion;
        %>
        <%
            id_entrada = request.getParameter("id_entrada");
            if (id_entrada == null){
                id_entrada = "";
            }
            igv = request.getParameter("igv");
            if (igv == null){
                igv = "";
            }
            serie = request.getParameter("serie");
            if (serie == null){
                serie = "";
            }
            fecha = request.getParameter("fecha");
            if (fecha == null){
                fecha = "";
            }
            id_proveedor = request.getParameter("id_proveedor");
            if (id_proveedor == null){
                id_proveedor = "";
            }
            numero_comp = request.getParameter("numero_comp");
            if (numero_comp == null){
                numero_comp = "";
            }
            id_comprobante = request.getParameter("id_comprobante");
            if (id_comprobante == null){
                id_comprobante = "";
            }
            id_forma_pago = request.getParameter("id_forma_pago");
            if (id_forma_pago == null){
                id_forma_pago = "";
            }
            opcion = request.getParameter("opcion");
            if (opcion == null){
                opcion = "";
            }
        %>
    </head>
    <body>
        <%
            if (opcion.equals("Actualizar")) {
                Entrada en = new Entrada();
                en.setId_entrada(id_entrada);
                en.setSerie(serie);
                en.setFecha(fecha);
                en.setId_proveedor(id_proveedor);
                en.setNumero_comp(numero_comp);
                en.setId_comprobante(id_comprobante);
                en.setId_forma_pago(id_forma_pago);
                en.setIgv(igv);
                EntradaDao ent = new EntradaDaoImpl();
                if (ent.actualizarEntrada(en)) {
                    out.print("Actualizado correctamente");
                    response.sendRedirect("entrada.jsp");
                } else {
                    out.print("No se pudo actualizar");
                }
            }
            if (opcion.equals("Registrar")) {
                Entrada en = new Entrada();
                en.setSerie(serie);
                en.setFecha(fecha);
                en.setId_proveedor(id_proveedor);
                en.setNumero_comp(numero_comp);
                en.setId_comprobante(id_comprobante);
                en.setId_forma_pago(id_forma_pago);
                en.setIgv(igv);
                en.setId_usuario("1");
                EntradaDao ent = new EntradaDaoImpl();
                String id_ent=ent.agregarEntrada(en);
                if (!id_ent.equals("")) {
                    out.print("Registrado correctamente");
                    response.sendRedirect("entrada_detalle.jsp?id_entrada="+id_ent);
                } else {
                    out.print("No se pudo registrar");
                }
            }
            if (opcion.equals("Eliminar")) {
                EntradaDao ent = new EntradaDaoImpl();
                if (ent.eliminarEntrada(Integer.parseInt(id_entrada))) {
                    out.print("Eliminado correctamente");
                    response.sendRedirect("entrada.jsp");
                } else {
                    out.print("No se pudo eliminar porque se está usando");
                }
            }
        %>
    </body>
</html>
