#!/bin/bash

# This script updates the Solr/Lucene search index based on the currently live
# content. The content index is pulled from the live site through an API call.

# Pull the search index from the live site's API 
echo "Downloading search index from live site..."
curl -f# 'http://www.khanacademy.org/api/v1/searchindex' > /tmp/searchindex || exit

# Clear the current index (does not take effect until the commit in the next call)
echo "Queueing the index clear action..."
curl 'http://localhost:9001/solr/update/json' --data '{"delete":{"query":"*:*"}}' -H 'Content-type:application/json' || exit

# Send the index data to Solr and commit the changes immediately
echo "Uploading the new search index..."
curl 'http://localhost:9001/solr/update/json?commit=true' --data @/tmp/searchindex -H 'Content-type:application/json' || exit

echo "Done."
