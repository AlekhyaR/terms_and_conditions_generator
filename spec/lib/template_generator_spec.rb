describe TemplateGenerator do
    describe '#get_template()' do
        before(:each) do
            @sample = TemplateGenerator.new
            @html_doc = DocGenerator.new(@sample.get_template())
            @template = @sample.get_template()
        end

        context 'checks whether template generator uses dataset and represents it into plain text with tags' do
            it "should contain 'A T&C Document' as plain text in template" do
                expect(@template).to include("A T&C Document")
                expect(@template).to include('is').at_least(3).times
                expect(@template).to include('Is').at_least(3).times
            end

            it "should use dataset for clause-3 value and return text with tag" do 
                expect(@template).to include("<b>And</b> dies")
            end

            it "should use dataset for clause-4 value and return text with tag" do 
                expect(@template).to include("The white horse <b>is</b> white.")
            end

            it "should use dataset for section-1 values and return text join two values with semicolon" do
                expect(@template).to include("The quick brown fox;jumps over the lazy dog.")
            end
        end
    end
end
            