return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "jdtls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                ["tsserver"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.tsserver.setup {
                        capabilities = capabilities,
                        settings = {
                            typescript = {
                                preferences = {
                                    importModuleSpecifierPreference = "non-relative"
                                }
                            }
                        }
                    }
                end,

                ["vtsls"] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.vtsls.setup {
                        capabilities = capabilities,
                        settings = {
                            typescript = {
                                suggestionActions = {
                                    enabled = false,
                                },
                                inlayHints = {
                                    parameterNames = {
                                        enabled = "all",
                                    },
                                    parameterTypes = {
                                        enabled = true,
                                    },
                                    variableTypes = {
                                        enabled = true
                                    },
                                    functionLikeReturnTypes = {
                                        enabled = true
                                    },
                                }
                            }
                        }
                    }
                end,

                ["jdtls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.jdtls.setup({
                        capabilities = capabilities,
                        root_dir = lspconfig.util.root_pattern("pom.xml", "build.gradle", "build.gradle.kts", ".git") or vim.fn.getcwd(),
                        settings = {
                          java = {
                            eclipse = { downloadSources = true },
                            configuration = { updateBuildConfiguration = "interactive" },
                            maven = { downloadSources = true },
                            implementationsCodeLens = { enabled = true },
                            referencesCodeLens = { enabled = true },
                            inlayHints = { parameterNames = { enabled = "all" } },
                            signatureHelp = { enabled = true },
                            completion = {
                              favoriteStaticMembers = {
                                "org.hamcrest.MatcherAssert.assertThat",
                                "org.hamcrest.Matchers.*",
                                "org.hamcrest.CoreMatchers.*",
                                "org.junit.jupiter.api.Assertions.*",
                                "java.util.Objects.requireNonNull",
                                "java.util.Objects.requireNonNullElse",
                                "org.mockito.Mockito.*",
                              },
                            },
                            sources = {
                              organizeImports = {
                                starThreshold = 9999,
                                staticStarThreshold = 9999,
                              },
                            },
                          },
                        },
                    })
                end
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
}
