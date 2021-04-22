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
3. Allow the environment to deploy. Once it has finished, go to the **Settings** tab for the `email` environment and **turn on Outgoing emails**. You will not need to perform this step on production, only on development environments (emails are turned off by default in development).

<p align="center">
    <img src="https://docs.platform.sh/images/management-console/env-email.png" />
</p>

4. **Add a new file called `plugins.js`**: `touch strapi/config/plugins.js`
5. **Place the following in `plugins.js`**:

```js
// strapi/config/plugins.js

module.exports = ({ env }) => ({
    email: {
      provider: 'nodemailer',
      providerOptions: {
        host: env('PLATFORM_SMTP_HOST', 'smtp.example.com'),
        port: env('PLATFORM_SMTP_PORT', 25),
      },
      settings: {
        defaultFrom: 'no-reply@strapi.io',
        defaultReplyTo: 'no-reply@strapi.io',
      }
    }
  });
```

6. **Modify `strapi/config/server.js` to contain the following**:

```js
// strapi/config/server.js

const forgotPasswordTemplate = {
    subject: "Strapi: Reset your password",
    html: `<p>We heard that you lost your password. Sorry about that!</p>
        <p>But don’t worry! You can use the following link to reset it:</p>
        <p><a href="<%= url %>">Reset password</a></p>
        <p>Thanks!</p>`,
    text: `We heard that you lost your password. Sorry about that!
    But don’t worry! You can use the following link to reset it:
    <%= url %>
    Thanks!`
}

module.exports = ({ env }) => ({
  admin: {
    auth: {
      secret: env('ADMIN_JWT_SECRET'),
    },
    forgotPassword: {
      emailTemplate: forgotPasswordTemplate
    }
  },
  host: env('HOST', '0.0.0.0'),
  port: env.int('PORT', 1337),
  cron: {
    enabled: true
  }
});
```

7. `git add . && git commit -m "Add e-mail support."`
8. `git push platform email`
9. Verify that you can click the *Forgot password* link, submit, and receive an email to reset your password. 
10. `platform merge email`

Move onto [multi-app configuration](05-multi-app.md).
