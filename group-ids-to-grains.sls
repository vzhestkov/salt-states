{%- set grains_group_key = 'susemanager:group_ids' -%}
{%- set grp_ids = pillar.get('group_ids', []) -%}
{%- set g_grp_ids = salt['grains.get'](grains_group_key, []) -%}
{%- if g_grp_ids != grp_ids -%}
grp_grains_clear:
  grains.list_absent:
  - name: {{ grains_group_key }}
  - value: {{ g_grp_ids }}

grp_grains_set:
  grains.list_present:
  - name: {{ grains_group_key }}
  - value: {{ grp_ids }}
{% else %}
grp_grains_nop:
  test.nop: []
{%- endif -%}
