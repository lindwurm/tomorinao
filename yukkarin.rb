# -*- coding: utf-8 -*-

Plugin.create(:yukkarin) do
end

module Plugin::Yukkarin
  def self.結月ゆかり
    Yukarizable
  end

  module Yukarizable
    def [](key)
      case key
      when :name
        '結月ゆかり'.freeze
      else
        super(key) end end
  end
end

class Message::MessageUser
  class << self
    alias 結月ゆかり_new new
    def new(user, raw)
      yukarized = raw.dup
      yukarized.delete(:name)
      結月ゆかり_new(user, yukarized) end
  end
end

class User
  prepend Plugin::Yukkarin::結月ゆかり
end
