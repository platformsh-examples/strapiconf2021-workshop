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


Move onto [testing](05-testing.md).
