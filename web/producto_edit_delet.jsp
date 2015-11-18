<%@page import="Entidad.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/fragmentos/top.jspf" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto Formulario</title>
        <%!
            String id_producto, nombre_producto, cantidad, composicion, fecha_ven, id_unidad_medida, id_seccion, opcion;
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
            composicion = request.getParameter("composicion");
            if (composicion == null) {
                composicion = "";
            }
            fecha_ven = request.getParameter("fecha_ven");
            if (fecha_ven == null) {
                fecha_ven = "";
            }
            id_unidad_medida = request.getParameter("id_unidad_medida");
            if (id_unidad_medida == null) {
                id_unidad_medida = "";
            }
            id_seccion = request.getParameter("seccion");
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
        <%@include file="inicio.jsp" %>
        <%            if (opcion.equals("Actualizar")) {
                Producto pro = new Producto();
                pro.setId_producto(Integer.parseInt(id_producto));
                pro.setNombre_categoria(nombre_producto);
                pro.setCantidad(Integer.parseInt(cantidad));
                pro.setComposicion(composicion);
                pro.setFecha_ven(fecha_ven);
                pro.setId_unidad_medida(Integer.parseInt(id_unidad_medida));
                pro.setId_seccion(Integer.parseInt(id_seccion));
                cat.setEstado(estado);
                CategoriaDao dao = new CategoriaDaoImpl();
                if (dao.actualizarCategoria(cat)) {
                    out.print("Actualizado correctamente");
                    response.sendRedirect("categoria.jsp");
                } else {
                    out.print("No se pudo actualizar");
                }
            }
            if (opcion.equals("Registrar")) {
                Categoria cat = new Categoria();
                cat.setId_categoria(4);
                cat.setNombre(nombre);
                cat.setDescripcion(descripcion);
                cat.setEstado(estado);
                cat.setId_linea(2);
                CategoriaDao dao = new CategoriaDaoImpl();
                if (dao.agregarCategoria(cat)) {
                    out.print("Registrado correctamente");
                    response.sendRedirect("categoria.jsp");
                } else {
                    out.print("No se pudo registrar");
                }
            }
            if (opcion.equals("Eliminar")) {
                CategoriaDao dao = new CategoriaDaoImpl();
                if (dao.eliminarCategoria(id_categoria)) {
                    out.print("Eliminado correctamente");
                    response.sendRedirect("categoria.jsp");
                } else {
                    out.print("No se pudo eliminar porque se está usando");
                }
            }
        %>
    <center>Datos categoría</center>
        <%
            if (!id_categoria.equals("")) {
                CategoriaDao dao = new CategoriaDaoImpl();
                Categoria cat = dao.DatosCategoria(id_categoria);
        %>
    <form name="categoria" method="post" action="categoria_form.jsp" autocomplete="off">
        <input type="hidden" name="id_categoria" value="<%=id_categoria%>"/>
        <table align="center">
            <tr>
                <td height="28">Nombre:</td>
                <td>
                    <input type="text" name="nombre" value="<%=cat.getNombre()%>" maxlength="50" size="30"/>
                </td>
            </tr>
            <tr>
                <td height="28">Descripción:</td>
                <td>
                    <input type="text" name="descripcion" value="<%=cat.getDescripcion()%>" maxlength="50" size="30"/>
                </td>
            </tr>
            <tr>
                <td height="28">Estado:</td>
                <td>
                    <input type="radio" name="estado" value="1"/> Activo
                    <input type="radio" name="estado" value="0"/> Desactivo
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="opcion" value="Actualizar"/>
                </td>
            </tr>
        </table>

    </form>
    <script type="text/javascript">
        document.categoria.estado.value = '<%=cat.getEstado()%>';
    </script>
    <%} else {%>
    <form name="categoria" method="post" action="categoria_form.jsp" autocomplete="off">
        <table align="center">
            <tr>
                <td height="28">Nombre:</td>
                <td>
                    <input type="text" name="nombre" value="" maxlength="50" size="30"/>
                </td>
            </tr>
            <tr>
                <td height="28">Descripción:</td>
                <td>
                    <input type="text" name="descripcion" value="" maxlength="50" size="30"/>
                </td>
            </tr>
            <tr>
                <td height="28">Estado:</td>
                <td>
                    <input type="radio" name="estado" value="1" checked=""/> Activo
                    <input type="radio" name="estado" value="0"/> Desactivo
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="opcion" value="Registrar"/>
                </td>
            </tr>
        </table>

    </form>
    <%}%>
</body>
</html>

