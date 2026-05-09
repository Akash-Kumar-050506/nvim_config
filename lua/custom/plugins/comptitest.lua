return {
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
      require('competitest').setup {
        compile_command = {
          cpp = {
            exec = 'g++',
            args = {
              '-std=c++23',
              '-O2',
              '-Wall',
              '-Wextra',
              '-DLOCAL',
              '-march=native',
              '-o',
              'main',
              '$(FNAME)',
            },
          },
        },
        run_command = {
          cpp = {
            exec = './main',
          },
        },
        template_file = '~/cp/template.cpp',
        evaluate_template_modifiers = true,
        testcases_use_single_file = true,
        companion_port = 4244,
        received_problems_path = '$(HOME)/cp/problems/$(PROBLEM).$(FEXT)',
        received_contests_directory = '$(HOME)/cp/problems/$(CONTEST)',
      }
      vim.keymap.set('n', '<leader>cp', '<cmd>CompetiTest receive problem<CR>', { desc = '[C]ompetitest receive [P]roblem' })
      vim.keymap.set('n', '<leader>cc', '<cmd>CompetiTest receive contest<CR>', { desc = '[C]ompetitest receive [C]ontest' })
      vim.keymap.set('n', '<leader>cs', '<cmd>CompetiTest receive stop<CR>', { desc = '[C]ompetitest [S]top' })
      vim.keymap.set('n', '<leader>cr', '<cmd>CompetiTest run<CR>', { desc = '[C]ompetitest [R]un' })
      vim.keymap.set('n', '<leader>cu', '<cmd>CompetiTest show_ui<CR>', { desc = '[C]ompetitest show [U]I' })
      vim.keymap.set('n', '<leader>ca', '<cmd>CompetiTest add_testcase<CR>', { desc = '[C]ompetitest [A]dd testcase' })
    end,
  },
}
