// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract ComplejosStruct {
    
    struct Alumno {
        uint256 codigo;
        string nombre;
        uint256 edad;
    }

    Alumno[] private alumnos;

    function agregarAlumno(uint256 _codigo, string memory _nombre, uint256 _edad) public {
        alumnos.push(Alumno(_codigo, _nombre, _edad));
    }

    //se puede devolver más que un resultado
    function mostrarAlumnoV1(uint256 _indice) public view returns(uint256 Codigo, string memory Nombre) {
        //return(269782, "Vanesa");
        return(alumnos[_indice].codigo, alumnos[_indice].nombre);
    }

    function mostrarAlumnoV2(uint256 _indice) public view returns(uint256 Codigo, string memory Nombre, uint256 Edad) {
        Alumno storage al = alumnos[_indice];
        return(al.codigo, al.nombre, al.edad);
    }

    function mostarAlumnoV3(uint256 _indice) public view returns(Alumno memory alumno){
        require(_indice < alumnos.length, "Posicion Incorrecta");
        Alumno memory al = alumnos[_indice];
        return(al);
    }

    function cambiarEdadAlumno(uint256 _codigo) public {
        
        for(uint i=0; i < alumnos.length; i++){
            Alumno storage al = alumnos[i];

            if(al.codigo == _codigo){
                al.edad = al.edad +1;
            }
        }
    }
}