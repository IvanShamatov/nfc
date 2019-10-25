@[Link("libnfc")]

lib LibNFC
  enum Properties
    NP_TIMEOUT_COMMAND
    NP_TIMEOUT_ATR
    NP_TIMEOUT_COM
    NP_HANDLE_CRC
    NP_HANDLE_PARITY
    NP_ACTIVATE_FIELD
    NP_ACTIVATE_CRYPTO1
    NP_INFINITE_SELECT
    NP_ACCEPT_INVALID_FRAMES
    NP_ACCEPT_MULTIPLE_FRAMES
    NP_AUTO_ISO14443_4
    NP_EASY_FRAMING
    NP_FORCE_ISO14443_A
    NP_FORCE_ISO14443_B
    NP_FORCE_SPEED_106
  end

  enum DepMode
    NDM_UNDEFINED
    NDM_PASSIVE
    NDM_ACTIVE
  end

  enum BaudRate
    NBR_UNDEFINED
    NBR_106
    NBR_212
    NBR_424
    NBR_847
  end

  enum ModulationType
    NMT_ISO14443A    = 1
    NMT_JEWEL
    NMT_ISO14443B
    NMT_ISO14443BI   # pre-ISO14443B aka ISO/IEC 14443 B' or Type B'
    NMT_ISO14443B2SR # ISO14443-2B ST SRx
    NMT_ISO14443B2CT # ISO14443-2B ASK CTx
    NMT_FELICA
    NMT_DEP
  end

  struct ISO14443a
    abtAtqa : LibC::UInt[2]
    btSak : LibC::UInt
    szUidLen : LibC::SizeT
    abtUid : LibC::UInt[10]
    szAtsLen : LibC::SizeT
    abtAts : LibC::UInt[254]
  end

  struct Felica
    szLen : LibC::SizeT
    btResCode : LibC::UInt
    abtId : LibC::UInt[8]
    abtPad : LibC::UInt[8]
    abtSysCode : LibC::UInt[2]
  end

  struct ISO14443b
    abtPupi : LibC::UInt[4]
    abtApplicationData : LibC::UInt[4]
    abtProtocolInfo : LibC::UInt[3]
    ui8CardIdentifier : LibC::UInt
  end

  struct ISO14443bi
    abtDIV : LibC::UInt[4]
    btVerLog : LibC::UInt
    btConfig : LibC::UInt
    szAtrLen : LibC::SizeT
    abtAtr : LibC::UInt[33]
  end

  struct ISO14443b2sr
    abtUID : LibC::UInt[8]
  end

  struct ISO14443b2ct
    abtUID : LibC::UInt[4]
    btProdCode : LibC::UInt
    btFabCode : LibC::UInt
  end

  struct Jewel
    btSensRes : LibC::UInt[2]
    btId : LibC::UInt[4]
  end

  fun version = nfc_version : LibC::Char*

  fun set_flag = nfc_device_set_property_bool(
    device : LibC::Int*,
    prop : Properties,
    flag : Bool
  ) : LibC::Int
end
