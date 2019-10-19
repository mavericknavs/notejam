cd spring
mvn -B clean package -DskipTests
echo 'Install into the local Maven repository'
mvn jar:jar install:install

NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`

#mv  target/${NAME}-${VERSION}.jar target/entrypoint.jar
mv /root/.m2/repository/net/notejam/spring/0.0.1-SNAPSHOT/spring-0.0.1-SNAPSHOT.jar target/entrypoint.jar
