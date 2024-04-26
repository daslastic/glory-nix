{ self, config, pkgs, ... }:
{
  security.pki.installCACerts = false;

  environment.systemPackages = with pkgs; [ alacritty ];

  services = {
    yabai = {
      enable = true;
      package = pkgs.yabai;
    };

    skhd.enable = true;
  };

  fonts = {
    fontDir.enable = true;
    fonts = [
      (pkgs.nerdfonts.override { fonts = [ "CascadiaCode" ]; })
    ];
  };

  system = {
    defaults = {
      LaunchServices.LSQuarantine = false;
      NSGlobalDomain = {
        # https://github.com/LnL7/nix-darwin/blob/230a197063de9287128e2c68a7a4b0cd7d0b50a7/modules/system/defaults/NSGlobalDomain.nix
        AppleShowScrollBars = "Automatic";
        AppleInterfaceStyle = "Dark";
        ApplePressAndHoldEnabled = false;
        AppleShowAllExtensions = false;
        AppleShowAllFiles = true;

        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
        NSDocumentSaveNewDocumentsToCloud  = false;
        AppleTemperatureUnit = "Celsius";

        # 120, 90, 60, 30, 12, 6, 2
        KeyRepeat = 2;

        # 120, 94, 68, 35, 25, 15
        InitialKeyRepeat = 15;

        NSWindowResizeTime = 0.001;
        "com.apple.swipescrolldirection" = false;
      };

      spaces = {
        spans-displays = true;
      };

      trackpad = {
        Clicking = true;
        ActuationStrength = 0;
        FirstClickThreshold = 0;
        SecondClickThreshold = 0;
      };

      dock = {
        autohide = true;
        mru-spaces = false;
        autohide-delay = 0.0;
        expose-animation-duration = 0.0;
        autohide-time-modifier = 0.1;
        persistent-apps = [ "/Applications/Safari.app" "${pkgs.alacritty}/Applications/Alacritty.app/" ];
        show-process-indicators = false;
        showhidden = true;
        show-recents = false;
        tilesize = 64;
        # mission control on top right corner
        wvous-tl-corner = 2;
        wvous-br-corner = 1;

        # I wish I knew what these mean,
        # the documentation doesn't really explain
        enable-spring-load-actions-on-all-items = false;
        dashboard-in-overlay = false;
      };
      finder = {
        # show icons on desktop
        CreateDesktop = true;
        FXPreferredViewStyle = "clmv";
        FXEnableExtensionChangeWarning = false;
      };
      loginwindow = {
        LoginwindowText = "yo momma gay";
      };
      screencapture = {
        location = "~/Pictures/Screenshots";
      };
    };
    keyboard = {
      enableKeyMapping = true;
      swapLeftCommandAndLeftAlt = false;
      remapCapsLockToEscape = true;
    };
  };
}
