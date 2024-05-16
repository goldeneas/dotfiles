local lsp = vim.lsp

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
      virtual_text = false,
      underline = false,
      severity_sort = true,
    }
)
