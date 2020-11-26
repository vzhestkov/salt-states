{%- set grains_group_key = 'susemanager:group_ids' -%}
{%- set grp_ids = pillar.get('group_ids', []) -%}
grp_grains_set:
  grains.present:
  - name: {{ grains_group_key }}
  - value: {{ grp_ids }}
