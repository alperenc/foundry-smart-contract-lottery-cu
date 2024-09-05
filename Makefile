-include .env

.PHONY: build test test-forked deploy-sepolia

build:
	forge build

test:
	forge test

test-forked: 
	forge test --fork-url $(ALCHEMY_SEPOLIA_RPC_URL)

deploy-sepolia:
	forge script script/DeployRaffle.s.sol:DeployRaffle --rpc-url $(ALCHEMY_SEPOLIA_RPC_URL) --account metamask_2 --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY)