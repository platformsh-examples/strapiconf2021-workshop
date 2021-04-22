<p align="center">
  <a href="https://platform.sh/marketplace/strapi/">
    <img src="https://platform.sh/images/spots/arrows/fast-dev.svg" />
  </a>

  <h1 align="center">Environment variables</h1>
</p>

[Environment variables](https://docs.platform.sh/bestpractices/environment-build.html) can be set at the project-level so that they are consistent features of every environment's build and deploy, or at the environment-level for environment-dependent actions. They allow a build image to remain consistent across environments, while still remaining isolated to the services, routes, and application containers specific to that branch. 

The variables you define can be made accessible at any and all stages of the build-deploy pipeline of your application. [Platform.sh provides](https://docs.platform.sh/development/variables.html#platformsh-provided-variables) a number of environment variables that are useful:

- `PLATFORM_ROUTES`: a base64-encoded JSON object that contains the current environments routes, configured in `.platform/routes.yaml`.
- `PLATFORM_VARIABLES`: an object that contains all variables that you've defined in the management console. 
- `PLATFORM_RELATIONSHIPS`: contains connection credentials for all of your defined relationships: to databases, caches, and other applications in your cluster.

You'll see the Platform.sh-provided environment variables come with the `PLATFORM_` prefix. In this step, we'll look at another one of these variables, `PLATFORM_SMPT_HOST` to enable email on Strapi so that we are able to reset our password should we forget it.

1. `git checkout master`
2. `platform environment:branch email`
3. Allow the environment to deploy. Once it has finished, go to the **Settings** tab for the `email` environment and turn on Outgoing emails. You will not need to perform this step on production, only on development environments (emails are turned off by default in development).


<p align="center">
    <img src="https://docs.platform.sh/images/management-console/env-email.png" />
</p>

Move onto [multi-app configuration](04-multi-app.md).
