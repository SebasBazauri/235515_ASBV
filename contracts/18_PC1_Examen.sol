// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Veterinaria235515 {
    struct Mascota {
        uint256 id;
        string apodo;
        uint256 edad;
        string raza;
        bool estado;
    }

    Mascota[] public mascotas;

    uint256 public posicion;
    address public direccion;

    constructor(uint256 _posicion) {
        posicion = _posicion;
        direccion = msg.sender;
    }

    function agregarElemento(uint256 _id, string memory _apodo, uint256 _edad, string memory _raza, bool _estado) public {
        require(_id % 2 == 0, "No se permiten id impares");
        mascotas.push(Mascota(_id, _apodo, _edad, _raza, _estado));
    }

    function contarElementos() public view returns (uint256) {
        return mascotas.length;
    }

    function cambiarDireccion(address _nueva) public {
        direccion = _nueva;
    }

    function inactivar(uint256 _id) external {
        for (uint256 i = 0; i < mascotas.length; i++) {
            if (mascotas[i].id == _id) {
                mascotas[i].estado = false;
            }
        }
    }
}