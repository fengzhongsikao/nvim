return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      "vue-language-server",
      "vtsls",
      "goimports",
      "gofumpt",
    },
  },
}
