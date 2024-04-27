{
  config,
  lib,
  pkgs, ...
}: {
  options.h = {
    tmux.enable = lib.mkEnableOption "Enable tmux.";
  };

  config = lib.mkIf config.h.tmux.enable {
    home-manager.users.${config.h.username} = {
      programs.tmux = {
        enable = true;
        keyMode = "vi";
        terminal = "screen-256color";
        mouse = true;
        prefix = "C-b";
        baseIndex = 1;
        disableConfirmationPrompt = true;
        customPaneNavigationAndResize = true;
        extraConfig = builtins.readFile ./tmux.conf;
        plugins = with pkgs.tmuxPlugins; [
          yank
          vim-tmux-navigator
        ];
      };
    };
  };
}
