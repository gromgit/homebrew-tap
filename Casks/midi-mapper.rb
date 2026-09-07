cask "midi-mapper" do
  version "0.2.13"
  sha256 "e7ee8d1dcfb0b0bb3ded05b090e633a0e7c9575cab9d645d19b07e743d6411d1"

  url "https://dl.midi-mapper.com/v#{version}/MIDI-Mapper-#{version}-arm64.dmg"
  name "MIDI-Mapper"
  desc "Turn any MIDI controller into a programmable macro pad"
  homepage "https://midi-mapper.com/"

  livecheck do
    url "https://midi-mapper.com/releases/"
    regex(/Latest: v(\d+(?:\.\d+)*)/)
    strategy :page_match
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "MIDI-Mapper.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.midi-mapper.app.sfl*",
    "~/Library/Preferences/com.midi-mapper.app.plist",
    "~/Library/Saved Application State/com.midi-mapper.app.savedState",
  ]
end
