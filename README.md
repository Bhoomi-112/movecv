# movecv: NFT Portfolio & CV Verifier (Aptos Move)

This project is a simple Move smart contract for the Aptos blockchain that allows users to register their NFT portfolio and enables verifiers to verify a user's CV. It is designed as a minimal example for learning and prototyping.

## Features
- **Register NFT Portfolio:** Users can register their NFT portfolio (as a vector of NFT IDs).
- **CV Verification:** A verifier can mark a user's CV as verified.

## Smart Contract Overview
- The contract is located at `sources/NftCvVerifier.move`.
- The main struct is `Portfolio`, which stores a user's NFT IDs and verification status.
- There are only two public functions:
  - `register_portfolio(account: &signer, nfts: vector<u64>)`: Registers a new portfolio for the user.
  - `verify_cv(verifier: &signer, user: address)`: Marks the user's CV as verified (access control can be added).

## Usage

### 1. Configure Module Address
Edit `Move.toml` and set the address for the module:

```
[addresses]
movecv = "0x123"
```

### 2. Compile the Contract
Run:
```
aptos move compile
```

### 3. Run Tests
Add tests in the `tests/` directory and run:
```
aptos move test
```

## File Structure
- `sources/NftCvVerifier.move` — Main smart contract
- `Move.toml` — Project configuration
- `tests/` — Directory for Move tests
- `scripts/` — Directory for deployment or interaction scripts

## Example
```move
// Register a portfolio
NftCvVerifier::register_portfolio(&account, vector[1, 2, 3]);

// Verify a user's CV
NftCvVerifier::verify_cv(&verifier, @user_address);
```

## License
MIT
