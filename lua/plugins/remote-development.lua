local config = function()
    require("remote-nvim").setup({
      devpod = {
        binary = "devpod", -- Make sure you have devpod >= 0.5.0 installed
        docker_binary = "docker",
        ssh_config_path = vim.fn.stdpath("data") .. "/remote-nvim/ssh_config",
        search_style = "current_dir_only",
        dotfiles = {
          path = nil,
          install_script = nil,
        },
        gpg_agent_forwarding = false,
        container_list = "running_only",
      },
      ssh_config = {
        ssh_binary = "ssh",
        scp_binary = "scp",
        ssh_config_file_paths = { "$HOME/.ssh/config" },
        ssh_prompts = {
          {
            match = "password:",
            type = "secret",
            value_type = "static",
            value = "",
          },
          {
            match = "continue connecting (yes/no/[fingerprint])?",
            type = "plain",
            value_type = "static",
            value = "",
          },
        },
      },
      progress_view = {
        type = "popup",
      },
    })
end


return {
   "amitds1997/remote-nvim.nvim",
   version = "*", -- Pin to GitHub releases
   dependencies = {
       "nvim-lua/plenary.nvim", -- For standard functions
       "MunifTanjim/nui.nvim", -- To build the plugin UI
       "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
   },
   config = config,
   lazy = false,
}
