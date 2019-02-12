#!/bin/bash

source qm.variables
source lib/common.sh 

echo $CYAN"Building Tessera, "$tessera_version"..."$COLOR_END

rm -rf tessera

docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git alpine/git clone https://github.com/jpmorganchase/tessera.git
docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git -w /git/tessera alpine/git checkout tessera-$tessera_version

chownDir 'tessera'
sed -i "s;HASH LONGVARBINARY NOT NULL UNIQUE,;HASH LONGVARBINARY NOT NULL UNIQUE, TIMESTAMP BIGINT,;" tessera/data-migration/src/main/java/com/quorum/tessera/data/migration/H2DataExporter.java

sed -i "s#\(public class\)#import javax.xml.bind.annotation.XmlAccessType;\nimport javax.xml.bind.annotation.XmlAccessorType;\n@XmlAccessorType\(XmlAccessType.FIELD\)\n\1#" tessera/config/src/main/java/com/quorum/tessera/config/HashicorpKeyVaultConfig.java

docker run -it --rm -v $(pwd)/tessera:/tessera -w /tessera maven:3.6.0-jdk-8-slim /bin/sh -c 'mvn install -DskipTests -Djacoco.skip=true'

## Change the owneship of tessera directory
chownDir 'tessera'

cp tessera/tessera-app/target/tessera-app-*-app.jar tessera/tessera-app/target/tessera-app.jar
cp tessera/data-migration/target/data-migration-*-cli.jar tessera/data-migration/target/data-migration-cli.jar
cp tessera/config-migration/target/config-migration-*-cli.jar tessera/config-migration/target/config-migration-cli.jar

echo $CYAN"Building Tessera, "$tessera_version" Completed."$COLOR_END
