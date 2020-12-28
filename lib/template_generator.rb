require 'erb'

class TemplateGenerator

  def get_template()
    "
      <div>
          <p>A T&C Document </p>

          This document <b>is</b> made <b> of </b> plaintext.
          <br><b>Is</b> made <b>of</b> #{format_clause_text(3)}.
          <br><b>Is</b> made <b>of</b> #{format_clause_text(4)}.
          <br><b>Is</b> made <b>of</b> #{merge_clauses_ids_text}.

          <p>Your legals.</p>
        </div>
      "
  end

  private
  
  def maps_id_values_with_text_values(arr)
    arr.each_with_object({}) {|h, modified_hash| modified_hash.merge!({h[:id] => h[:text]}) }
  end

  def maps_section_ids_with_clauses_ids(arr)
    arr.each_with_object({}) {|h, modified_hash| modified_hash.merge!({h[:id] => h[:clauses_ids]}) }
  end

  def formatted_clauses
    clauses = [
        { "id": 1, "text": 'The quick brown fox' },
        { "id": 2, "text": 'jumps over the lazy dog' },
        { "id": 3, "text": 'And dies' },
        { "id": 4, "text": 'The white horse is white' }
    ]
    maps_id_values_with_text_values(clauses)
  end

  def formatted_sections
    sections = [
        { "id": 1, "clauses_ids": [1, 2]}
    ]
    maps_section_ids_with_clauses_ids(sections)
  end

  def merge_clauses_ids_text
    new_arr = []
    formatted_sections.values.first.collect {|val| new_arr.push(formatted_clauses[val])}
    new_arr.join(";")
  end
  
  def format_clause_text(val)
    if val == 3
      "<b>#{formatted_clauses[val][0..2]}</b>#{formatted_clauses[val][3..7]}"
    elsif val == 4
      "#{formatted_clauses[val][0..15]}<b>#{formatted_clauses[val][16..17]}</b>#{formatted_clauses[val][18..23]}"   
    end
  end
end