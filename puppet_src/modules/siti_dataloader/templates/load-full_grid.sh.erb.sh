#!/bin/bash

set -xe

export LD_LIBRARY_PATH="/usr/lib/oracle/12.1/client64/lib/:/opt/capd-siti-linux-dataloader/"

./shp2ora -d "//<%= scope.function_hiera(['caporacledb-ip-host']) %>:<%= scope.function_hiera(["oracle-port"]) %>/<%= scope.function_hiera(['capd-oracle-sid']) %>" -u siti -p <%= scope.function_hiera(['abaco-db-siti-password']) %> -t impo_eng_grid -l impo_eng_full_grid.log -f <%= scope.function_hiera(['abaco-temp-datadir','/opt/capd-siti-data']) %>/full_grid.shp -c load-grid.cfg

sqlplus siti/<%= scope.function_hiera(["abaco-db-siti-password"]) %>@<%= scope.function_hiera(["capd-oracle-sid"]) %> <<EOF

BEGIN

eng_data_loader.load_particelle (1, 'LOADER', SYSDATE);
commit;

END;
quit
EOF
