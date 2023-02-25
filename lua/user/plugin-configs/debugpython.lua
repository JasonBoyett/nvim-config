local call = pcall(require, "dap")
if not call then
    return
end

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

require('dap-python').test_runner = 'pytest'
