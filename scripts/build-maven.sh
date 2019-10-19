cd spring
mvn -B clean package -DskipTests
echo 'Install into the local Maven repository'
mvn jar:jar install:install

NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`

#mv  target/${NAME}-${VERSION}.jar target/entrypoint.jar
mv /root/.m2/repository/org/springframework/samples/spring-petclinic/2.1.0.BUILD-SNAPSHOT/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar target/entrypoint.jar
