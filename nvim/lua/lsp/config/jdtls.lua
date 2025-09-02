local api = require("api.api")
local spring = require("spring_boot")

local mason_path = vim.fn.stdpath('data') .. '/mason'
local jdtls_path = mason_path .. '/packages/jdtls'
local lombok_path = jdtls_path .. '/lombok.jar'

local os = api.get_os()

if not os then
  vim.notify("jdtls: Could not detect valid OS", vim.log.levels.ERROR)
end

local bundles = {}
vim.list_extend(bundles, spring.java_extensions())

local config = {
  cmd = {
      'java',
      '-javaagent:' .. lombok_path,
      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.level=ALL',
      '-Xmx1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens', 'java.base/java.util=ALL-UNNAMED',
      '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
      '-jar', vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
      '-configuration', jdtls_path .. '/config_' .. os,
      '-data', vim.fn.stdpath('data') .. '/jdtls-workspace'
  },

  -- `root_dir` must point to the root of your project.
  -- See `:help vim.fs.root`
  root_dir = vim.fs.root(0, {'gradlew', '.git', 'mvnw'}),

  settings = {
    java = {}
  },

  init_options = {
      bundles = bundles
  },
}


return {
    name = "jdtls",
    config = config
}
