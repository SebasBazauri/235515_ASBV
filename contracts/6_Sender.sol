// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract Sender {
    uint256 private cantidad = 20; // guarda enteros
    address public cuentaInicial;  //guarda direcciones

    constructor (uint256 _cantidad) {
        cantidad = _cantidad;
        cuentaInicial = msg.sender; //dirección que interactua con mi función
    }

    function cambiarCantidad(uint256 _cantidad) public {
        cantidad = _cantidad;
        cuentaInicial = msg.sender;
    }

    function obtenerCantidad() public view returns(uint256){
        return cantidad;
    }



}