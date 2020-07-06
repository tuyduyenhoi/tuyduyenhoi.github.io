require 'jekyll/localization'
module Jekyll

  class Page

    # restore standard paths
    %w[url destination process].each { |name|
      alias_method name, "_localization_original_#{name}"
    }

  end

end
