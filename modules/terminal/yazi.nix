{ theme, ... }:
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  xdg.configFile."yazi/init.lua".text = ''
    require("session"):setup {
      sync_yanked = true,
    }
  '';

  # Evergarden tmTheme for syntax-highlighted file previews.
  xdg.configFile."yazi/evergarden.tmTheme".text = theme.tmTheme;

  # Theme generated from the active palette (see modules/theme.nix).
  xdg.configFile."yazi/theme.toml".text = ''
    [app]
    overall = { bg = "${theme.base}" }

    [mgr]
    cwd = { fg = "${theme.aqua}" }

    find_keyword  = { fg = "${theme.yellow}", italic = true }
    find_position = { fg = "${theme.pink}", bg = "reset", italic = true }

    marker_copied   = { fg = "${theme.green}", bg = "${theme.green}" }
    marker_cut      = { fg = "${theme.red}", bg = "${theme.red}" }
    marker_marked   = { fg = "${theme.aqua}", bg = "${theme.aqua}" }
    marker_selected = { fg = "${theme.orange}", bg = "${theme.orange}" }

    count_copied   = { fg = "${theme.base}", bg = "${theme.green}" }
    count_cut      = { fg = "${theme.base}", bg = "${theme.red}" }
    count_selected = { fg = "${theme.base}", bg = "${theme.orange}" }

    border_symbol = "│"
    border_style  = { fg = "${theme.overlay1}" }

    syntect_theme = "~/.config/yazi/evergarden.tmTheme"

    [tabs]
    active   = { fg = "${theme.base}", bg = "${theme.text}", bold = true }
    inactive = { fg = "${theme.text}", bg = "${theme.surface1}" }

    [mode]
    normal_main = { fg = "${theme.base}", bg = "${theme.orange}", bold = true }
    normal_alt  = { fg = "${theme.orange}", bg = "${theme.surface0}"}

    select_main = { fg = "${theme.base}", bg = "${theme.green}", bold = true }
    select_alt  = { fg = "${theme.green}", bg = "${theme.surface0}"}

    unset_main  = { fg = "${theme.base}", bg = "${theme.cherry}", bold = true }
    unset_alt   = { fg = "${theme.cherry}", bg = "${theme.surface0}"}

    [indicator]
    parent = { fg = "${theme.base}", bg = "${theme.text}" }
    current = { fg = "${theme.base}", bg = "${theme.orange}" }
    preview = { fg = "${theme.base}", bg = "${theme.text}" }

    [status]
    sep_left  = { open = "", close = "" }
    sep_right = { open = "", close = "" }

    progress_label  = { fg = "${theme.text}", bold = true }
    progress_normal = { fg = "${theme.green}", bg = "${theme.surface1}" }
    progress_error  = { fg = "${theme.yellow}", bg = "${theme.red}" }

    perm_type  = { fg = "${theme.blue}" }
    perm_read  = { fg = "${theme.yellow}" }
    perm_write = { fg = "${theme.red}" }
    perm_exec  = { fg = "${theme.green}" }
    perm_sep   = { fg = "${theme.overlay1}" }

    [input]
    border   = { fg = "${theme.orange}" }
    title    = {}
    value    = {}
    selected = { reversed = true }

    [pick]
    border   = { fg = "${theme.orange}" }
    active   = { fg = "${theme.pink}" }
    inactive = {}

    [confirm]
    border     = { fg = "${theme.orange}" }
    title      = { fg = "${theme.orange}" }
    body       = {}
    list       = {}
    btn_yes    = { reversed = true }
    btn_no     = {}

    [cmp]
    border = { fg = "${theme.orange}" }

    [tasks]
    border  = { fg = "${theme.orange}" }
    title   = {}
    hovered = { fg = "${theme.pink}", bold = true }

    [which]
    mask            = { bg = "${theme.surface0}" }
    cand            = { fg = "${theme.aqua}" }
    rest            = { fg = "${theme.overlay2}" }
    desc            = { fg = "${theme.pink}" }
    separator       = "  "
    separator_style = { fg = "${theme.surface2}" }

    [help]
    on      = { fg = "${theme.aqua}" }
    run     = { fg = "${theme.pink}" }
    desc    = { fg = "${theme.overlay2}" }
    hovered = { bg = "${theme.surface2}", bold = true }
    footer  = { fg = "${theme.text}", bg = "${theme.surface1}" }

    [notify]
    title_info  = { fg = "${theme.aqua}" }
    title_warn  = { fg = "${theme.yellow}" }
    title_error = { fg = "${theme.red}" }

    [filetype]
    rules = [
    	# Media
    	{ mime = "image/*", fg = "${theme.yellow}" },
    	{ mime = "{audio,video}/*", fg = "${theme.pink}" },

    	# Archives
    	{ mime = "application/{zip,rar,7z*,tar,gzip,xz,zstd,bzip*,lzma,compress,archive,cpio,arj,xar,ms-cab*}", fg = "${theme.red}" },

    	# Documents
    	{ mime = "application/{pdf,doc,rtf}", fg = "${theme.skye}" },

    	# Virtual file system
    	{ mime = "vfs/{absent,stale}", fg = "${theme.surface1}" },

    	# Special file
    	{ url = "*", is = "orphan", bg = "${theme.red}" },
    	{ url = "*", is = "exec"  , fg = "${theme.green}" },

    	# Dummy file
    	{ url = "*", is = "dummy", bg = "${theme.red}" },
    	{ url = "*/", is = "dummy", bg = "${theme.red}" },

    	# Fallback
    	{ url = "*/", fg = "${theme.orange}" },
    ]

    [spot]
    border = { fg = "${theme.orange}" }
    title  = { fg = "${theme.orange}" }
    tbl_cell = { fg = "${theme.orange}", reversed = true }
    tbl_col = { bold = true }

    [icon]
    dirs = [
    	{ name = ".config", text = "", fg = "${theme.orange}" },
    	{ name = ".git", text = "", fg = "${theme.orange}" },
    	{ name = ".github", text = "", fg = "${theme.orange}" },
    	{ name = ".npm", text = "", fg = "${theme.orange}" },
    	{ name = "Desktop", text = "", fg = "${theme.orange}" },
    	{ name = "Development", text = "", fg = "${theme.orange}" },
    	{ name = "Documents", text = "", fg = "${theme.orange}" },
    	{ name = "Downloads", text = "", fg = "${theme.orange}" },
    	{ name = "Library", text = "", fg = "${theme.orange}" },
    	{ name = "Movies", text = "", fg = "${theme.orange}" },
    	{ name = "Music", text = "", fg = "${theme.orange}" },
    	{ name = "Pictures", text = "", fg = "${theme.orange}" },
    	{ name = "Public", text = "", fg = "${theme.orange}" },
    	{ name = "Videos", text = "", fg = "${theme.orange}" },
    ]
    conds = [
    	# Special files
    	{ if = "orphan", text = "", fg = "${theme.text}" },
    	{ if = "link", text = "", fg = "${theme.subtext0}" },
    	{ if = "block", text = "", fg = "${theme.yellow}" },
    	{ if = "char", text = "", fg = "${theme.yellow}" },
    	{ if = "fifo", text = "", fg = "${theme.yellow}" },
    	{ if = "sock", text = "", fg = "${theme.yellow}" },
    	{ if = "sticky", text = "", fg = "${theme.yellow}" },
    	{ if = "dummy", text = "", fg = "${theme.red}" },

    	# Fallback
    	{ if = "dir", text = "", fg = "${theme.orange}" },
    	{ if = "exec", text = "", fg = "${theme.green}" },
    	{ if = "!dir", text = "", fg = "${theme.text}" },
    ]
  '';
}
