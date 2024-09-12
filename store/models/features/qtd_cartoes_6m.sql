{%- set months = this.table.split("_")[-1][:-1] | int -%}


{{
    feature__qtd_cartoes(
        column_name = "contract_id",
        time_length = months
    )
}}