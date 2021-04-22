<p align="center">
  <a href="https://github.com/github_username/repo_name">
    <img src="https://pbs.twimg.com/card_img/1384519264758079489/bLloyf2B?format=jpg&name=900x900" />
  </a>

  <h1 align="center">Build a production Strapi instance service <br />by service with Platform.sh</h1>

  <p align="center">
    <strong>StrapiConf 2021 - Thursday, April 22 | 1:30PM PST</strong>
    <br />
        <br />
      <a href="https://console.platform.sh/projects/create-project?template=https://raw.githubusercontent.com/platformsh/template-builder/master/templates/strapi/.platform.template.yaml&utm_content=strapi&utm_source=github&utm_medium=button&utm_campaign=deploy_on_platform">
        <img src="https://platform.sh/images/deploy/lg-blue.svg" alt="Deploy on Platform.sh" width="180px" />
    </a>
        <br />
  <h2 align="center">Hello StrapiConf!</h2>
    <br />
<p align="center"> This workshop will take you through the steps of building a production-ready Strapi instance on Platform.sh.</p>

Platform.sh is a second-generation Platform-as-a-Service built especially for continuous deployment. It allows you to host web applications on the cloud while making your development and testing workflows more productive.

During this workshop, we will be using [Strapi's FoodAdvisor demo](https://github.com/strapi/foodadvisor/tree/master/api) as a guide. We'll deploy an updated version of that repository to Platform.sh, and then we'll make incremental changes as we build out the app, exploring how configuration and deployments work along the way.
  </p>
</p>

# Platform.sh StrapiConf 2021 Workshop

Hello StrapiConf! 

This workshop will take you through the steps of building a production-ready Strapi instance on Platform.sh. 

Platform.sh is a second-generation Platform-as-a-Service built especially for continuous deployment. It allows you to host web applications on the cloud while making your development and testing workflows more productive.

During this workshop, we will be using [Strapi's FoodAdvisor demo](https://github.com/strapi/foodadvisor/tree/master/api) as a guide. We'll deploy an updated version of that repository to Platform.sh, and then we'll make incremental changes as we build out the app, exploring how configuration and deployments work along the way.

## Before the workshop

### 1. Sign up and create a project

Before the conference, you should take the time to deploy this repository on Platform.sh and create a free trial account. It doesn't take long, all you need to do is click the button below to start. 

<p align="center">
    <a href="https://console.platform.sh/projects/create-project?template=https://raw.githubusercontent.com/platformsh/template-builder/master/templates/strapi/.platform.template.yaml&utm_content=strapi&utm_source=github&utm_medium=button&utm_campaign=deploy_on_platform">
        <img src="https://platform.sh/images/deploy/lg-blue.svg" alt="Deploy on Platform.sh" width="180px" />
    </a>
</p>

The button above will allow you to start a free trial account, give you access to the Platform.sh management console, and create your first project initialized with this repository. It has been configured to deploy automatically, and to seed data so that you can start working with real data on Platform.sh right away. 

You will be asked for your personal information, what you would like to name the project, and the region you want the project to exist on. Usually we recommend selecting a region closest to the location of your customers, but feel free to choose any of the available regions - such as the one closest to your location. 

### 2. Install the CLI

During the workshop we will inspect, modify, and interact with your project on Platform.sh while we set up Strapi. One of the most important tools for doing this is the Platform.sh CLI, so it will be helpful to have it installed before starting. 

```bash
curl -sS https://platform.sh/cli/installer | php
```

> **Note:**
>
> In some Windows terminals you may need `php.exe` instead of `php`. Windows 10 users may run into some trouble later in the demo, especially when SSHing into the container and when importing the demo database. Let us know in `#platformsh-workshop` if you are using Windows 10 so that we can help you set up the CLI while the conference is going on.

### 3. Log into your account locally

In order to inspect and communicate with your project from the terminal, you will need to authenticate through the CLI. 

In your terminal, run the command `platform login`. This command will set up a certificate-based authentication: it will issue a certificate that gets stored in your local SSH configuration, one that will be cycled every hour so long as you have an active session to Platform.sh. This means on the day of the workshop, you will need to run this command again to interact with your project and participate. 

Once you're logged in and created your project in step **1**, you can view it with the command `platform list`. Your project will have a project ID associated with it, and you can further inspect information about the project with the command `platform project:info -p PROJECT_ID`

### 4. Clone locally

Once you have created a project and installed the CLI, you're nearly ready for the workshop. Since you will be modifying the codebase locally throughout, you will need to clone a copy of it on your computer. Using the same project ID in the previous section, run the command:

```bash
platform project:get -p PROJECT_ID
```

### 5. (Optional) Creating and admin user

Once you have deployed this repository, you will have a demo Strapi instance available on your project that will be accessible from a generated url of the form `api.master-<hash_string>.<REGION>.platform.site`. 

## The Workshop

During StrapiConf, members of the Platform.sh team will be present on the StrapiConf Discord in the following channels:

- `#platform-sh-text`
- `#platform-sh-voice`

At any time during the conference feel free to message our team for more information about Platform.sh. 

During the workshop itself, however, we will use the `#platform-sh-workshop` primarily for questions and help. 

Your primary contacts during the workshop will be Chad Carlson, Robert Douglass, and Guillaume Moigneu. 

We will use Zoom as our primary method for going through steps, and breakout rooms for detailed help on individual steps. 

### Outline

The workshop will take you from the initial demo repository to a multi-app restaurant review site (the full Food Advisor demo), using PostgreSQL as the primary database. Along the way we'll go through the following steps:

1. **Platform.sh introduction:** 
2. **Development environments:**
3. **Managed services:**
4. **Environment variables:**
5. **Testing:**
6. **Multi-app configuration:**



Generally, the workshop will have the following parts:

1. **Platform.sh introduction:** 

    - a tour of the management console
    - the Platform.sh philosophy
    - the basics of a project
    - the basics of configuration 
    - the basics of environments
    - the basics of the demo/repository

2. **Environments and environment variables:** enabling e-mail for forgotten passwords.
3. **Managed services:** adding PostgreSQL, and using it as your primary database.
4. **Testing:** set up basic testing modifying public permissions, and testing your API using Postman.
5. **Managing secrets:** using Vault to secure access to your application.
6. **Caching:** using [`strapi-middleware-cache`](https://github.com/patrixr/strapi-middleware-cache) and [Redis](https://docs.platform.sh/configuration/services/redis.html) for caching.
7. **Next steps:** runtime write access, multi-app projects, and additional resources. 

We will guide you through the steps during the workshop, with all code snippets and changes documented in the links above. 

Excited to see you at this year's StrapiConf!
