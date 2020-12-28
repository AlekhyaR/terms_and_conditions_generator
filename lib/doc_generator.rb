require './lib/template_generator'  

class DocGenerator
    attr_reader :template
  
    def initialize(template)
      @template = template
    end
  
    def render()
      ERB.new(template).result(binding)
    end
  
    def save(file)
      File.open(file, "w+") do |f|
        f.write(render)
      end
    end
end

temp = TemplateGenerator.new
doc = DocGenerator.new(temp.get_template())
doc.save(File.join(ENV['HOME'], 't_and_c_doc.html'))