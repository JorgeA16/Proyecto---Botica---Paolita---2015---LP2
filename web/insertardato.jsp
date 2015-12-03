<%@page import="Entidad.Seccion"%>
<%@page import="DaoImpl.SeccionDaoImpl"%>
<%@page import="Dao.SeccionDao"%>
<%@page import="DaoImpl.UnidadMedidaDaoImpl"%>
<%@page import="Dao.UnidadMedidaDao"%>
<%@page import="Entidad.UnidadMedida"%>
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

UnidadMedidaDao unim = new UnidadMedidaDaoImpl();
UnidadMedida uni = new UnidadMedida();
String unime=request.getParameter("unime");

SeccionDao secc = new SeccionDaoImpl();
Seccion sec = new Seccion();
String  secci=request.getParameter("secci");

pro.setNombre_producto(nombre);

int can=Integer.parseInt(cantidad);
pro.setCantidad(can);

pro.setComposicion(Composicion);

pro.setFecha_ven(fecha);

int inu=Integer.parseInt(unime);
uni.setId_unidad_medida(inu);

int se=Integer.parseInt(secci);
sec.setId_seccion(se);

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
