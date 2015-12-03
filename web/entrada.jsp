<%@page import="Entidad.FormaPago"%>
<%@page import="DaoImpl.FormaPagoDaoImpl"%>
<%@page import="Dao.FormaPagoDao"%>
<%@page import="Entidad.Comprobante"%>
<%@page import="DaoImpl.ComprobanteDaoImpl"%>
<%@page import="Dao.ComprobanteDao"%>
<%@page import="Entidad.Proveedor"%>
<%@page import="DaoImpl.ProveedorDaoImpl"%>
<%@page import="Dao.ProveedorDao"%>
<%@page import="DaoImpl.EntradaDaoImpl"%>
<%@page import="Dao.EntradaDao"%>
<%@page import="Entidad.Entrada"%>
<%@page import="Entidad.Proveedor"%>
<%@page import="Dao.ProveedorDao"%>
<%@page import="DaoImpl.ProveedorDaoImpl"%>
<%@include file="WEB-INF/fragmentos/top.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%            
            EntradaDao dao = new EntradaDaoImpl();
        %>
        <%
            String id_entrada, opcion, id_proveedor;
        %>
        <%
            id_entrada = request.getParameter("id_entrada");
            if (id_entrada == null) {
                id_entrada = "";
            }
            opcion = request.getParameter("opcion");
            if (opcion == null) {
                opcion = "";
            }
            id_proveedor = request.getParameter("id_proveedor");
            if (id_proveedor == null) {
                id_proveedor = "";
            }
        %>
    </head>
    <body>
       
        <div class="col-lg-3" ></div>
        <div class="col-lg-6" >
            <form name="entrada" method="post" action="ingresa_entrada.jsp">
                <table class="table table-bordered" >
                    <div class="form-group">
                        <label for="exampleInputPassword1">N° Serie</label>
                        <input type="text" class="form-control" id="nombre" placeholder="N° Serie" name="serie">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">N° Comprobante</label>
                        <input type="text" class="form-control" id="ruc" placeholder="N° Comprobante" name="numero_comp">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">FECHA</label>
                        <input  type="date" name="fecha" id="fecha" class="form-control">
                    </div>
                    <select class="form-control" name="id_proveedor" id="id_proveedor">
                        <option>Proveedor</option>
                        <%
                            ProveedorDao prov = new ProveedorDaoImpl();
                            for (Proveedor prove : prov.listarProveedor()) {
                        %>
                        <option value="<%=prove.getId_proveedor()%>"><%=prove.getNombre()%></option>
                        <%}%>
                    </select>
                    <br>
                    <select class="form-control" name="id_forma_pago" id="id_forma_pago">
                        <option>Forma de Pago</option>
                        <%
                            FormaPagoDao form = new FormaPagoDaoImpl();
                            for (FormaPago forma : form.listarFormaPago()) {
                        %>
                        <option value="<%=forma.getId_forma_pago()%>"><%=forma.getNombre_forma_pago()%></option>
                        <%}%>
                    </select>
                    <br>
                    <select class="form-control" name="id_comprobante" id="id_comprobante">
                        <option>Tipo de Comprobante</option>
                        <%
                            ComprobanteDao comp = new ComprobanteDaoImpl();
                            for (Comprobante com : comp.listarComprobante()) {
                        %>
                        <option value="<%=com.getId_comprobante()%>"><%=com.getNombre_comprobante()%></option>
                        <%}%>
                    </select>
                    <div class="form-group">
                        <label for="exampleInputPassword1">IGV</label>
                        <input type="text" class="form-control" id="igv" placeholder="IGV" name="igv">
                    </div>


                    <br>
                    <tr>
                        <td colspan="2" align="center">
                            <a href="entrada.jsp"><input type="submit"  name="opcion" class="btn btn-primary" value="Registrar"></a>
                            <input type="reset" class="btn btn-default" value="Limpiar">
                            
                            <!--<button type="button" class="btn btn-default" data-dismiss="modal">CERRAR</button>-->

                        </td>

                    </tr>
                </table>
            </form><a href="reg_proveedor.jsp"><input type="submit" class="btn btn-primary" value="Registrar Proveedor"></a>
                    
        </div>
        <div class="col-lg-3" ></div>
        
        
        
        <!--<div class="modal fade" id="proveedor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document" >
                <div class="modal-content" >
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Registrar Proveedor</h4>
                    </div>
                    <div class="modal-body">
                            <form name="proveedor" method="post" action="ingresa_proveedor.jsp">
                                <input type="hidden" name="id_proveedor" value="<%=id_proveedor%>"/>
                                <table class="table table-bordered" >
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Nombre Proveedor</label>
                                        <input type="text" class="form-control" id="nombre" placeholder="Nombre Proveedor" name="nombre">
                                    </div>
                                    <tr>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Ruc</label>
                                        <input type="number" class="form-control" id="ruc" placeholder="Ruc" name="ruc">
                                    </div>
                                    </tr>
                                    <tr>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Celular</label>
                                        <input type="text" class="form-control" id="celular" placeholder="Celular"name="celular">
                                    </div>
                                    </tr>
                                    <tr>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Direccion</label>
                                        <input type="text" class="form-control" id="direccion" placeholder="Direccion" name="direccion">
                                    </div>
                                    </tr>
                                    <br>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <a href="entrada.jsp"><input type="submit"  name="opcion" class="btn btn-primary" value="Registrar"> </a>
                                            <input type="reset" class="btn btn-default" value="Limpiar">
                                            <!--<button type="button" class="btn btn-default" data-dismiss="modal">CERRAR</button>-->

                                        <!--</td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>-->

        
    </body>
</html>
<%@include file="WEB-INF/fragmentos/bottom.jspf" %>
