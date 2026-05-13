local actions       = require('telescope.actions')
local actions_state = require('telescope.actions.state')
local finders       = require('telescope.finders')
local pickers       = require('telescope.pickers')

telescope_action = function(vs)
  local opts = require("telescope.themes").get_dropdown {}
  pickers.new(opts, {
    finder = finders.new_table {
      results = vs,
      entry_maker = function(entry)
        return {
          display = entry.s and entry.k .. ' | ' .. entry.s or entry.k,
          ordinal = entry.k,
          value = entry,
        }
      end
    },
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = actions_state.get_selected_entry()
        selection.value.a()
      end)
      return true
    end,
  }):find()
end
