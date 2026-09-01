cask "twinpixcleaner" do
  version "2.2.0"
  sha256 "7d8bea581526e5fbe46cc7e3a39dfdf130458a169fe0dcdee5fcc6757bc7e8b8"

  url "https://github.com/AkshayKrGupta/TwinPixCleaner/releases/download/v#{version}/TwinPixCleaner.zip"
  name "TwinPixCleaner"
  desc "AI-powered (Apple Vision Intelligence) duplicate photo cleaner"
  homepage "https://github.com/AkshayKrGupta/TwinPixCleaner"

  depends_on macos: :ventura

  app "TwinPixCleaner.app"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: [
    "~/Library/Application Support/TwinPixCleaner",
    "~/Library/Preferences/com.akshaykgupta.TwinPixCleaner.plist",
  ]
end
