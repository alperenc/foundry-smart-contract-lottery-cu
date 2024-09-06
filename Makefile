-include .env

.PHONY: all build test test-forked deploy deploy-sepolia

install:
	forge install cyfrin/foundry-devops@0.2.2 --no-commit && forge install smartcontractkit/chainlink-brownie-contracts@1.1.1 --no-commit && forge install foundry-rs/forge-std@1.8.2 --no-commit && forge install transmissions11/solmate@v6 --no-commit

update:; forge update

build:; forge build

test:; forge test -vvvv

test-forked:; forge test --fork-url $(ALCHEMY_SEPOLIA_RPC_URL)

deploy:;

deploy-anvil:
	forge script script/DeployRaffle.s.sol:DeployRaffle --rpc-url http://127.0.0.1:8545 --account anvil_0 --broadcast -vvvv

deploy-sepolia:
	forge script script/DeployRaffle.s.sol:DeployRaffle --rpc-url $(ALCHEMY_SEPOLIA_RPC_URL) --account metamask_2 --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv