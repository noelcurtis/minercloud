#!/usr/bin/ruby -w
# BitcoinBlockHeader.rb - Decode bitcoin solution

require 'digest'

class BlockHeader
  # Block header          : 160 bytes
  # - Version             : 4 bytes
  # - Previous block hash : 32 bytes
  # - Merkle root         : 32 bytes
  # - Timestamp           : 4 bytes
  # - Bits                : 4 bytes
  # - Nonce               : 4 bytes

  attr_accessor :raw,
    :previous_block,
    :nonce,
    :timestamp,
    :version,
    :merkle_root,
    :bits

  # Initialize block header from a raw pool solution
  def initialize(raw)
    self.raw = raw
  end

  def raw=(str)
    # We keep only the first 80 bytes of data
    @raw = str[0, 160]
  end

  def version
    @version ||= @raw[0, 8].hex
  end

  def previous_block
    @previous_block ||= word_reverse(@raw[8, 64])
  end

  def merkle_root
    @merkle_root ||= word_reverse(@raw[72, 64])
  end

  def timestamp
    @timestamp ||= @raw[136, 8].hex
  end

  def bits
    @bits ||= @raw[144, 8].hex
  end

  def nonce
    @nonce ||= @raw[152, 8].hex
  end

  # Reverses a string using chunks of 8 chars (4 hex bytes)
  def word_reverse(str)
    res = []

    while str.length > 0 do
      res << str[-8, 8]
      str = str[0, str.length - 8]
    end

    res.join
  end

  # Computes a block hash from the block header fields
  def block_hash
    byte_reverse Digest::SHA2.hexdigest(Digest::SHA2.digest(hex2bin(hashable_string)))
  end

  private
    # Converts a hex string to binary, without 0x00 byte ending
    def hex2bin(str)
      (0..((str.length/2)-1)).inject([]) do |r, i|
        r << [str[i*2, 2]].pack("H2")
      end.join
    end

    # Converts a binary string to hex
    def bin2hex(str)
      str.unpack("H*")[0]
    end

    # Creates the hashed string from block header fields in little endian
    def hashable_string
      byte_reverse("%08x" % version) +
        byte_reverse(previous_block) +
        byte_reverse(merkle_root) +
        byte_reverse("%08x" % timestamp) +
        byte_reverse("%08x" % bits) +
        byte_reverse("%08x" % nonce)
    end

    # Takes a hex string and reverses all bytes to switch endianness
    def byte_reverse(str)
      bin2hex(hex2bin(str).reverse)
    end
end