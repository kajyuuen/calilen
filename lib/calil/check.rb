module Calil
  class Check
    *@@check_infos = %w(session books continue).map{|str| str.to_sym}

    attr_accessor *@@check_infos

    def initialize(hash = nil)
      hash ||= {}
      hash.each do |k,v|
        self.send("#{k}=", v) if respond_to? "#{k}="
      end
    end

    def to_h
      Hash[*@@library_infos.map{|v| [v, send(v)] }.flatten]
    end

    def to_a
      to_h.to_a
    end
  end
end
