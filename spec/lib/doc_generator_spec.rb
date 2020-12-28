describe DocGenerator do
  describe "#save" do
    context "should write content to doc and save it to .html file" do
      it 'passed content to docgenerator should equal to saved file content' do
        @content = "A Terms&condition Document"
        doc = DocGenerator.new(@content)
        @filename = "t_c_generator.html"
        save_file_to = File.join(ENV['HOME'], @filename)
        
        expect(File.read(save_file_to)).to eq(@content)
      end
    end
  end
end