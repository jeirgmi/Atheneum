# Atheneum

Hey — welcome to **Atheneum** 👋

Atheneum is a community-built wiki for **Dust**. The idea is simple: anyone can contribute knowledge, lore, or facts about Dust. Moderators review submissions and (in future versions) contributors will earn on-chain rewards.

This repository includes:
- A Foundry-based smart contract scaffold (`src/WikiRegistry.sol`) for registering articles and contributions.
- A minimal static Next.js frontend (TypeScript + Tailwind) in `frontend/` to preview the UI.
- Deploy/test scripts for Foundry so you can run locally with `anvil`.

## Local setup (quick)

Prerequisites:
- Foundry (forge, anvil) installed
- Node.js v18+ and pnpm (or npm)

From project root:

```bash
# install OpenZeppelin contracts for Foundry
forge install OpenZeppelin/openzeppelin-contracts
forge remappings > remappings.txt

# build & test contracts
forge build
forge test

# start local chain
anvil

# in a new terminal, deploy locally (example)
export PRIVATE_KEY=<one-of-anvil-keys>
forge script script/Deploy.s.sol --rpc-url http://127.0.0.1:8545 --private-key $PRIVATE_KEY --broadcast
```

Frontend:

```bash
cd frontend
pnpm install
pnpm dev
# open http://localhost:3000
```

## Contributing

This project is community-first. If you want to help:
- Add article schemas or improve the contract flow in `src/WikiRegistry.sol`
- Build frontend pages to list articles and submit edits
- Add moderation UI and (later) token rewards

Have ideas? Open an issue or PR — let’s build this together 💪
