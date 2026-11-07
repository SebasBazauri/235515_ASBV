// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract Consola {
    
    uint256 private cantidad;

    function cambiarCantidad(uint256 _cantidad) public {
        console.log("Invocado por: ", msg.sender);
        cantidad = _cantidad;
    }

    function obtenerCantidad() public view returns(uint256) {
        console.log("Invocado por: ", msg.sender);
        return cantidad;
    }

}