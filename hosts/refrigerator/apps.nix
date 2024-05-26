{ ... }:
{
  # B: quick
  homebrew = {
    onActivation = {
      cleanup = "zap";
      upgrade = true;
      autoUpdate = true;
    };
    enable = true;
    casks = [
      "tidal"
      "arc"
      "parsec"
      "firefox"
      "godot"
      "figma"
      "obs"
      "zed"
      "affinity-designer"
      "affinity-photo"
      "blender"
    ];
  };
}
