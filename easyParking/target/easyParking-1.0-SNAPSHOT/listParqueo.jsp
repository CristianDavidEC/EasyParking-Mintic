<%-- 
    Document   : regParqueo
    Created on : 29/09/2021, 12:03:29 PM
    Author     : Natan Ortiz Lozano
--%>
<%@include file="header.jsp" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<%@page import="java.util.List"%>
<%@page import="logica.registro"%>
<div>
    <h2>GESTIÓN DE PARQUEADERO</h2>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Registrar</button>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Propietario</th>
                <th scope="col">Placa Vehículo</th>
                <th scope="col">Plaza</th>
                <th scope="col">Opciones</th>
            </tr>
        </thead>
        <tbody>
                <%
                registro r = new registro();
                List<registro> listaRegistros = r.listarRegistros();
                for (int i=0;i<listaRegistros.size();i++)
                {
                   out.println("<tr>");
                   out.println("<td>"+listaRegistros.get(i).getId_registro_parqueo()+"</td>");
                   out.println("<td>"+listaRegistros.get(i).getNombre_propietario()+"</td>");
                   out.println("<td>"+listaRegistros.get(i).getPlaca_vehiculo()+"</td>");
                   out.println("<td>"+listaRegistros.get(i).getNum_plaza()+"</td>");
                   out.println("</tr>");
                }
                %>
        </tbody>
    </table>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">REGISTRAR ENTRADA</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" ng-app="easyParking" ng-controller="controladorRegistro">
                <form>
                    <div class="mb-3">
                        <label class="form-label" class="form-label">Nombre Propietario</label>
                        <input type="text" ng-model="nombre" class="form-control" placeholder="Nombre Propietario" aria-describedby="nombrePropietario">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Número Identificación</label>
                        <input type="text" ng-model="documento" class="form-control" placeholder="Número Identificación" aria-describedby="nombrePropietario">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Número Celular</label>
                        <input type="text" ng-model="celular" class="form-control" placeholder="Número Celular" aria-describedby="nombrePropietario">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Placa Vehículo</label>
                        <input type="text" ng-model="placa" class="form-control" placeholder="Placa vehículo" aria-describedby="nombrePropietario">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Plaza Aparcamiento</label>
                        <input type="text" ng-model="plaza" class="form-control" placeholder="Placa vehículo" aria-describedby="nombrePropietario">
                    </div>
                    <button type="submit" class="btn btn-success" ng-click="guardarRegistro()">Registrar</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    var hoy = new Date();
    var fecha = hoy.getFullYear() + '-' + (hoy.getMonth() + 1) + '-' + hoy.getDate();
    var hora = hoy.getHours() + ':' + hoy.getMinutes() + ':' + hoy.getSeconds();
    var fechaYHora = fecha + ' ' + hora;

    var app = angular.module('easyParking', []);
    app.controller('controladorRegistro', function ($scope, $http) {
        $scope.guardarRegistro = function () {
            let registro = {
                proceso: "guardarRegistro",
                fecha_ingreso: fechaYHora,
                num_plaza: $scope.plaza,
                estado: "1",
                nombre_propietario: $scope.nombre,
                doc_propietario: $scope.documento,
                cel_propietario: $scope.celular,
                placa_vehiculo: $scope.placa
            };
            $http({
                method: 'POST',
                url: 'peticionesRegistro.jsp',
                params: registro
            }).then(function (respuesta) {
                console.log(respuesta);
                alert('Guardado exitosamente');
            });
        };
    });
</script>
</body>
</html>
