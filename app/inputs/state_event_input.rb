class StateEventInput < SimpleForm::Inputs::CollectionSelectInput
  def collection
    object.send(state_transitions_name)
  end

  def input
    label_method = :human_to_name
    value_method = :event
    input_options.merge!({ :include_blank => object.send(human_state_name) })

    out = @builder.collection_select(
      attribute_name, collection, value_method, label_method,
      input_options, input_html_options
    )
  end

  private

  def state_machine_name
    attribute_name.to_s.gsub '_event', ''
  end

  def state_transitions_name
    "#{state_machine_name}_transitions"
  end

  def human_state_name
    "human_#{state_machine_name}_name"
  end
end