module Calil
  class Library
    @@library_infos = %w(systemid systemname libkey libid short formal url_pc address pref city post tel geocode category image	distance).map{|str| str.to_sym}

    attr_reader *@@library_infos

    def initialize(hash = nil)
      hash ||= {}
      hash.each { |k,v|
        send("#{k}=", v) if respond_to? "#{k}="
      }
    end

    def to_hash
      Hash[*@@library_infos.map{|v| [v, send(v)] }.flatten]
    end
  end
end
