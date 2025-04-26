async function main() {
    const PublicChat = await ethers.getContractFactory("PublicChat");
    const publicChat = await PublicChat.deploy();
  
    await publicChat.waitForDeployment();  
    console.log(`PublicChat deployed to: ${publicChat.target}`);
  }
  
  main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
  