cask "neo-warp" do
  version "0.2.3"
  sha256 "55d672228d955e7c76f53e81ac0b79d5a507ce87b73c515eaf65e16e0636dd35"

  url "https://github.com/Phathat-Technologies-Ltd/neo-warp/releases/download/v#{version}/neo-warp-#{version}-macos-arm64.dmg"
  name "neo-warp"
  desc "Warp-based terminal for organizations with local voice and your own models"
  homepage "https://github.com/Phathat-Technologies-Ltd/neo-warp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "neo-warp.app"

  zap trash: [
    "~/.warp-oss-neo-warp",
    "~/Library/Application Support/dev.neowarp.NeoWarp-neo-warp",
    "~/Library/Logs/neo-warp*",
    "~/Library/Preferences/dev.neowarp.NeoWarp-neo-warp.plist",
    "~/Library/Preferences/dev.neowarp.NeoWarp.plist",
  ]

  caveats <<~EOS
    neo-warp needs an organization configuration from your administrator at:
      /Library/Application Support/Warp/organization.toml
  EOS
end
