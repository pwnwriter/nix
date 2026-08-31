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

  # Rosé Pine tmTheme for syntax-highlighted file previews.
  xdg.configFile."yazi/rose-pine.tmTheme".text = theme.tmTheme;

  # Theme generated from the active palette (see modules/theme.nix).
  xdg.configFile."yazi/theme.toml".text = ''
    [app]
    overall = { bg = "${theme.base}" }

    [mgr]
    cwd = { fg = "${theme.teal}" }

    find_keyword  = { fg = "${theme.yellow}", italic = true }
    find_position = { fg = "${theme.pink}", bg = "reset", italic = true }

    marker_copied   = { fg = "${theme.green}", bg = "${theme.green}" }
    marker_cut      = { fg = "${theme.red}", bg = "${theme.red}" }
    marker_marked   = { fg = "${theme.teal}", bg = "${theme.teal}" }
    marker_selected = { fg = "${theme.maroon}", bg = "${theme.maroon}" }

    count_copied   = { fg = "${theme.base}", bg = "${theme.green}" }
    count_cut      = { fg = "${theme.base}", bg = "${theme.red}" }
    count_selected = { fg = "${theme.base}", bg = "${theme.maroon}" }

    border_symbol = "│"
    border_style  = { fg = "${theme.overlay1}" }

    syntect_theme = "~/.config/yazi/rose-pine.tmTheme"

    [tabs]
    active   = { fg = "${theme.base}", bg = "${theme.text}", bold = true }
    inactive = { fg = "${theme.text}", bg = "${theme.surface1}" }

    [mode]
    normal_main = { fg = "${theme.base}", bg = "${theme.maroon}", bold = true }
    normal_alt  = { fg = "${theme.maroon}", bg = "${theme.surface0}"}

    select_main = { fg = "${theme.base}", bg = "${theme.green}", bold = true }
    select_alt  = { fg = "${theme.green}", bg = "${theme.surface0}"}

    unset_main  = { fg = "${theme.base}", bg = "${theme.flamingo}", bold = true }
    unset_alt   = { fg = "${theme.flamingo}", bg = "${theme.surface0}"}

    [indicator]
    parent = { fg = "${theme.base}", bg = "${theme.text}" }
    current = { fg = "${theme.base}", bg = "${theme.maroon}" }
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
    border   = { fg = "${theme.maroon}" }
    title    = {}
    value    = {}
    selected = { reversed = true }

    [pick]
    border   = { fg = "${theme.maroon}" }
    active   = { fg = "${theme.pink}" }
    inactive = {}

    [confirm]
    border     = { fg = "${theme.maroon}" }
    title      = { fg = "${theme.maroon}" }
    body       = {}
    list       = {}
    btn_yes    = { reversed = true }
    btn_no     = {}

    [cmp]
    border = { fg = "${theme.maroon}" }

    [tasks]
    border  = { fg = "${theme.maroon}" }
    title   = {}
    hovered = { fg = "${theme.pink}", bold = true }

    [which]
    mask            = { bg = "${theme.surface0}" }
    cand            = { fg = "${theme.teal}" }
    rest            = { fg = "${theme.overlay2}" }
    desc            = { fg = "${theme.pink}" }
    separator       = "  "
    separator_style = { fg = "${theme.surface2}" }

    [help]
    on      = { fg = "${theme.teal}" }
    run     = { fg = "${theme.pink}" }
    desc    = { fg = "${theme.overlay2}" }
    hovered = { bg = "${theme.surface2}", bold = true }
    footer  = { fg = "${theme.text}", bg = "${theme.surface1}" }

    [notify]
    title_info  = { fg = "${theme.teal}" }
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
    	{ mime = "application/{pdf,doc,rtf}", fg = "${theme.sky}" },

    	# Virtual file system
    	{ mime = "vfs/{absent,stale}", fg = "${theme.surface1}" },

    	# Special file
    	{ url = "*", is = "orphan", bg = "${theme.red}" },
    	{ url = "*", is = "exec"  , fg = "${theme.green}" },

    	# Dummy file
    	{ url = "*", is = "dummy", bg = "${theme.red}" },
    	{ url = "*/", is = "dummy", bg = "${theme.red}" },

    	# Fallback
    	{ url = "*/", fg = "${theme.maroon}" },
    ]

    [spot]
    border = { fg = "${theme.maroon}" }
    title  = { fg = "${theme.maroon}" }
    tbl_cell = { fg = "${theme.maroon}", reversed = true }
    tbl_col = { bold = true }

    [icon]
    dirs = [
    	{ name = ".config", text = "", fg = "${theme.maroon}" },
    	{ name = ".git", text = "", fg = "${theme.maroon}" },
    	{ name = ".github", text = "", fg = "${theme.maroon}" },
    	{ name = ".npm", text = "", fg = "${theme.maroon}" },
    	{ name = "Desktop", text = "", fg = "${theme.maroon}" },
    	{ name = "Development", text = "", fg = "${theme.maroon}" },
    	{ name = "Documents", text = "", fg = "${theme.maroon}" },
    	{ name = "Downloads", text = "", fg = "${theme.maroon}" },
    	{ name = "Library", text = "", fg = "${theme.maroon}" },
    	{ name = "Movies", text = "", fg = "${theme.maroon}" },
    	{ name = "Music", text = "", fg = "${theme.maroon}" },
    	{ name = "Pictures", text = "", fg = "${theme.maroon}" },
    	{ name = "Public", text = "", fg = "${theme.maroon}" },
    	{ name = "Videos", text = "", fg = "${theme.maroon}" },
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
    	{ if = "dir", text = "", fg = "${theme.maroon}" },
    	{ if = "exec", text = "", fg = "${theme.green}" },
    	{ if = "!dir", text = "", fg = "${theme.text}" },
    ]
  '';
}
