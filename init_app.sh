#!/bin/sh
echo "scaffolding java project"
if [ -d /root/starter ]
then 
  cp -r /root/starter/* /app
  cp -r /root/starter/.mvn /app
  cp -r /root/starter/.gitignore /app
  rm -rf /root/starter
fi
cd /app
/bin/sh /app/mvnw spring-boot:run