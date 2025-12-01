{% macro generate_surrogate_key(field_list) %}
    -- Concatenamos los campos con un guion.
    md5(concat_ws('-', 
        {% for field in field_list %}
            cast({{ field }} as string)
            {% if not loop.last %}, {% endif %}
        {% endfor %}
    ))
{% endmacro %}