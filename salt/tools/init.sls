install-tools:
    {% for item in pillar['tools']['packages'] %}
    pkg.installed:
        - name: {{ item }}
    {% endfor %}