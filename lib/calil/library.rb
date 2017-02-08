module Calil
  class Library
    *@@library_infos = %w(systemid systemname libkey libid short formal url_pc address pref city post tel geocode category image	distance).map{|str| str.to_sym}

    attr_accessor *@@library_infos

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
