local api = require("api")
local spring = require("spring_boot")

local mason_path = vim.fn.stdpath('data') .. '/mason'
local jdtls_path = mason_path .. '/packages/jdtls'
local lombok_jar = jdtls_path .. '/lombok.jar'

local java_test_path = mason_path .. '/packages/java-test'
local java_debug_path = mason_path .. '/packages/java-debug-adapter'
local java_debug_jar = vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java*")

local os = api.get_os()
if not os then
    vim.notify("jdtls: Could not detect valid OS", vim.log.levels.ERROR)
end

local bundles = {}

-- add java-debug
table.insert(bundles, java_debug_jar)

-- add java-test
local java_test_bundles = vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar", 1), "\n")
local excluded = {
    "com.microsoft.java.test.runner-jar-with-dependencies.jar",
    "jacocoagent.jar",
}
for _, java_test_jar in ipairs(java_test_bundles) do
    local fname = vim.fn.fnamemodify(java_test_jar, ":t")
    if not vim.tbl_contains(excluded, fname) then
        table.insert(bundles, java_test_jar)
    end
end

-- add spring
vim.list_extend(bundles, spring.java_extensions())

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/jdtls-workspace/' .. project_name

return {
    cmd = {
        'java',
        '-javaagent:' .. lombok_jar,
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
        '-data', workspace_dir
    },

    -- `root_dir` must point to the root of your project.
    -- See `:help vim.fs.root`
    root_dir = vim.fs.root(0, { '.git', 'gradlew', '.gitignore', 'mvnw', 'pom.xml', 'build.gradle' }),

    -- more settings at:
    -- https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- and
    -- https://github.com/redhat-developer/vscode-java/blob/8bec23010f419a3fa541b6a1ff194fa670b20918/package.json#L1194
    settings = {
        java = {
            signatureHelp = {
                enabled = true
            },

            saveActions = {
                organizeImports = true,
                cleanup = true,
            },

            cleanup = {
                actionsOnSave = {
                    "addOverride",
                    "addDeprecated",
                    "invertEquals",
                    -- "qualifyMembers",
                    -- "instanceofPatternMatch", disabled: only supported on java16+
                    -- "lambdaExpression",
                    -- "switchExpression",
                },
            },

            codeGeneration = {
                insertionLocation = "lastMember",
            },
        }
    },

    init_options = {
        bundles = bundles,
    },
}
