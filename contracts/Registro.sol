pragma solidity ^0.8.20;

contract Registro
{
    struct Info
    {
        string dado;
        uint256 timestamp;
    }

    mapping(address => Info[]) public registros;
    event NovoRegistro(address usuario, string dado, uint256 timestamp);

    function registrar(string memory _dado) public
    {
        registros[msg.sender].push(Info(_dado, block.timestamp));
        emit NovoRegistro(msg.sender, _dado, block.timestamp);
    }

    function consultar(address _usuario) public view returns (Info[] memory)
    {
        return registros[_usuario];
    }
}