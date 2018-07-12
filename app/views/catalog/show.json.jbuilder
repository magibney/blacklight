json.links do
  json.self polymorphic_url(@document)
end

json.data do
  json.id @document.id
  json.attributes do
    doc_presenter = show_presenter(@document)

    document_show_fields(@document).each do |field_name, field|
      if should_render_show_field? @document, field
        json.set! field_name, doc_presenter.field_value(field_name)
      end
    end
  end
end
