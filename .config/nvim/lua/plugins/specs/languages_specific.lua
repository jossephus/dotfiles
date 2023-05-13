return {
    -- Rust
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = function()
            require("crates").setup({
                null_ls = {
                    enabled = true,
                    name = "crates.nvim",
                },
            })
        end,
    },

    -- Vim
    --{
        --"folke/neodev.nvim",
        --config = function()
            --require("neodev").setup({})
        --end,
    --},
}
