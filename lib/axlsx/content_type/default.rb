# encoding: UTF-8
module Axlsx
  # An default content part. These parts are automatically created by for you based on the content of your package.
  class Default

    # The extension of the content type.
    # @return [String]
    attr_reader :extension
    alias :Extension :extension

    # The type of content.
    # @return [String]
    attr_reader :content_type
    alias :ContentType :content_type

    #Creates a new Default object
    # @option options [String] extension
    # @option options [String] content_type
    # @raise [ArgumentError] An argument error is raised if both extension and content_type are not specified.
    def initialize(options={})
      raise ArgumentError, "extension and content_type are required" unless (options[:Extension] || options[:extension]) && (options[:content_type] || options[:ContentType])
      options.each do |o|
        self.send("#{o[0]}=", o[1]) if self.respond_to? "#{o[0]}="
      end
    end


    # Sets the file extension for this content type.
    def extension=(v) Axlsx::validate_string v; @extension = v end
    alias :Extension= :extension=

    # Sets the content type
    # @see Axlsx#validate_content_type
    def content_type=(v) Axlsx::validate_content_type v; @content_type = v end
    alias :ContentType= :content_type=

    # Serializes the object
    # @param [String] str
    # @return [String]
    def to_xml_string(str = '')
      str << '<Default '
      str << instance_values.map { |key, value| '' << Axlsx::camel(key) << '="' << value.to_s << '"' }.join(' ')
      str << '/>'
    end

  end
end
