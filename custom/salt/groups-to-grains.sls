{%- set grains_group_ids_key = 'susemanager:group_ids' -%}
{%- set grains_group_names_key = 'susemanager:groups' -%}
{%- set pillar_group_names_key = 'susemanager:groups' -%}
{%- set grp_ids = pillar.get('group_ids', []) -%}
grp_ids_grains_set:
  grains.present:
  - name: {{ grains_group_ids_key }}
  - value: {{ grp_ids }}
  - force: True

{%- set group_names = salt['pillar.get'](pillar_group_names_key, {}) -%}
{%- set groups = [] -%}
{%- for grp_id in grp_ids -%}
{%- if group_names[grp_id] -%}
{%- do groups.append(group_names[grp_id]) -%}
{%- endif -%}
{%- endfor %}
grains_groups_set:
  grains.present:
    - name: {{ grains_group_names_key }}
    - value: {{groups}}
    - force: True
