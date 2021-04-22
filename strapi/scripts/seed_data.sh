#!/usr/bin/env bash

if [ -z "${PLATFORM_BRANCH}" ]; then
    # Allow for seeding by making .env writable temporarily during the build hook.
    ln -s data/.env .env
else 
    # Deploy hook.
    # Food advisor seed data to SQLite.
    RELATIONSHIPS=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq '.keys')
    # Check to make sure seed has not already occurred, AND that PostgreSQL doesn't exist.
    if [ $RELATIONSHIPS = 'null' ] && [ ! -f ~/.seed/sqlite-seeded.txt ]; then
        yarn seed
        echo "SQLite database seeded" > ~/.seed/sqlite-seeded.txt
        mv ~/data/uploads/* ~/public/uploads/
    fi
fi
