{ ... }:
{
  services.yabai = {
    enable = true;
    config = {
      layout = "bsp";
      mouse_modifier = "alt";
      mouse_action1 = "move";
      mouse_action2 = "resize";
    };
    enableScriptingAddition = true;
    extraConfig = ''
      yabai -m rule --add app="^System" manage=off
      yabai -m rule --add title='^Settings' manage=off
      yabai -m rule --add app="^Software" manage=off
      yabai -m rule --add app='Finder' manage=off
      yabai -m rule --add app="Stocks" manage=off
      yabai -m rule --add app="Reminders" manage=off
      yabai -m rule --add app="FaceTime" manage=off
      yabai -m rule --add app="Stickies" manage=off
      yabai -m rule --add title='Archive Utility' manage=off
      yabai -m rule --add label="Calculator" app="Calculator" manage=off
      yabai -m rule --add app="Messages" manage=off
      yabai -m rule --add app="Infuse" manage=off
      yabai -m rule --add app="^da" manage=off
      yabai -m rule --add app="Mail" manage=off
      yabai -m rule --add app="Dictionary" manage=off
      yabai -m rule --add app="App Store" manage=off
      yabai -m rule --add app="Weather" manage=off
      yabai -m rule --add app="Mullvad VPN" manage=off sticky=off layer=above
      yabai -m rule --add app="choose" manage=off
      yabai -m rule --add app="Activity Monitor" manage=off
      yabai -m rule --add can-resize="^false$" manage=off
    '';
  };
}
