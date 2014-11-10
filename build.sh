#!/bin/sh


service_tpl=$(cat <<EOD
    - name: %s\n
      command: start\n
      enable: true\n
      content: |\n
EOD)

service_awk=$(cat <<EOD
BEGIN { printf("    - name: %s\n      command: start\n      enable: true\n      content: |\n", substr(name, 3)); }
/^/ { printf("        %s\n", \$0); }
EOD)

cat user-data.pre > user-data
find . -name '*.service' -exec awk -v name={} "${service_awk}" {} \; >> user-data
