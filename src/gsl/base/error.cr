class LengthException < Exception
end

class NonIdenticalHistograms < Exception
end

class IterationsLimitExceeded < Exception
end

module GSL
  class Exception < ::Exception
    getter reason : String
    getter file : String
    getter line : Int32
    getter gsl_errno : Int32

    def initialize(@reason, @file, @line, @gsl_errno)
      super("#{reason} at #{file}: #{line} (code is #{gsl_errno})")
    end
  end

  private def self.update_error_handler
    handler = ->(reason : LibC::Char*, file : LibC::Char*, line : LibC::Int, gsl_errno : LibC::Int) : Nil do
      raise GSL::Exception.new(String.new(reason), String.new(file), line, gsl_errno)
    end
    LibGSL.gsl_set_error_handler(handler)
  end

  update_error_handler
end
