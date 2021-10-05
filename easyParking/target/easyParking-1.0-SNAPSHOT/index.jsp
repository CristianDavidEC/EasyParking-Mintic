<%-- 
    Document   : regParqueo
    Created on : 29/09/2021, 12:03:29 PM
    Author     : Natan Ortiz Lozano
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="font/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="font/font-awesome-4.7.0/css/font-awesome.css">
    </head>
    <body>
        <div ng-app="easyParking" ng-controller="controladorRegistro">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand ">
                        <img src="img/logo.png" class="d-inline-block align-text-top" alt="" width="30" height="24">
                        EasyParking
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" ng-click="listarRegistros()">Lista Registros</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div>
                <h2>GESTIÓN DE PARQUEADERO</h2>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Registrar</button>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Propietario</th>
                            <th scope="col">Placa Vehículo</th>
                            <th scope="col">Plaza</th>
                            <th scope="col">Fecha Ingreso</th>
                            <th scope="col">Salida</th>
                            <th scope="col">Borrar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr ng-repeat="registro in regestado1">
                            <td>{{registro.nombre_propietario}}</td>
                            <td>{{registro.placa_vehiculo}}</td>
                            <td>{{registro.num_plaza}}</td>
                            <td>{{registro.fecha_ingreso}}</td>
                            <td style="cursor: pointer;">
                                <a class="btn btn-warning" href="" aria-label="Sign Out" ng-click="actualizarRegistro(registro.id_registro_parqueo,registro.fecha_ingreso)">
                                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                                </a>
                            </td>
                            <td style="cursor: pointer;">
                                <a class="btn btn-danger" href="" aria-label="Delete" ng-click="borrarRegistro(registro.id_registro_parqueo)">
                                    <i class="fa fa-trash" aria-hidden="true"></i>
                                </a>
                            </td>
                        </tr>
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
                        <div class="modal-body">
                            <form>
                                <div class="mb-3">
                                    <label class="form-label" class="form-label">Nombre Propietario *</label>
                                    <input type="text" required ng-model="nombre" class="form-control" placeholder="Nombre Propietario" aria-describedby="nombrePropietario">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Número Identificación *</label>
                                    <input type="text" required ng-model="documento" class="form-control" placeholder="Número Identificación" aria-describedby="nombrePropietario">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Número Celular *</label>
                                    <input type="text" required ng-model="celular" class="form-control" placeholder="Número Celular" aria-describedby="nombrePropietario">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Placa Vehículo *</label>
                                    <input type="text" required ng-model="placa" class="form-control" placeholder="Placa vehículo" aria-describedby="nombrePropietario">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Plaza Aparcamiento *</label>
                                    <input type="text" required ng-model="plaza" class="form-control" placeholder="Placa vehículo" aria-describedby="nombrePropietario">
                                </div>
                                <button type="submit" class="btn btn-success" ng-click="guardarRegistro()">Registrar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="controladorRe.js"></script>
    </body>
</html>
