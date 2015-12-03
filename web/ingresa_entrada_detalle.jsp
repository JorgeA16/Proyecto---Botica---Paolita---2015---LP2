<%@page import="Entidad.Producto"%>
<%@page import="DaoImpl.ProductoDaoImpl"%>
<%@page import="Dao.ProductoDao"%>
<%@page import="DaoImpl.EntradaDetalleDaoImpl"%>
<%@page import="Dao.EntradaDetalleDao"%>
<%@page import="Entidad.EntradaDetalle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agrega Proveedor</title>
        <%!
            String id_lote_interno, cantidad, precio_compra, fecha_ven, stock, id_laboratorio, id_entrada, id_producto, 
                    id_unidad, cantidad_uni, lote, descuento, total_compra, nombre_producto, nombre_categoria, abreviatura, opcion;
        %>
        <%
            id_lote_interno = request.getParameter("id_lote_interno");
            if (id_lote_interno == null) {
                id_lote_interno = "";
            }
            cantidad = request.getParameter("cantidad");
            if (cantidad == null) {
                cantidad = "";
            }
            precio_compra = request.getParameter("precio_compra");
            if (precio_compra == null){
                precio_compra = "";
            }
            fecha_ven = request.getParameter("fecha_ven");
            if (fecha_ven == null){
                fecha_ven = "";
            }
            stock = request.getParameter("stock");
            if (stock == null){
                stock = "";
            }
            id_laboratorio = request.getParameter("id_laboratorio");
            if (id_laboratorio == null){
                id_laboratorio = "";
            }
            id_entrada = request.getParameter("id_entrada");
            if (id_entrada == null){
                id_entrada = "";
            }
            id_producto = request.getParameter("id_producto");
            if (id_producto == null){
                id_producto = "";
            }
            id_unidad = request.getParameter("id_unidad");
            if (id_unidad == null){
                id_unidad = "";
            }
            cantidad_uni = request.getParameter("cantidad_uni");
            if (cantidad_uni == null){
                cantidad_uni = "";
            }
            lote = request.getParameter("lote");
            if (lote == null){
                lote = "";
            }
            descuento = request.getParameter("descuento");
            if (descuento == null){
                descuento = "";
            }
            total_compra = request.getParameter("total_compra");
            if (total_compra == null){
                total_compra = "";
            }
            nombre_producto = request.getParameter("nombre_producto");
            if (nombre_producto == null){
                nombre_producto = "";
            }
            nombre_categoria = request.getParameter("nombre_categoria");
            if (nombre_categoria == null){
                nombre_categoria = "";
            }
            abreviatura = request.getParameter("abreviatura");
            if (abreviatura == null){
                abreviatura = "";
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
                EntradaDetalle endeta = new EntradaDetalle();
                endeta.setId_lote_interno(id_lote_interno);
                endeta.setCantidad(cantidad);
                endeta.setPrecio_compra(precio_compra);
                endeta.setFecha_ven(fecha_ven);
                endeta.setStock(stock);
                endeta.setId_laboratorio(id_laboratorio);
                endeta.setId_entrada(id_entrada);
                endeta.setId_producto(id_producto);
                endeta.setId_unidad(id_unidad);
                endeta.setCantidad_uni(cantidad_uni);
                endeta.setLote(lote);
                endeta.setDescuento(descuento);
                endeta.setTotal(total_compra);
                EntradaDetalleDao dao = new EntradaDetalleDaoImpl();
                if (dao.actualizarEntradaDetalle(endeta)) {
                    out.print("Actualizado correctamente");
                    response.sendRedirect("ingresa_entrada_detalle.jsp");
                } else {
                    out.print("No se pudo actualizar");
                }
            }
            if (opcion.equals("Registrar")) {
                EntradaDetalle endeta = new EntradaDetalle();
                endeta.setCantidad(cantidad);
                endeta.setPrecio_compra(precio_compra);
                endeta.setFecha_ven(fecha_ven);
                endeta.setStock(stock);
                endeta.setId_laboratorio(id_laboratorio);
                endeta.setId_entrada(id_entrada);
                endeta.setId_producto(id_producto);
                endeta.setId_unidad(id_unidad);
                endeta.setCantidad_uni(cantidad_uni);
                endeta.setLote(lote);
                endeta.setDescuento(descuento);
                endeta.setTotal(total_compra);
                EntradaDetalleDao dao = new EntradaDetalleDaoImpl();
                if (dao.agregarEntradaDetalle(endeta)) {
                    out.print("Registrado correctamente");
                    response.sendRedirect("entrada_detalle.jsp?id_entrada="+id_entrada);
                } else {
                    out.print("No se pudo registrar");
                }
            }
            if (opcion.equals("Terminar")) {
                EntradaDetalle endeta = new EntradaDetalle();
                endeta.setCantidad(cantidad);
                endeta.setPrecio_compra(precio_compra);
                endeta.setFecha_ven(fecha_ven);
                endeta.setStock(stock);
                endeta.setId_laboratorio(id_laboratorio);
                endeta.setId_entrada(id_entrada);
                endeta.setId_producto(id_producto);
                endeta.setId_unidad(id_unidad);
                endeta.setCantidad_uni(cantidad_uni);
                endeta.setLote(lote);
                endeta.setDescuento(descuento);
                endeta.setTotal(total_compra);
                EntradaDetalleDao dao = new EntradaDetalleDaoImpl();
                if (dao.agregarEntradaDetalle(endeta)) {
                    out.print("Registrado correctamente");
                    response.sendRedirect("inicio.jsp?id_entrada="+id_entrada);
                } else {
                    out.print("No se pudo registrar");
                }
            }
            if (opcion.equals("Eliminar")) {
                EntradaDetalleDao dao = new EntradaDetalleDaoImpl();
                if (dao.eliminarEntradaDetalle(Integer.parseInt(id_lote_interno))) {
                    out.print("Eliminado correctamente");
                    response.sendRedirect("entrada_detalle.jsp");
                } else {
                    out.print("No se pudo eliminar");
                }
            }
            if (opcion.equals("AgregarProducto")) {
                Producto pro = new Producto();
                pro.setNombre_producto(nombre_producto);
                pro.setNombre_categoria(nombre_categoria);
                pro.setAbreviatura(abreviatura);
                ProductoDao dao = new ProductoDaoImpl();
                if (dao.agregarProducto(pro)){
                    out.print("Registro Correctamente");
                    response.sendRedirect("entrada_detalle.jsp?id_entrada="+id_entrada);
                }else{
                    out.print("No se pudo Registrar");
                }
            }
            if (opcion.equals("AgregarProducto")) {
                Producto prod = new Producto();
                prod.setNombre_producto(nombre_producto);
                prod.setNombre_categoria(nombre_categoria);
                prod.setAbreviatura(abreviatura);
                ProductoDao daoo = new ProductoDaoImpl();
                if (daoo.agregarProducto(prod)){
                    out.print("Registro Correctamente");
                    response.sendRedirect("entrada_detalle.jsp");
                }else{
                    out.print("No se pudo Registrar");
                }
            }
            
        %>
    </body>
</html>
