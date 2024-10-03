# Voting System - Contrato de Votación Descentralizado
Este proyecto es un contrato inteligente desarrollado en Solidity para implementar un sistema de votación descentralizado en la red Ethereum. Permite a los usuarios votar por propuestas, con una limitación de tiempo y acceso controlado mediante una lista blanca (whitelist).

# Características:
Permite agregar una lista de propuestas, donde cada una tiene un nombre y un contador de votos.
Solo el propietario del contrato (quien lo despliega) tiene permisos para agregar nuevas propuestas.
Se utiliza una lista blanca (whitelist) de direcciones de Ethereum, donde solo las direcciones permitidas pueden votar.
Las direcciones de la lista blanca pueden votar por una sola propuesta y solo una vez.
La votación está limitada a un período de 3 días a partir del despliegue del contrato.
Requisitos

Solidity 0.8.x o superior.
Entorno de desarrollo Remix (https://remix.ethereum.org/).
Red de pruebas Sepolia.
MetaMask (https://metamask.io/es/) para interactuar con la red de Ethereum.
ETH de prueba de la red Sepolia (puedes obtenerlo de un faucet como https://faucets.chain.link/).
Funcionalidades del Contrato
Estructura Proposal
Cada propuesta tiene un nombre y un contador de votos. Se almacena en una lista pública proposals.

solidity
Copiar código
struct Proposal {
    string name;
    uint voteCount;
}

# Variables Clave

## owner: 

Dirección del propietario que desplegó el contrato y que tiene permisos exclusivos para agregar propuestas y manejar la whitelist.
whitelist: Mapeo de direcciones permitidas para votar.
hasVoted: Registro de direcciones que ya han votado.
proposals: Array que almacena las propuestas.
votingDeadline: Marca el tiempo límite para votar (3 días desde el despliegue).

## Funciones Principales:
addProposal(string proposalName)
Permite al propietario agregar una nueva propuesta. Solo la cuenta que desplegó el contrato puede ejecutar esta función.

## Conectar MetaMask:

Asegúrate de que tu billetera MetaMask esté conectada a la red de pruebas Sepolia.
Asegúrate de tener ETH de prueba en tu billetera (puedes obtenerlo en https://faucets.chain.link/).
Desplegar el Contrato:

En Remix, selecciona el contrato VotingSystem en la pestaña de despliegue ("Deploy & Run Transactions").
Despliega el contrato.
Copia la dirección del contrato desplegado.
Interacción con el Contrato:

Usa las funciones de Remix para interactuar con el contrato desplegado, añadiendo propuestas y votando.
Ejemplo de Uso


###  Agregar una Propuesta:

addProposal("Propuesta 1")
Solo el propietario puede agregar propuestas. El nombre de la propuesta será "Propuesta 1".

### Agregar una Dirección a la Whitelist

addToWhitelist(0x1234...)
Solo el propietario puede agregar direcciones a la lista blanca para que puedan votar.

### Votar por una Propuesta

vote(0)
Permite a una dirección de la whitelist votar por la propuesta en el índice 0.

### Ver Número de Propuestas
getProposalsCount()
Devuelve el número total de propuestas almacenadas en el contrato.