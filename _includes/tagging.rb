require 'jekyll/tagging'

module Jekyll

    class Tagger
  
      alias_method :_apiacoa_original_generate_tag_pages, :generate_tag_pages
  
      def generate_tag_pages(site)
        unless languages = site.config['languages']
      return _apiacoa_original_generate_tag_pages(site)
        end
  
        site.tags.each { |tag, posts| languages.each { |lang|
      new_tag(site, tag, posts) { |data|
        data['tag'], name = tag, "#{tag}.#{lang}"
        ext = site.layouts[data['layout'] += ".#{lang}"].ext
  
        (languages - [lang]).each { |other_lang|
            data["#{other_lang}-version"] = "#{tag}.#{other_lang}#{ext}"
        }
  
        name
      }
        } }
      end
  
    end
  
  end
