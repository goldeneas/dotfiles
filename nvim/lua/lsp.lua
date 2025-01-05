local lsp = vim.lsp

vim.diagnostic.config({
    virtual_text = false,
})

lsp.handlers["textDocument/hover"] = lsp.with(
    vim.lsp.handlers.hover, {
        border = "rounded"
    }
)

lsp.handlers["textDocument/signatureHelp"] = lsp.with(
    vim.lsp.handlers.hover, {
        border = "rounded"
    }
)

lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = false,
      severity_sort = true,
    }
)
