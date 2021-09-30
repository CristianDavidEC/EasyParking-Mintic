/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var app = angular.module('easyParking', []);
app.controller('controladorRegistro', function ($scope, $http) {
    $scope.guardarRegistro = function () {
        let registro = {
            proceso: "guardarRegistro",
            fecha_ingreso: "d",
            num_plaza: $scope.plaza
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