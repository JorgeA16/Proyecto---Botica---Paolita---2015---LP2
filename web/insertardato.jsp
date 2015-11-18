<%@page import="java.util.Date"%>
<%@page import="DaoImpl.ProductoDaoImpl"%>
<%@page import="Dao.ProductoDao"%>
<%@page import="Entidad.Producto"%>
<%
ProductoDao  dao=new ProductoDaoImpl();
Producto  pro=new Producto();
String nombre=request.getParameter("nombre");
String cantidad=request.getParameter("cantidad");
String Composicion=request.getParameter("Composicion");
String fecha=request.getParameter("fecha");
String unime=request.getParameter("unime");
String sec=request.getParameter("sec");



pro.setNombre_producto(nombre);

int can=Integer.parseInt(cantidad);
pro.setCantidad(can);

pro.setComposicion(Composicion);

pro.setFecha_ven(fecha);

int inu=Integer.parseInt(unime);
pro.setId_unidad_medida(inu);

int se=Integer.parseInt(sec);
pro.setId_seccion(se);

if(dao.agregarProducto(pro))
{
    out.println(nombre+"  "+cantidad+" "+Composicion+" "+fecha+" "+unime+" "+sec);
    out.println("SE AGREGO CORRECTAMENTE ");
    response.sendRedirect("reg_producto.jsp");
}else{
out.println("<center><h1>ERROR</h1></center> VALOR: ");
  out.println(nombre+"  "+cantidad+" "+Composicion+" "+fecha+" "+unime+" "+sec);
}








%>
