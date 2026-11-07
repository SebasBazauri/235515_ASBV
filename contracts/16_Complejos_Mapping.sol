// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract ComplejosMapping{
    
    struct Alumno {
        uint256 codigo;
        string nombre;
        uint256 edad;
    }

    mapping(uint256 => Alumno) private alumnos;

    mapping(address => uint256) public saldoCuentas;

    function agregarAlumno(uint256 _codigo, string memory _nombre, uint256 _edad) public {
        //alumnos.push(Alumno(_codigo, _nombre, _edad));
        alumnos[_codigo] = Alumno(_codigo, _nombre, _edad);
    }
}