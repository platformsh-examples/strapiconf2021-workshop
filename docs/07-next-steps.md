<p align="center">
  <a href="https://platform.sh/marketplace/strapi/">
    <img src="https://platform.sh/images/spots/arrows/fast-dev.svg" />
  </a>

  <h1 align="center">Next steps</h1>
</p>

## If there's time

You will notice that the production site does not have images. This is partially due to the quality of the database dump I created (nice one), but it does provide an opportunity to explore how data works on Platform.sh. 

1. Go to your `master` environment, log into your Admin account, and go to the `Restaurants` collection. 
2. There are 5 restaurants. Add an image to each of them from the local `strapi/scripts/images` directory. 
3. You can update the frontend consuming Strapi by running `platform environment:redeploy -e master`.



Congrats! You've completed the workshop. Together we've deployed Strapi's FoodAdvisor demo to Platform.sh. From this point you can customize your application in additional development environments to deliver your own decoupled Strapi-powered site.

## Considerations

- Keeping your work: [setting up an integration](https://docs.platform.sh/integrations/source.html)
- Strapi development servers, and write access
- Editorial workflows and the flow of data on Platform.sh
- Lifecycle hooks & Gatsby Live Preview/Incremental builds

## Additional resources

- [Platform.sh site](https://platform.sh/marketplace/strapi/)
- [Platform.sh public documentation](https://docs.platform.sh)
- [Platform.sh API documentation](https://api.platform.sh/docs)
- [The original FoodAdvisor repository](https://github.com/strapi/foodadvisor)
- [The standard Platform.sh template](https://github.com/platformsh-templates/strapi)
- [Strapi backend, Eleventy frontend Platform.sh multi-app template](https://github.com/platformsh-templates/eleventy-strapi)
- [Strapi backend, Gatsby frontend Platform.sh multi-app template](https://github.com/platformsh-templates/gatsby-strapi)
- Docs: [Strapi backend](https://docs.platform.sh/guides/gatsby/headless/strapi.html) and [Gatsby frontend](https://docs.platform.sh/guides/gatsby/deploy.html) in-detail guides
- [Deploy Friday livestream: E02 Gatsby & headless CMS, including Strapi, Drupal, and Oracle Content & Experience](https://www.youtube.com/watch?v=H1WNHVXJiUg) with Pierre Burgy
