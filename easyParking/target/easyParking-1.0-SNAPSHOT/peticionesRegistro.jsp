<%-- 
    Document   : peticionesRegistro
    Created on : 24/09/2021, 03:40:01 PM
    Author     : Natan Ortiz Lozano
--%>

<%@page import="java.util.List"%>
<%@page import="logica.registro"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
String respuesta = "{";
String proceso = request.getParameter("proceso");
registro r = new registro();
switch(proceso){
    case "guardarRegistro":
        System.out.println("Guardar Registro");
        r.setFecha_ingreso(request.getParameter("fecha_ingreso"));
        r.setNum_plaza(Integer.parseInt(request.getParameter("num_plaza")));
        r.setEstado(Integer.parseInt(request.getParameter("estado")));
        r.setId_propietario(Integer.parseInt(request.getParameter("id_propietario")));

        if(r.guardarRegistro()){
            respuesta += "\"" + proceso + "\": true";
        } else{
            respuesta += "\"" + proceso + "\": false";
        }
        break;
    case "actualizarRegistro":
        System.out.println("Actualizar Registro");
        r.setId_registro_parqueo(Integer.parseInt(request.getParameter("id_registro")));
        r.setFecha_salida(request.getParameter("fecha_salida"));
        r.setEstado(Integer.parseInt(request.getParameter("estado")));
        r.setTiempo_parqueo(Integer.parseInt(request.getParameter("tiempo_parqueo")));
        r.setValor_parqueo(Integer.parseInt(request.getParameter("valor_parqueo")));
        if(r.actualizarRegistro()){
            //si guarda bien el contacto, se concatena otros datos para el json
            respuesta += "\"" + proceso + "\": true";  // el \ se usa para concatenar en json indicando que se hizo el proceso (true)
        } else{
            respuesta += "\"" + proceso + "\": false";  // el \ se usa para concatenar en json indicando que NO se hizo el proceso (false)
        }
        break;

    case "borrarRegistro":
        System.out.println("Eliminar Registro");
        int id_registro_parqueo = Integer.parseInt(request.getParameter("id_registro"));
        if(r.borrarRegistro(id_registro_parqueo)){
         respuesta += "\"" + proceso + "\": true";  // el \ se usa para concatenar en json indicando que se hizo el proceso (true)
        } else{
            respuesta += "\"" + proceso + "\": false";  // el \ se usa para concatenar en json indicando que NO se hizo el proceso (false)
        }
        break;

    case "listarRegistros":
        System.out.println("Listar Registros");
        List<registro> listaRegistros = r.listarRegistros();
        if(listaRegistros.isEmpty()){
            respuesta += "\"" + proceso + "\": true,\"Registros\":[]"; //genera una lista vacia en el json
        } else{
            respuesta += "\"" + proceso + "\": true,\"Registros\":" + new Gson().toJson(listaRegistros); //guarda la lista en el json
        }
        break;

    case "obtenerRegistros":
        System.out.println("Obtener Un Registro");
        int id_registro = Integer.parseInt(request.getParameter("id_registro"));
        if(r.obtenerRegistro(id_registro)){
            respuesta += "\"" + proceso + "\": true,\"No hay registro con ese id\":[]"; //genera una lista vacia en el json
        } else{
            respuesta += "\"" + proceso + "\": true,\"Registro \":" + new Gson().toJson(obtenerRegistro); //guarda la lista en el json
        }
        break;

    default:
        respuesta += "\"ok\": false,";
        respuesta += "\"error\": \"INVALID\",";
        respuesta += "\"errorMsg\": \"Lo sentimos, los datos que ha enviado,"
                + " son inválidos. Corrijalos y vuelva a intentar por favor.\"";
}

respuesta += "}";
response.setContentType("application/json;charset=iso-8859-1");
out.print(respuesta);

%>