
<%@page import="Dao.ProductoDao"%>
<%@page import="Entidad.Producto"%>
<%@page import="DaoImpl.ProductoDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario Producto</title>
        <%!
            String id_producto, nombre_producto, cantidad, fecha_ven, id_unidad_medida, id_seccion, opcion;
        %>
        <%
            id_producto = request.getParameter("id_producto");
            if (id_producto == null) {
                id_producto = "";
            }
            nombre_producto = request.getParameter("nombre_producto");
            if (nombre_producto == null) {
                nombre_producto = "";
            }
            cantidad = request.getParameter("cantidad");
            if (cantidad == null) {
                cantidad = "";
            }
            fecha_ven = request.getParameter("fecha_ven");
            if (fecha_ven == null) {
                fecha_ven = "";
            }
            id_unidad_medida = request.getParameter("id_unidad_medida");
            if (id_unidad_medida == null) {
                id_unidad_medida = "";
            }
            id_seccion = request.getParameter("id_seccion");
            if (id_seccion == null) {
                id_seccion = "";
            }
            opcion = request.getParameter("opcion");
            if (opcion == null) {
                opcion = "";
            }
        %>
    </head>
    <body>
        <%@include file="WEB-INF/fragmentos/top.jspf" %>
        <% 
        
        if (opcion.equals("Actualizar")) {
                Producto pro = new Producto();
                pro.setId_producto(Integer.parseInt(id_producto));
                pro.setNombre_producto(nombre_producto);
                pro.setCantidad(Integer.parseInt(cantidad));
                pro.setFecha_ven(fecha_ven);
                pro.setId_unidad_medida(Integer.parseInt(id_unidad_medida));
                pro.setId_seccion(Integer.parseInt(id_seccion));
                ProductoDao prod = new ProductoDaoImpl();
                if (prod.actualizarProducto(pro)) {
                    out.print("Actualizado correctamente");
                    response.sendRedirect("reg_producto.jsp");
                } else {
                    out.print("No se pudo actualizar");
                }
            }
            if (opcion.equals("Registrar")) {
                Producto pro = new Producto();
                pro.setNombre_producto(nombre_producto);
                pro.setCantidad(Integer.parseInt(cantidad));
                pro.setFecha_ven(fecha_ven);
                pro.setId_unidad_medida(Integer.parseInt(id_unidad_medida));
                pro.setId_seccion(Integer.parseInt(id_seccion));
                ProductoDao prod = new ProductoDaoImpl();
                if (prod.agregarProducto(pro)) {
                    out.print("Registrado correctamente");
                    response.sendRedirect("entrada_detalle.jsp");
                } else {
                    out.print("No se pudo registrar");
                }
            }
            if (opcion.equals("Eliminar")) {
                ProductoDao prod = new ProductoDaoImpl();
                if (prod.eliminarProducto(Integer.parseInt(id_producto))) {
                    out.print("Eliminado correctamente");
                    response.sendRedirect("reg_producto.jsp");
                } else {
                    out.print("No se pudo eliminar porque se está usando");
                }
            }
        %>
</body>
</html>
