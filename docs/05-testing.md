<p align="center">
  <a href="https://platform.sh/marketplace/strapi/">
    <img src="https://platform.sh/images/spots/arrows/fast-dev.svg" />
  </a>

  <h1 align="center">Testing</h1>
</p>

Platform.sh allows you to integrate your applications with your existing testing pipelines. This includes CircleCI, Jenkins, GitHub Actions - anything you already have set up can run alongside deployment integrations. 

But the hooks we expose in your `.platform.app.yaml` files can also be modified to run tests as a part of your builds and deploys. Should you want to, you could very well move all of your tests into the environment itself, giving you access to your application code, your services, and much more available there. 

In the FoodAdvisor demo, there is already a test defined for the frontend React app we can test this on:

```
// client/package.json

  "scripts": {
    ...
    "test": "react-scripts test",
    ...
  }
```

All we need to do is place the call for this test (`yarn test`) into one of our hooks.

1. `git checkout master`
2. `platform environment:branch tests`
3. Add the following deploy hook to `client/.platform.app.yaml`:

    ```yaml
    deploy: |
        set -e
        yarn test
    ```
    
In the block above we call the test after the frontend app has already started running in the start command, preceded by `set -e`. `set -e` ensures that should the tests fail, the deployment will fail, which allows us to place restrictions on our repository (i.e. cannot merge without passing deployment & passed tests). 

4. `git add . && git commit -m "Add a test to the frontend."
5. `git push platform tests`

Watch the activity log in the management console for the `tests` environment. 

Move onto [next steps](06-next-steps.md).
