<%@page import="DaoImpl.ProveedorDaoImpl"%>
<%@page import="Dao.ProveedorDao"%>
<%@page import="Entidad.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresa Producto</title>
        <%!
            String id_proveedor, nombre, ruc, celular, direccion, opcion;
        %>
        <%
            id_proveedor = request.getParameter("id_proveedor");
            if (id_proveedor == null) {
                id_proveedor = "";
            }
            nombre = request.getParameter("nombre");
            if (nombre == null) {
                nombre = "";
            }
            ruc = request.getParameter("ruc");
            if (ruc == null) {
                ruc = "";
            }
            celular = request.getParameter("celular");
            if (celular == null) {
                celular = "";
            }
            direccion = request.getParameter("direccion");
            if (direccion == null) {
                direccion = "";
            }
            opcion = request.getParameter("opcion");
            if (opcion == null) {
                opcion = "";
            }
        %>
    </head>
    <body>
        <% 
        
        if (opcion.equals("Actualizar")) {
                Proveedor prov = new Proveedor();
                prov.setId_proveedor(Integer.parseInt(id_proveedor));
                prov.setNombre(nombre);
                prov.setRuc(ruc);
                prov.setCelular(celular);
                prov.setDireccion(direccion);
                ProveedorDao prove = new ProveedorDaoImpl();
                if (prove.actualizarProveedor(prov)) {
                    out.print("Actualizado correctamente");
                    response.sendRedirect("reg_proveedor.jsp");
                } else {
                    out.print("No se pudo actualizar");
                }
            }
            if (opcion.equals("Registrar")) {
                Proveedor prov = new Proveedor();
                prov.setNombre(nombre);
                prov.setRuc(ruc);
                prov.setCelular(celular);
                prov.setDireccion(direccion);
                ProveedorDao prove = new ProveedorDaoImpl();
                if (prove.agregarProveedor(prov)) {
                    out.print("Registrado correctamente");
                    response.sendRedirect("entrada.jsp");
                } else {
                    out.print("No se pudo registrar");
                }
            }
            if (opcion.equals("Eliminar")) {
                ProveedorDao prove = new ProveedorDaoImpl();
                if (prove.eliminarProveedor(Integer.parseInt(id_proveedor))) {
                    out.print("Eliminado correctamente");
                    response.sendRedirect("reg_proveedor.jsp");
                } else {
                    out.print("No se pudo eliminar porque se está usando");
                }
            }
        %>
    </body>
</html>
