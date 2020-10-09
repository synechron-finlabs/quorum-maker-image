#!/bin/bash

source qm.variables
source lib/common.sh 

echo $CYAN"Downloading Tessera, "$tessera_version"..."$COLOR_END

rm -rf tessera

## Change the owneship of tessera directory
chownDir 'tessera'

mkdir -p tessera/tessera-app/target
mkdir -p tessera/data-migration/target
mkdir -p tessera/config-migration/target

wget https://oss.sonatype.org/service/local/repositories/releases/content/com/jpmorgan/quorum/tessera-app/0.10.6/tessera-app-${tessera_version}-app.jar \
     -O tessera/tessera-app/target/tessera-app.jar

wget https://oss.sonatype.org/service/local/repositories/releases/content/com/jpmorgan/quorum/data-migration/${tessera_version}/data-migration-${tessera_version}-cli.jar \
     -O tessera/data-migration/target/data-migration-cli.jar

wget cp https://oss.sonatype.org/service/local/repositories/releases/content/com/jpmorgan/quorum/config-migration/${tessera_version}/config-migration-${tessera_version}-cli.jar \
     -O tessera/config-migration/target/config-migration-cli.jar


echo $CYAN"Downloading Tessera, "$tessera_version" Completed."$COLOR_END
