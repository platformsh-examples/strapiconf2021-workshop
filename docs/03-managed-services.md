<p align="center">
  <a href="https://platform.sh/marketplace/strapi/">
    <img src="https://platform.sh/images/spots/arrows/fast-dev.svg" />
  </a>

  <h1 align="center">Managed services</h1>
</p>

Platform.sh provides [*managed services*](https://docs.platform.sh/configuration/services.html) - services that can easily be added and updated via our configuration YAML file, `.platform/services.yaml`. From this file, we can add any number of services to our project, and here we are going to switch out SQLite for PostgreSQL.

1. `git checkout master`
2. `platform environment:branch db`
3. **Add the following to `.platform/services.yaml`**:

    ```yaml      
    dbpostgres:
        type: postgresql:12
        disk: 256
    ```
    
4. **Add the following block to `strapi/.platform.app.yaml`**:

    ```yaml
    relationships:
        database: "dbpostgres:postgresql"
    ```
5. **Modify `strapi/config/database.js` to contain the following**:

    ```js
    // config/database.js
    
    const config = require("platformsh-config").config();

    // dbRelationship matches the Postgres relationship key defined in .platform.app.yaml. 
    //    Be sure to update both values during changes.
    let dbRelationship = "database";

    // Local: Strapi default sqlite settings.
    let settings =  {
        client: 'sqlite',
        filename: process.env.DATABASE_FILENAME || '.tmp/data.db',
    };

    let options = {
      useNullAsDefault: true,
    };

    if (config.isValidPlatform() && !config.inBuild()) {
      // Platform.sh database configuration. Used post-build only in P.sh environments.
      const credentials = config.credentials(dbRelationship);
      console.log(`> platform.sh: Using Platform.sh configuration with relationship ${dbRelationship}.`);

      settings = {
        client: "postgres",
        host: credentials.ip,
        port: credentials.port,
        database: credentials.path,
        username: credentials.username,
        password: credentials.password
      };

      options = {
        ssl: false,
        debug: false,
        acquireConnectionTimeout: 100000,
        pool: {
          min: 0,
          max: 10,
          createTimeoutMillis: 30000,
          acquireTimeoutMillis: 600000,
          idleTimeoutMillis: 20000,
          reapIntervalMillis: 20000,
          createRetryIntervalMillis: 200
        }
      };
    } else {
        if (config.isValidPlatform()) {
              // Build hook configuration message.
              console.log('> platform.sh: Using default configuration during Platform.sh build hook until relationships are available.');
        } else {
              // Strapi default local configuration.
              console.log('> platform.sh: Not in a Platform.sh Environment. Using default local sqlite configuration.');
        }
    }

    module.exports = {
      defaultConnection: 'default',
      connections: {
        default: {
          connector: 'bookshelf',
          settings: settings,
          options: options,
        }
      }
    };
    ```
6. `git add . && git commit -m "Switch to Postgres."`
7. `git push platform db`
8. Allow the changes to deploy. When they have finished you're site will contain all of the same collections, but no data. We will need to migrate that data in order to complete the switch to Postgres.
9. `platform sql < postgres_dump.sql`
10. `platform merge db`
11. `git checkout master`
12. `platform sql < postgres_dump.sql`

Move onto [environment variables](04-env-variables.md).
