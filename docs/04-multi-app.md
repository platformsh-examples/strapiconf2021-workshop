<p align="center">
  <a href="https://platform.sh/marketplace/strapi/">
    <img src="https://platform.sh/images/spots/arrows/fast-dev.svg" />
  </a>

  <h1 align="center">Multi-app configuration</h1>
</p>

Now the whole point of Strapi is to develop an API that can be consumed by applications. We want to build out an API that can be presented to people who visit our site. For FoodAdvisor, the repo already includes code for a React frontend application to present our restaurant listings and reviews. 

On Platform.sh, we can keep this codebase in the same repository as Strapi, nesting it in it's own subdirectory alongside the rest of our API development. All that we need to do is tell Platform.sh that there's another application we want to build and deploy, and the frontend will get its own container in the environment cluster. 

<p align="center">
    <img src="https://docs.platform.sh/images/config-diagrams/multiple-applications.png" />
</p>

1. **Modify your `.platform/routes.yaml` to contain the following**:

    ```yaml
    # .platform/routes.yaml
    
    "https://www.api.{default}/":
        type: redirect
        to: "https://api.{default}/"

    "https://api.{default}/":
        type: upstream
        upstream: "strapi:http"
        id: "api"

    "https://www.{default}/":
        type: upstream
        upstream: "frontend:http"

    "https://{default}/":
        type: redirect
        to: "https://www.{default}/"
    ```
    
2. **Create a `.platform.app.yaml` file for the frontend application**: `touch frontend/.platform.app.yaml`
3. **Modify your `frontend/.platform.app.yaml` to contain the following**:

    ```yaml
    # client/.platform.app.yaml

    name: frontend

    type: nodejs:12

    build:
        flavor: none

    dependencies:
        nodejs:
            yarn: "1.22.5"

    hooks:
        build: |
            # Install dependencies with yarn.
            yarn --ignore-optional --frozen-lockfile
        deploy: |
            set -e
            export CI=true && yarn test

    web:
        commands: 
            start: REACT_APP_BACKEND_URL=$BACKEND_URL yarn start

    disk: 1024

    mounts:
        '/.cache':
            source: local
            source_path: cache
    ```


Move onto [testing](05-testing.md).
