#!/bin/bash

SCRIPT_PATH=$(dirname $0)

FORCE=false

# Determine and process all of the flags
for arg in "$@"; do
  if [ "$arg" == "--force" ]; then
    FORCE=true
    break  # Exit loop early since "--force" was found
  fi
done

# Go to the script path to allow for this to execute properly from anywhere in the directory
echo "Performing Initial Setup:"
cd "${SCRIPT_PATH}"

# If force is true, then attempt to remove the outputs that ./gen-dhparams.sh and ./gen-certs.sh had created 
if [ "$FORCE" == "true" ]; then
	echo "FORCE: Flushing out pre-existing certs files from ./certs/*"
	# Remove output generated by ./gen-dhparams.sh
	rm ./certs/dhparams.pem
	# Remove output generated by ./gen-certs.sh
	rm ./certs/privkey.pem
	rm ./certs/fullchain.pem
fi 

# Generate dhparams file
echo "Step 1: ./gen-dhparams.sh"
./gen-dhparams.sh

# Generate the certificates 
echo "Step 2: ./gen-certs.sh"
./gen-certs.sh

