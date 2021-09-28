/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package logica;

import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Natan Ortiz Lozano
 */

public class registro{
    
    private int id_registro_parqueo;
    private String fecha_ingreso;
    private String fecha_salida;
    private int num_plaza;
    private int tiempo_parqueo;
    private int valor_parqueo;
    private int estado;
    private int id_propietario;

    public registro() {
    }
    
    public int getId_registro_parqueo() {
        return id_registro_parqueo;
    }

    public void setId_registro_parqueo(int id_registro_parqueo) {
        this.id_registro_parqueo = id_registro_parqueo;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    public String getFecha_salida() {
        return fecha_salida;
    }

    public void setFecha_salida(String fecha_salida) {
        this.fecha_salida = fecha_salida;
    }

    public int getNum_plaza() {
        return num_plaza;
    }

    public void setNum_plaza(int num_plaza) {
        this.num_plaza = num_plaza;
    }

    public int getTiempo_parqueo() {
        return tiempo_parqueo;
    }

    public void setTiempo_parqueo(int tiempo_parqueo) {
        this.tiempo_parqueo = tiempo_parqueo;
    }

    public int getValor_parqueo() {
        return valor_parqueo;
    }

    public void setValor_parqueo(int valor_parqueo) {
        this.valor_parqueo = valor_parqueo;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getId_propietario() {
        return id_propietario;
    }

    public void setId_propietario(int id_propietario) {
        this.id_propietario = id_propietario;
    }
    
    //metodos para el CRUD de Registro
    
    public boolean guardarRegistro(){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "INSERT INTO registro_parqueadero(fecha_ingreso, numero_plaza, estado, id_propietario)"
        + "VALUES ( '" + this.fecha_ingreso + "','" + this.num_plaza + "','" + this.estado + "','" + this.id_propietario + "');  ";
        //Vamos a configurar el setAutocommit de la conexionBD a falso
        if(conexion.setAutoCommitBD(false)){
            if(conexion.insertarBD(sentencia)){
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else{ //si no logro insertar en la BD
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        } else{
            conexion.closeConnection();
            return false;
        }
    }
    
    public boolean borrarRegistro(int id_registro_parqueo){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "DELETE FROM registro_parqueadero WHERE id_registro_parqueo = '" + id_registro_parqueo + "';";
        if(conexion.setAutoCommitBD(false)){
            if(conexion.borrarBD(sentencia)){
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else{
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
        } else {
            conexion.closeConnection();
            return false;
        }
    }
    
    public boolean actualizarRegistro(){
        ConexionBD conexion = new ConexionBD();
        String sentencia = "UPDATE `registro_parqueadero` SET fecha_salida='" + this.fecha_salida + "', "
 + "tiempo_parqueo_min='" + this.tiempo_parqueo + "', valor_parqueo='" + this.valor_parqueo + "', "
 + "estado='" + this.estado + "' WHERE id_registro_parqueo ='" + this.id_registro_parqueo + "';";

        if(conexion.setAutoCommitBD(false)){
            if(conexion.actualizarBD(sentencia)){
                conexion.commitBD();
                conexion.closeConnection();
                return true;
            } else{
                conexion.rollbackBD();
                conexion.closeConnection();
                return false;
            }
           
        } else{
            conexion.closeConnection();
            return false;
        }
    }
    
    public List<registro> listarRegistros() throws SQLException{
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM registro_parqueadero ORDER BY id_registro_parqueo ASC;";
        List<registro> listaRegistros = new ArrayList<>();
        ResultSet datos = conexion.consultarBD(sentencia);
        
        registro registro;
        while (datos.next()) {
            registro = new registro();
            registro.setId_registro_parqueo(datos.getInt("id_registro_parqueo"));
            registro.setFecha_ingreso(datos.getString("fecha_ingreso"));
            registro.setFecha_salida(datos.getString("fecha_salida"));
            registro.setNum_plaza(datos.getInt("numero_plaza"));
            registro.setTiempo_parqueo(datos.getInt("tiempo_parqueo_min"));
            registro.setValor_parqueo(datos.getInt("valor_parqueo"));
            registro.setEstado(datos.getInt("estado"));
            registro.setId_propietario(datos.getInt("id_propietario"));
            
            listaRegistros.add(registro);
            
        }
        conexion.closeConnection();
        return listaRegistros;
    }
    
    public registro obtenerRegistro(int id_registro_parqueo) throws SQLException{
        ConexionBD conexion = new ConexionBD();
        String sentencia = "SELECT * FROM registro_parqueadero WHERE id_registro_parqueo = '" + id_registro_parqueo + "';";
        ResultSet datos = conexion.consultarBD(sentencia);
        if(datos.next()){
            registro registro = new registro();
            registro.setId_registro_parqueo(datos.getInt("id_registro_parqueo"));
            registro.setFecha_ingreso(datos.getString("fecha_ingreso"));
            registro.setFecha_salida(datos.getString("fecha_salida"));
            registro.setNum_plaza(datos.getInt("numero_plaza"));
            registro.setTiempo_parqueo(datos.getInt("tiempo_parqueo_min"));
            registro.setValor_parqueo(datos.getInt("valor_parqueo"));
            registro.setEstado(datos.getInt("estado"));
            registro.setId_propietario(datos.getInt("id_propietario"));
            return registro;
        } else{
            conexion.closeConnection();
            return null;
        }
    
    }

}