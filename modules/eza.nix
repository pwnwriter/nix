{ theme, ... }:
{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    git = true;
    extraOptions = [
      "-T"
      "-L"
      "1"
    ];
  };

  # Theme generated from the active palette (see modules/theme.nix).
  xdg.configFile."eza/theme.yml".text = ''
    colourful: true

    filekinds:
      normal: {foreground: "${theme.text}"}
      directory: {foreground: "${theme.maroon}"}
      symlink: {foreground: "${theme.blue}"}
      pipe: {foreground: "${theme.subtext1}"}
      block_device: {foreground: "${theme.maroon}"}
      char_device: {foreground: "${theme.maroon}"}
      socket: {foreground: "${theme.subtext1}"}
      special: {foreground: "${theme.mauve}"}
      executable: {foreground: "${theme.green}"}
      mount_point: {foreground: "${theme.teal}"}

    perms:
      user_read: {foreground: "${theme.red}", is_bold: true}
      user_write: {foreground: "${theme.yellow}", is_bold: true}
      user_execute_file: {foreground: "${theme.green}", is_bold: true}
      user_execute_other: {foreground: "${theme.green}", is_bold: true}
      group_read: {foreground: "${theme.red}"}
      group_write: {foreground: "${theme.yellow}"}
      group_execute: {foreground: "${theme.green}"}
      other_read: {foreground: "${theme.red}"}
      other_write: {foreground: "${theme.yellow}"}
      other_execute: {foreground: "${theme.green}"}
      special_user_file: {foreground: "${theme.mauve}"}
      special_other: {foreground: "${theme.overlay1}"}
      attribute: {foreground: "${theme.overlay2}"}

    size:
      major: {foreground: "${theme.subtext0}"}
      minor: {foreground: "${theme.sky}"}
      number_byte: {foreground: "${theme.subtext1}"}
      number_kilo: {foreground: "${theme.subtext0}"}
      number_mega: {foreground: "${theme.blue}"}
      number_giga: {foreground: "${theme.mauve}"}
      number_huge: {foreground: "${theme.mauve}"}
      unit_byte: {foreground: "${theme.subtext0}"}
      unit_kilo: {foreground: "${theme.sky}"}
      unit_mega: {foreground: "${theme.mauve}"}
      unit_giga: {foreground: "${theme.mauve}"}
      unit_huge: {foreground: "${theme.teal}"}

    users:
      user_you: {foreground: "${theme.text}"}
      user_root: {foreground: "${theme.red}"}
      user_other: {foreground: "${theme.maroon}"}
      group_yours: {foreground: "${theme.subtext0}"}
      group_other: {foreground: "${theme.overlay2}"}
      group_root: {foreground: "${theme.red}"}

    links:
      normal: {foreground: "${theme.blue}"}
      multi_link_file: {foreground: "${theme.blue}"}

    git:
      new: {foreground: "${theme.green}"}
      modified: {foreground: "${theme.yellow}"}
      deleted: {foreground: "${theme.maroon}"}
      renamed: {foreground: "${theme.teal}"}
      typechange: {foreground: "${theme.pink}"}
      ignored: {foreground: "${theme.overlay1}"}
      conflicted: {foreground: "${theme.peach}"}

    git_repo:
      branch_main: {foreground: "${theme.subtext0}"}
      branch_other: {foreground: "${theme.mauve}"}
      git_clean: {foreground: "${theme.green}"}
      git_dirty: {foreground: "${theme.maroon}"}

    security_context:
      colon: {foreground: "${theme.overlay0}"}
      user: {foreground: "${theme.overlay1}"}
      role: {foreground: "${theme.mauve}"}
      typ: {foreground: "${theme.surface2}"}
      range: {foreground: "${theme.mauve}"}

    file_type:
      image: {foreground: "${theme.yellow}"}
      video: {foreground: "${theme.red}"}
      music: {foreground: "${theme.green}"}
      lossless: {foreground: "${theme.teal}"}
      crypto: {foreground: "${theme.overlay1}"}
      document: {foreground: "${theme.text}"}
      compressed: {foreground: "${theme.pink}"}
      temp: {foreground: "${theme.maroon}"}
      compiled: {foreground: "${theme.sapphire}"}
      source: {foreground: "${theme.blue}"}

    punctuation: {foreground: "${theme.overlay0}"}
    date: {foreground: "${theme.yellow}"}
    inode: {foreground: "${theme.subtext0}"}
    blocks: {foreground: "${theme.overlay0}"}
    header: {foreground: "${theme.text}"}
    octal: {foreground: "${theme.teal}"}
    flags: {foreground: "${theme.mauve}"}

    symlink_path: {foreground: "${theme.sky}"}
    control_char: {foreground: "${theme.sapphire}"}
    broken_symlink: {foreground: "${theme.red}"}
    broken_path_overlay: {foreground: "${theme.surface2}"}
  '';
}
