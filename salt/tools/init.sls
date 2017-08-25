install-tools:
  pkg.installed:
    - pkgs:
      {% for item in pillar['tools']['packages'] %}
      - {{ item }}
      {% endfor %}