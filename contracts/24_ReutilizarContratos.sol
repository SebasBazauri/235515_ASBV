// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract CalculadoraNotas {

    function calcularNotaFinal(uint256 _teoria, uint256 _practica, uint256 _laboratorio) public pure returns (uint256) {
    return (_teoria * 25 + _practica * 25 + _laboratorio * 50) / 3;
    }

}

contract RegistroNotas is Ownable {
    address public addressCalculadora;

    mapping(address => uint256) public notasAlumnos;

    constructor(address _addressCalculadora) Ownable(msg.sender) {
        addressCalculadora = _addressCalculadora;
    }

    function registrarNota(address _addressAlumno, uint256 _teoria, uint256 _practica, uint256 _laboratorio) onlyOwner public {
        CalculadoraNotas calculadora = CalculadoraNotas(addressCalculadora);
        uint256 notaFinal = calculadora.calcularNotaFinal(_teoria, _practica, _laboratorio);
         notasAlumnos[_addressAlumno] = notaFinal;
    }
    
    function verMiNota() public view returns(uint256) {
        return notasAlumnos[msg.sender];
    }
}