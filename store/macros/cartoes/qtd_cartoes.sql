{%-
    macro feature__qtd_cartoes(
        column_name = contract_id,
        time_length = 3
    )
-%}

select

    number_id,
    approx_count_distinct({{column_name}}) as qtd_cartoes_{{ time_length}}

from {{ source('diego_database', 'tabela_cartoes') }}
where installment_date >= date_sub(current_date("America/Sao_Paulo"), interval {{ time_length }} month)
group by 1

{%- endmacro -%}
