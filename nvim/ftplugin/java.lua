local jdtls = require('jdtls')
local mason_path = vim.fn.stdpath('data') .. '/mason'

local jdtls_path = mason_path .. '/packages/jdtls'
local lombok_path = jdtls_path .. '/lombok.jar'

local os = "unknown-os"
if vim.fn.has("mac") == 1 then
  os = "mac"
elseif vim.fn.has("unix") == 1 then
  os = "linux"
elseif vim.fn.has("win32") == 1 then
  os = "win"
end

if not os or os == "unknown-os" then
  vim.notify("jdtls: Could not detect valid OS", vim.log.levels.ERROR)
end

local cmplsp = require("cmp_nvim_lsp")
local capabilities = cmplsp.default_capabilities()

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/jdtls-workspace/' .. project_name

local config = {
    cmd = {
      'java',
      '-javaagent:' .. lombok_path,
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xmx1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
      '-jar', vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
      '-configuration', jdtls_path .. '/config_' .. os,
      '-data', workspace_dir
    },

    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),

    capabilities = capabilities,
}

jdtls.start_or_attach(config)
