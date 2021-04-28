<p align="center">
  <a href="https://platform.sh/marketplace/strapi/">
    <img src="https://platform.sh/images/spots/concepts/git-branch.svg" />
  </a>

  <h1 align="center">Development environments</h1>
</p>

At any time you can branch your production environment into a development environment, which will contain a byte-level copy of your application code, your infrastructure configuration, and your production data. Once you have done that, you can test changes to code and infrastructure to generate a new build image that can become the production application. 

<p align="center">
    <img style="max-width: 200px;" src="https://docs.platform.sh/images/management-console/environments.png" />
</p>


In this step, let's create a development environment and make a small change. 

Strapi automatically generates an OpenAPI 3.0 specification of your api when it builds. You can view it now either in your local copy of the repository, or on the application container via `platform ssh -e master`. That file will be found at `strapi/config/documentation/documentation/1.0.0/full_documentation.json`.

OpenAPI specs are important because not only will they allow you to write tests with tools like Postman and Newman, but it gives you the option to make your API public and consumable by everyone. With the specification, anyone can write an application to consume your data, including additional apps in this project (more on this later). 

1. `platform environment:branch spec`
2. **Add the following `locations` block to your `web` key in `strapi/.platform.app.yaml`**

    ```yaml
    web:
        commands:
            start: NODE_ENV=production yarn start
        locations:
            # For serving the generated OpenAPI specification as part of the documentation.
            "/docs/spec":
                root: "extensions/documentation/documentation/1.0.0"
                allow: true
                scripts: false
                index:
                    - full_documentation.json
    ```
3. `git add . && git commit -m "Make OpenAPI spec public."`
4. `git push platform spec`
5. Verify that the spec is now public, going to `https://api.spec-<generated-url>/docs/spec`
6. `platform merge spec`
7. `git checkout master`
8. `git merge spec`

Now your API specification can be shared with the public, with other developers working on the application, and with API testing frameworks like Postman - for every environment.

Move onto [managed services](03-managed-services.md).
