<p align="center">
  <a href="https://platform.sh/marketplace/strapi">
    <img src="docs/images/cta-blocks.jpg" />
  </a>

  <!-- <h1 align="center">Build a production Strapi instance service <br />by service with Platform.sh</h1> -->

  <p align="center">
    <strong>StrapiConf 2021 - Thursday, April 22 | 1:30PM PST</strong>
    <br />
        <br />
      <a href="https://console.platform.sh/projects/create-project?template=https://github.com/platformsh-examples/strapiconf2021-workshop.git">
        <img src="https://platform.sh/images/deploy/lg-blue.svg" alt="Deploy on Platform.sh" width="200px" />
    </a>
                <br />
        <br />
                      <a href="https://www.youtube.com/watch?v=yqt6zNNOL1Y">Watch the workshop on YouTube</a>
        <br />
    <br />

</p>

This workshop will take you through the steps of building a production-ready Strapi instance on Platform.sh. Platform.sh is a second-generation Platform-as-a-Service built especially for continuous deployment. It allows you to host web applications on the cloud while making your development and testing workflows more productive.

During this workshop, we will be using [Strapi's FoodAdvisor demo](https://github.com/strapi/foodadvisor) as a guide. We'll deploy an updated version of that repository to Platform.sh, and then we'll make incremental changes as we build out the app, exploring how configuration and deployments work along the way.

* [Before the workshop](#before-the-workshop)
* [Workshop outline](#workshop-outline)
* [Contacts](#contacts)
* [Get started](#get-started)

### Before the workshop

#### 1. Sign up and create a project

Before the workshop, you should take the time to deploy this repository on Platform.sh and create a free trial account. It doesn't take long, all you need to do is click the **Deploy on Platform.sh** above to start. 

The button above will allow you to start a free trial account, give you access to the Platform.sh management console, and create your first project initialized with this repository. It has been configured to deploy automatically, and to seed data so that you can start working with real data on Platform.sh right away. 

You will be asked for your personal information, what you would like to name the project, and the region you want the project to exist on. Usually we recommend selecting a region closest to the location of your customers, but feel free to choose any of the available regions - such as the one closest to your location. 

#### 2. Install the CLI

During the workshop we will inspect, modify, and interact with your project on Platform.sh while we set up Strapi. One of the most important tools for doing this is the Platform.sh CLI, so it will be helpful to have it installed before starting. 

```bash
curl -sS https://platform.sh/cli/installer | php
```

> **Note:**
>
> In some Windows terminals you may need `php.exe` instead of `php`. Windows 10 users may run into some trouble later in the demo, especially when SSHing into the container and when importing the demo database. Let us know in `#platformsh-workshop` if you are using Windows 10 so that we can help you set up the CLI while the conference is going on.

#### 3. Log into your account locally

In order to inspect and communicate with your project from the terminal, you will need to authenticate through the CLI. 

In your terminal, run the command `platform login`. This command will set up a certificate-based authentication: it will issue a certificate that gets stored in your local SSH configuration, one that will be cycled every hour so long as you have an active session to Platform.sh. This means on the day of the workshop, you will need to run this command again to interact with your project and participate. 

Once you're logged in and created your project in step **1**, you can view it with the command `platform list`. Your project will have a project ID associated with it, and you can further inspect information about the project with the command `platform project:info -p PROJECT_ID`

#### 4. Clone locally

Once you have created a project and installed the CLI, you're nearly ready for the workshop. Since you will be modifying the codebase locally throughout, you will need to clone a copy of it on your computer. Using the same project ID in the previous section, run the command:

```bash
platform project:get -p PROJECT_ID
```

#### 5. (Optional) Creating an admin user

Once you have deployed this repository, you will have a demo Strapi instance available on your project that will be accessible from a generated url of the form `api.master-<hash_string>.<REGION>.platform.site`. You can visit that URL at `/admin` and create an admin user to have a quick walkthrough of the demo project. You will see that it has been seeded with a restaurant review backend (courtesy of FoodAdvisor).

### Workshop outline

During StrapiConf, members of the Platform.sh team will be present on the StrapiConf Discord in the following channels:

- `#platform-sh-text`
- `#platform-sh-voice`

At any time during the conference feel free to message our team for more information about Platform.sh. During the workshop itself, however, we will use the `#platform-sh-workshop` primarily for questions and help. Your primary contacts during the workshop will be Chad Carlson, Robert Douglass, and Guillaume Moigneu. We will use Zoom as our primary method for going through steps, and breakout rooms for detailed help on individual steps. 

### Outline

This workshop will take you from the initial demo repository to a multi-app restaurant review site (the full Food Advisor demo), using PostgreSQL as the primary database. Along the way we'll go through the following steps:

1. **Platform.sh introduction:** We'll first cover Platform.sh - what it is, how it works, and the basic concepts to get you started with the workshop.
2. **Development environments:** Here we'll start making changes to Strapi, by first making the generated OpenAPI specification publicly accessible. 
3. **Managed services:** The demo starts out using SQLite to store the FoodAdvisor data. In this step, we'll use Platform.sh's service configuration to switch that out with PostgreSQL.
4. **Multi-app configuration:** Platform.sh is unique when it comes to decoupled applications. Our configuration supports multiple applications in a single project, where each get their own containers that can communicate with each other. Here we'll add the frontend ReactJS FoodAdvisor application to the cluster, and finish building our restaurant review site. 
5. **Testing:** Platform.sh contains three main hooks - build, deploy, and post deploy. In those hooks you can not only define how your Strapi application's builds, but also define your entire CI pipeline tests to be run on every commit. In this step, we'll add one of these tests. 
8. **Next steps:** Strapi, like many frameworks and applications, comes with some caveats when working with it on Platform.sh. Here we'll review some of the choices that were made in this demo and why, some creative configuration that can be used to extend Strapi in certain ways, and additional resources from Platform.sh that you can look at after the workshop. 

### Contacts

During StrapiConf, members of the Platform.sh team will be present on the StrapiConf Discord in the following channels:

- `#platform-sh-text`
- `#platform-sh-voice`

At any time during the conference feel free to message our team for more information about Platform.sh. 

During the workshop itself, however, we will use the **`#platform-sh-workshop`** primarily for questions and help. Your primary contacts during the workshop will be Chad Carlson, Robert Douglass, and Guillaume Moigneu. We will use Zoom as the main method for going through the workshop, and breakout rooms for detailed help on individual steps. Each of those steps has its own page in `/docs` that will contain all of the code snippets you'll need to complete the site. 

### Get started

If you've completed all of the [*Before the workshop*](#before-the-workshop) steps above, feel free to move onto the [Introduction](docs/01-introduction.md).
