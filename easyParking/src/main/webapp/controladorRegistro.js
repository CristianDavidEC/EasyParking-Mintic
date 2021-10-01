/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* global angular */

var ingreso = new Date();
var fechaIngreso = ingreso.getFullYear() + '-' + (ingreso.getMonth() + 1) + '-' + ingreso.getDate() + ' ' + ingreso.getHours() + ':' + ingreso.getMinutes() + ':' + ingreso.getSeconds();

var app = angular.module('easyParking', []);
app.controller('controladorRegistro', function ($scope, $http) {
    $scope.guardarRegistro = function () {
        if ($scope.nombre === undefined || $scope.documento === undefined) {
            aler('Campos obligatorios');
        } else {
            let registro = {
                proceso: "guardarRegistro",
                fecha_ingreso: fechaIngreso,
                num_plaza: $scope.plaza,
                estado: 1,
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
                location.reload();
                $scope.mostrarlista(true);
            });
        }
        ;
    };
    $scope.listarRegistros = function () {
        console.log('Listar Registros');
        let params = {
            proceso: 'listarRegistros'
        };
        $http({
            method: 'POST',
            url: 'peticionesRegistro.jsp',
            params: params
        }).then(function (respuesta) {
            $scope.regestado1 = respuesta.data.Registros.filter(element => element.estado === 1);
            $scope.regestado0 = respuesta.data.Registros;
            console.log($scope.regestado0);
            console.log($scope.regestado1);
        });
    };
    $scope.borrarRegistro = function (id_registro) {
        if (confirm("Desea eliminar este registro?")) {
            let params = {
                proceso: 'borrarRegistro',
                id_registro: id_registro
            };
            $http({
                method: 'POST',
                url: 'peticionesRegistro.jsp',
                params: params
            }).then(function (respuesta) {
                console.log(respuesta);
                alert('Registro eliminado');
                location.reload();
            });
        }
        ;
    };
    $scope.actualizarRegistro = function (id_registro, fecha_ingreso) {
        if (confirm("Desea dar salida a este vehículo?")) {
            fecha_ingreso;
            let salida = new Date();
            let fechaSalida = salida.getFullYear() + '-' + (salida.getMonth() + 1) + '-' + salida.getDate() + ' ' + salida.getHours() + ':' + salida.getMinutes() + ':' + salida.getSeconds();
            let tiempo = ingreso.getHours() - salida.getHours();
            console.log(fechaIngreso);
            console.log(salida.getHours());
            let params = {
                proceso: 'actualizarRegistro',
                id_registro: id_registro,
                fecha_salida: fechaSalida,
                estado: 0,
                tiempo_parqueo: fechaIngreso - fechaSalida,
                valor_parqueo: tiempo * 1000
            };
            $http({
                method: 'POST',
                url: 'peticionesRegistro.jsp',
                params: params
            }).then(function (respuesta) {
                console.log(respuesta);
                alert('Salida exitosa');
            });
        }
        ;
    };
    $scope.mostrarFormularioMetodo = function () {
        $scope.mostrarListaContactos = false;
    };
});