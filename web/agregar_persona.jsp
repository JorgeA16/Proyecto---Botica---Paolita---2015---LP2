<%@page import="DaoImpl.PersonaDaoImpl"%>
<%@page import="Dao.PersonaDao"%>
<%@page import="Entidad.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Persona</title>
        <%!
            String id_persona, nombre, apepat, apemat, celular, dni, sexo, opcion;
        %>
        <%
            id_persona = request.getParameter("id_persona");
            if (id_persona == null) {
                id_persona = "";
            }
            nombre = request.getParameter("nombre");
            if (nombre == null) {
                nombre = "";
            }
            apepat = request.getParameter("apepat");
            if (apepat == null) {
                apepat = "";
            }
            apemat = request.getParameter("apemat");
            if (apemat == null) {
                apemat = "";
            }
            celular = request.getParameter("celular");
            if (celular == null) {
                celular = "";
            }
            dni = request.getParameter("dni");
            if (dni == null) {
                dni = "";
            }
            sexo = request.getParameter("sexo");
            if (sexo == null) {
                sexo = "";
            }
            opcion = request.getParameter("opcion");
            if (opcion == null) {
                opcion = "";
            }
        %>
    </head>
    <body>
        <%            if (opcion.equals("Actualizar")) {
                Persona per = new Persona();
                per.setId_persona(id_persona);
                per.setNombre(nombre);
                per.setApepat(apepat);
                per.setApemat(apemat);
                per.setCelular(celular);
                per.setDni(dni);
                per.setSexo(sexo);
                PersonaDao dao = new PersonaDaoImpl();
                if (dao.actualizarPersona(per)) {
                    out.print("Actualizado correctamente");
                    response.sendRedirect("venta_cliente.jsp");
                } else {
                    out.print("No se pudo actualizar");
                }
            }
            if (opcion.equals("Registrar")) {
                Persona per = new Persona();
                per.setNombre(nombre);
                per.setApepat(apepat);
                per.setApemat(apemat);
                per.setCelular(celular);
                per.setDni(dni);
                per.setSexo(sexo);
                PersonaDao dao = new PersonaDaoImpl();
                if (dao.agregarPersona(per)) {
                    out.print("Registrado correctamente");
                    response.sendRedirect("venta_cliente.jsp");
                } else {
                    out.print("No se pudo registrar");
                }
            }
            if (opcion.equals("Eliminar")) {
                PersonaDao dao = new PersonaDaoImpl();
                if (dao.eliminarPersona(Integer.parseInt(id_persona))) {
                    out.print("Eliminado correctamente");
                    response.sendRedirect("venta_cliente.jsp");
                } else {
                    out.print("No se pudo eliminar porque se está usando");
                }
            }
        %>
    </body>
</html>
