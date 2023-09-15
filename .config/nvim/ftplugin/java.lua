local jdtls_dir = vim.fn.expand('~/Softwares/jdtls')
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local config = {
    root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.level=ALL',
        '-Xmx1G',
        '-jar',
        jdtls_dir .. '/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
        '-configuration',
        jdtls_dir .. '/config_linux',
        '-data',
        vim.fn.expand('~/.cache/jdtls/workspace/') .. workspace_dir,
    },
}

require('jdtls').start_or_attach(config)
