local dap = require("dap")

dap.configurations.java = {
    {
        type = "java",
        request = "attach",
        name = "default: Attach to Gradle Debug (5005)",
        hostName = "127.0.0.1",
        port = 5005,
    }
}
