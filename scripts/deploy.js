import hre from "hardhat";

async function main() {
  console.log("!!!Iniciando o deploy na Sepolia...");
  const Registro = await hre.ethers.getContractFactory("Registro");
  const registro = await Registro.deploy();

  await registro.waitForDeployment();
  console.log("!!!Contrato implantado com sucesso em:", await registro.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});