#!/bin/bash

set REPO_ROOT = /home/ubuntu/production-rpc-webserver
set SCRIPT_ROOT = $REPO_ROOT/scripts

# TODO (tom): Find the right mailing list to send this error out to
$SCRIPT_ROOT/cronic.bash $SCRIPT_ROOT/update_solr.bash | mail -E -s "Error occurred while updating the search index on search-rpc!" tom@khanacademy.org
