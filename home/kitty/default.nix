{ config, lib, pkgs, ... }: {
  options.h = {
    kitty.enable = lib.mkEnableOption "Enable kitty.";
  };

  config = lib.mkIf config.h.kitty.enable {
    home-manager.users.${config.h.username} = {
      programs.kitty = {
        enable = true;
        font = {
          name = "CaskaydiaCove NF";
          size = 30;
        };
        theme = "Gruvbox Dark Hard";
        darwinLaunchOptions = [
          "--single-instance"
        ];
        shellIntegration = {
          enableFishIntegration = false;
          enableZshIntegration = false;
          enableBashIntegration = false;
        };
        keybindings = {
          "ctrl+equal" = "change_font_size all +2.0";
          "ctrl+minus" = "change_font_size all -2.0";
          "cmd+equal" = "change_font_size all +2.0";
          "cmd+minus" = "change_font_size all -2.0";
          "ctrl+shift+c" = "copy_to_clipboard";
          "cmd+p" = "copy_to_clipboard";
          "ctrl+shift+v" = "paste_from_clipboard";
          "cmd+v" = "paste_from_clipboard";
        };
        settings = {
          # super important!
          clear_all_shortcuts = "yes";
          shell = "${pkgs.fish}/bin/fish";
          macos_option_as_alt = "yes";
          cursor_shape = "block";
          copy_on_select = "yes";
          shell_integration = "disabled";
          cursor_blink_interval = 0;
          hide_window_decorations = "no";
          confirm_os_window_close = 0;
          update_check_interval = 0;
          enable_audio_bell = "no";
          resize_debounce_time = "0";
        };
      };
    };
  };
}
