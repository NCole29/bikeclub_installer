# Drupal for Bike Clubs

Drupal-for-Bikeclubs is an open source product built with Drupal and CiviCRM to provide key components for cycling clubs: membership and event registration, ride calendar, and ride pages displaying RideWithGPS information.

## Getting started

Use [DDEV](https://ddev.com) to install and setup your site in a local development environment. When you have completed your site configuartion locally, you wasily migrate the site to a web host.

To use [DDEV](https://ddev.com), follow these instructions:

1. Install DDEV following the [documentation](https://ddev.com/get-started/)
2. Download drupal-bikeclub.zip 
3. Open a Terminal window and make a folder where you would like Drupal-for-Bikeclubs to be installed. 
```shell
mkdir my-site && cd my-site
```
4. Run the following command to configure the folder for Drupal and start ddev:
```shell
ddev config --project-type=drupal11 --docroot=web
ddev start
```

5. Extract the content of drupal-bikeclub.zip. 
- Copy the composer.json and readme.md to the "my-site" folder.
- Copy the web/profiles folder to "mysite/web/profiles".

6. Install Drupal-for-Bikeclubs with these commands:
```shell
ddev composer install
ddev launch
```

### Installation options

The Drupal-for-Bikeclubs installer offers a list of features preconfigured with smart defaults. You will be able to customize whatever you choose, and add additional features, once you are logged in.

## Documentation

Be sure to install the Bikeclub help module, which includes documentation for content creators and site maintainers.

In addition, learn more about managing a Drupal-based application in the [Drupal User Guide](https://www.drupal.org/docs/user_guide/en/index.html).

## Attributions

The Drupal-for-Bikeclubs installer is based on Drupal CMS and employs the Drupal Recipe Installer Kit.

[Report issues in the queue](https://drupal.org/node/add/project-issue/drupal_cms), providing as much detail as you can. You can also join the #drupal-cms-support channel in the [Drupal Slack community](https://www.drupal.org/slack).

## License

Drupal-for-Bikeclubs and all derivative works are licensed under the [GNU General Public License, version 2 or later](http://www.gnu.org/licenses/old-licenses/gpl-2.0.html).

Learn about the [Drupal trademark and logo policy here](https://www.drupal.com/trademark).
