# Single source of truth for the system colour scheme (Rosé Pine).
#
# Switch the WHOLE system between light and dark by changing `variant` below:
#   "moon" -> Rosé Pine Moon (dark)
#   "dawn" -> Rosé Pine Dawn (light)
#
# Every module receives the active palette as the `theme` argument
# (via `_module.args`), e.g. `theme.love`, `theme.base`, `theme.pine`.
#
# Ghostty is the exception: it auto-switches with the macOS appearance
# using its built-in `rose-pine-moon` / `rose-pine-dawn` themes.
{ ... }:
let
  # <<< change this one line to reskin everything CLI (bat/yazi/eza/fzf/starship) >>>
  variant = "dawn";

  palettes = {
    # Rosé Pine Moon (dark)
    moon = {
      base = "#232136";
      surface = "#2a273f";
      overlay = "#393552";
      muted = "#6e6a86";
      subtle = "#908caa";
      text = "#e0def4";
      love = "#eb6f92";
      gold = "#f6c177";
      rose = "#ea9a97";
      pine = "#3e8fb0";
      foam = "#9ccfd8";
      iris = "#c4a7e7";
      highlightLow = "#2a283e";
      highlightMed = "#44415a";
      highlightHigh = "#56526e";
    };

    # Rosé Pine Dawn (light)
    dawn = {
      base = "#faf4ed";
      surface = "#fffaf3";
      overlay = "#f2e9e1";
      muted = "#9893a5";
      subtle = "#797593";
      text = "#464261";
      love = "#b4637a";
      gold = "#ea9d34";
      rose = "#d7827e";
      pine = "#286983";
      foam = "#56949f";
      iris = "#907aa9";
      highlightLow = "#f4ede8";
      highlightMed = "#dfdad9";
      highlightHigh = "#cecacd";
    };
  };

  rp = palettes.${variant};

  # Compatibility aliases: existing configs were written against Catppuccin
  # colour names, so map those names onto Rosé Pine roles. This lets the same
  # config templates render in either palette without edits.
  aliases = {
    red = rp.love;
    maroon = rp.rose;
    peach = rp.gold;
    yellow = rp.gold;
    green = rp.pine;
    teal = rp.foam;
    sky = rp.foam;
    sapphire = rp.foam;
    blue = rp.foam;
    lavender = rp.iris;
    mauve = rp.iris;
    pink = rp.iris;
    flamingo = rp.rose;
    rosewater = rp.rose;

    mantle = rp.surface;
    crust = rp.overlay;
    surface0 = rp.highlightLow;
    surface1 = rp.highlightMed;
    surface2 = rp.highlightHigh;
    overlay0 = rp.muted;
    overlay1 = rp.muted;
    overlay2 = rp.subtle;
    subtext0 = rp.subtle;
    subtext1 = rp.subtle;
  };

  # Minimal Rosé Pine tmTheme, generated from the active palette. Used by bat
  # (`--theme`) and yazi (`syntect_theme`) for syntax-highlighted previews.
  tmTheme = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>name</key>
      <string>Rosé Pine ${variant}</string>
      <key>settings</key>
      <array>
        <dict>
          <key>settings</key>
          <dict>
            <key>background</key><string>${rp.base}</string>
            <key>foreground</key><string>${rp.text}</string>
            <key>caret</key><string>${rp.text}</string>
            <key>invisibles</key><string>${rp.muted}</string>
            <key>lineHighlight</key><string>${rp.highlightMed}</string>
            <key>selection</key><string>${rp.highlightMed}</string>
          </dict>
        </dict>
        <dict>
          <key>scope</key><string>comment, punctuation.definition.comment</string>
          <key>settings</key><dict><key>foreground</key><string>${rp.muted}</string></dict>
        </dict>
        <dict>
          <key>scope</key><string>string, string.quoted, constant.character, punctuation.definition.string</string>
          <key>settings</key><dict><key>foreground</key><string>${rp.gold}</string></dict>
        </dict>
        <dict>
          <key>scope</key><string>constant.numeric, constant.language, constant.other</string>
          <key>settings</key><dict><key>foreground</key><string>${rp.rose}</string></dict>
        </dict>
        <dict>
          <key>scope</key><string>keyword, keyword.control, keyword.operator, storage, storage.type, storage.modifier</string>
          <key>settings</key><dict><key>foreground</key><string>${rp.pine}</string></dict>
        </dict>
        <dict>
          <key>scope</key><string>entity.name.function, support.function, meta.function-call, variable.function</string>
          <key>settings</key><dict><key>foreground</key><string>${rp.rose}</string></dict>
        </dict>
        <dict>
          <key>scope</key><string>entity.name.type, entity.name.class, support.type, support.class, entity.other.inherited-class</string>
          <key>settings</key><dict><key>foreground</key><string>${rp.foam}</string></dict>
        </dict>
        <dict>
          <key>scope</key><string>variable, variable.other, meta.definition.variable</string>
          <key>settings</key><dict><key>foreground</key><string>${rp.text}</string></dict>
        </dict>
        <dict>
          <key>scope</key><string>variable.parameter, variable.language</string>
          <key>settings</key><dict><key>foreground</key><string>${rp.iris}</string></dict>
        </dict>
        <dict>
          <key>scope</key><string>entity.other.attribute-name, entity.name.tag, support.type.property-name</string>
          <key>settings</key><dict><key>foreground</key><string>${rp.iris}</string></dict>
        </dict>
        <dict>
          <key>scope</key><string>keyword.operator.assignment, punctuation, meta.brace</string>
          <key>settings</key><dict><key>foreground</key><string>${rp.subtle}</string></dict>
        </dict>
        <dict>
          <key>scope</key><string>invalid, invalid.illegal</string>
          <key>settings</key><dict><key>foreground</key><string>${rp.love}</string></dict>
        </dict>
        <dict>
          <key>scope</key><string>markup.heading, markup.bold</string>
          <key>settings</key><dict><key>foreground</key><string>${rp.gold}</string><key>fontStyle</key><string>bold</string></dict>
        </dict>
        <dict>
          <key>scope</key><string>markup.inserted, markup.inserted.diff</string>
          <key>settings</key><dict><key>foreground</key><string>${rp.foam}</string></dict>
        </dict>
        <dict>
          <key>scope</key><string>markup.deleted, markup.deleted.diff</string>
          <key>settings</key><dict><key>foreground</key><string>${rp.love}</string></dict>
        </dict>
      </array>
    </dict>
    </plist>
  '';
in
{
  _module.args.theme = rp // aliases // {
    name = variant;
    isDark = variant == "moon";
    ghostty = {
      dark = "rose-pine-moon";
      light = "rose-pine-dawn";
    };
    inherit tmTheme;
  };
}
