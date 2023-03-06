local dap, dapgo, dapui =require("dap"), require("dap-go"),require("dapui")

dapgo.setup()

dap.listeners.after.event_initialized["dapui_config"]=function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"]=function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"]=function() dapui.close() end

dap.configurations.go = {
  {
    type = "go",
    request = "launch",
    name = "Debug",
    program = "${file}",
  },
}
