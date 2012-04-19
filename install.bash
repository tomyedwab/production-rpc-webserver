#!/bin/bash

# Start out by installing package dependencies
sudo apt-get install lighttpd tomcat6

# Configure Tomcat: Set port number to 9001
sudo sed -i 's/8080/9001/g' /var/lib/tomcat6/conf/server.xml

# Copy configuration data
sudo cp solr_tomcat_context.xml /var/lib/tomcat6/conf/Catalina/localhost/solr.xml

# Set permissions so that Tomcat can read the files
sudo chown -R tomcat6:tomcat6 solr

# Restart Tomcat server to pick up our changes
sudo /etc/init.d/tomcat6 restart
