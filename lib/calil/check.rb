module Calil
  class Check
    *@@check_infos = %w(session books continue).map{|str| str.to_sym}

    attr_accessor *@@check_infos

    POLLING_URL = 'http://api.calil.jp/check'

    def initialize(hash = nil)
      hash ||= {}
      hash.each do |k,v|
        self.send("#{k}=", v) if respond_to? "#{k}="
      end
    end

    def polling
      if @continue == 1
        url = "#{POLLING_URL}?session=#{@session}&format=jsonjson&callback=no"
        Check.new(open(url) {|f| JSON.load(f)})
      else
        nil
      end
    end

    def to_h
      Hash[*@@check_infos.map{|v| [v, send(v)] }.flatten]
    end

    def to_a
      to_h.to_a
    end
  end
end
