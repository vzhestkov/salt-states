{%- set group_names = salt['pillar.get']('susemanager:groups', {}) -%}
{%- set groups = [] -%}
{%- for grp_id in pillar.get('group_ids', []) -%}
{%- if group_names[grp_id] -%}
{%- do groups.append(group_names[grp_id]) -%}
{%- endif -%}
{%- endfor -%}
grp_grains_names_set:
  grains.present:
    - name: 'susemanager:groups'
    - value: {{groups}}
    - force: True
