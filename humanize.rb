module Jekyll

  module Humanize
    ##
    # This is the beginnings of a port of the Django
    # app `humanize` which adds a "human touch" to data.

    def intcomma(input, delimiter=',')
      ##
      # Attempts to add
      # Simple usage:
      # {{ post.content | number_of_words }} >>> 12345
      # {{ post.content | number_of_words | intcomma }} >>> 12,345
      # {{ post.content | number_of_words | intcomma: '.' }} >>> 12.345

      orig = input.to_s
      delimiter = delimiter.to_s
      copy = orig.strip
      copy = orig.gsub(/^(-?\d+)(\d{3})/, '\1%s\2' % delimiter)
      orig == copy ? copy : intcomma(copy, delimiter)
    end

  end

end

Liquid::Template.register_filter(Jekyll::Humanize)