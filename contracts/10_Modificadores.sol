// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Modificador {
    address public propietario;
    uint256 private fondos;

    constructor() {
        propietario = msg.sender;
    }

    modifier esPropietario(){
        require(msg.sender == propietario, "No puedes ejecutar pq no eres el propietario del contrato");
        _;
    }

    function depositarFondos(uint256 _monto) public esPropietario {
        fondos = fondos + _monto; //fondos +=monto
    }

    function retirarFondos(uint256 _monto) public esPropietario {
        require(fondos >= _monto, "No hay fondos suficientes para retirar");
        fondos = fondos - _monto;
    }

    function consultarFondos() public view returns (uint256){
        return fondos;
    }

    function limpiarFondos() public esPropietario {
        //require(msg.sender == propietario, "No puedes ejecutar pq no eres el propietario del contrato");
        fondos = 0;
    }

}