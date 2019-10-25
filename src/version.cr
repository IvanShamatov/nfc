# TODO: Write documentation for `Nfc`
module NFC
  VERSION = "0.1.0"

  def self.lib_version
    String.new(LibNFC.version)
  end
end
