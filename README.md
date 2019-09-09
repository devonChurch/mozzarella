# Mozzarella 🧀 🍕 😋

[![Build Status](https://dev.azure.com/notifydevon/notifydevon/_apis/build/status/devonChurch.mozzarella?branchName=master)](https://dev.azure.com/notifydevon/notifydevon/_build/latest?definitionId=1&branchName=master)

## What 👋

A build pipeline leveraging **Angular** and **Azure** as an application base with enhanced testing capabilities using **Cypress**.

## Note 📋

This is a barebones _proof-of-concept_ that was used as the catalyst for a _green field_ project during a contracting tenure.

## Why 🤔

I felt that Angular's default deployment configuration was lacking in areas that I had already solutionized in the React world.

- ### Environment Configuration 😞

  Angular’s built-in `environments` files require a new build _"trigger"_ for each version to be populated with their environment-specific parameters. This slows down build times and mutates previously tested build artifacts.

- ### End-to-end Tests 😦

  Angular’s built-in _e2e_ testing library **Protactor** felt cumbersome, verbose, slow and unreliable compared to newer alternatives like **Puppeteer** and **Cypress**. Having confidence in a tests suites reliability is important to promote the expansion of tests through the codebase.

- ### Visual Regression 😥
  Angular lacks a built-in visual regression system. When developing a UI component architecture, confidence in not only the mechanics but also the aesthetics is critical to achieving fast, robust code iteration.

## How 💡

With a few small but crucial amendments to the Angular boilerplate, I have a much more robust deployment system.

![mozzarella-diagram](https://user-images.githubusercontent.com/15273233/64516694-06b05600-d343-11e9-9c58-3f6046cca3e8.png)

- ### Environment Configuration 😊

  All builds are now environment agnostic in that augmentation relating to environments happen at runtime via an external configuration dependency. This allows the initial build artifact that Azure creates to be leveraged throughout each stage in the QA process `Staging`, `UAT`, `Production` etc. Each environment _(including `Development`)_ has a bespoke configuration file that is referenced by the application at run time.

  ![Screen Shot 2019-09-04 at 4 47 36 PM](https://user-images.githubusercontent.com/15273233/64517075-bab1e100-d343-11e9-85d5-865e0d915228.png)

- ### End-to-end Tests 😀

  Cypress has replaced Protractor as the _e2e_ testing library. Its fast, reliable and tests can be written in a very lean format. Cypress's development mode is unrivaled and brings simplicity and elegance to this testing genre.

  ![squirrel-build](https://user-images.githubusercontent.com/15273233/64516915-61e24880-d343-11e9-8c86-03835a02aba1.gif)

- ### Visual Regression 😍

  Leveraging Cypress with [**Cypress Image Snapshot**](https://github.com/palmerhq/cypress-image-snapshot) and **Docker** creates a solid platform that can test application aesthetics regardless of environment configuration (_Windows_, _MacOS_, _Linux_). In that regard, the visual regression suite can be run consistently on _Local_ and _CI/CD_ environments.

  ![application-home-page diff](https://user-images.githubusercontent.com/15273233/64517491-8d196780-d344-11e9-95be-929eed31fdf4.png)

## License 📜

MIT
