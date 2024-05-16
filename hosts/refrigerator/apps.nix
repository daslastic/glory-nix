{ ... }:
{
  homebrew = {
    enable = true;
    casks = [
      {
        name = "tidal";
        greedy = true;
      }
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
    #masApps = {
    #  infuse = 1136220934;
    #};
  };
}
