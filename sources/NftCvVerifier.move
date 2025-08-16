module movecv::NftCvVerifier {
    use aptos_framework::signer;

    /// Struct representing a user's NFT portfolio and CV status.
    struct Portfolio has key, store {
        nfts: vector<u64>, // List of NFT IDs (for simplicity)
        verified: bool,    // Whether the CV is verified
    }

    /// Register a new NFT portfolio (unverified by default).
    public fun register_portfolio(account: &signer, nfts: vector<u64>) {
        let portfolio = Portfolio {
            nfts,
            verified: false,
        };
        move_to(account, portfolio);
    }

    /// Verify the user's CV (can only be called by a verifier).
    public fun verify_cv(verifier: &signer, user: address) acquires Portfolio {
        let portfolio = borrow_global_mut<Portfolio>(user);
        // In a real contract, add access control for verifier
        portfolio.verified = true;
    }
}
