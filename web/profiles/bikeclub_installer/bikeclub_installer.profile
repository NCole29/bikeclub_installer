<?php

declare(strict_types=1);

use Drupal\Core\Form\FormStateInterface;
use Drupal\Core\Site\Settings;
use Drupal\RecipeKit\Installer\Hooks;
use Drupal\RecipeKit\Installer\Messenger;

/**
 * Implements hook_install_tasks().
 */
function bikeclub_installer_install_tasks(): array {
  $tasks = Hooks::installTasks();

  if (getenv('IS_DDEV_PROJECT')) {
    Messenger::reject(
      'All necessary changes to %dir and %file have been made, so you should remove write permissions to them now in order to avoid security risks. If you are unsure how to do so, consult the <a href=":handbook_url">online handbook</a>.',
    );
  }
  return $tasks;
}

/**
 * Implements hook_install_tasks_alter().
 */
function bikeclub_installer_install_tasks_alter(array &$tasks, array $install_state): void {
  Hooks::installTasksAlter($tasks, $install_state);

  // The recipe kit doesn't change the title of the batch job that applies all
  // the recipes, so to override it, we use core's custom string overrides.
  // We can't use the passed-in $install_state here, because it isn't passed by
  // reference.
  $langcode = $GLOBALS['install_state']['parameters']['langcode'];
  $settings = Settings::getAll();
  // @see install_profile_modules()
  $settings["locale_custom_strings_$langcode"]['']['Installing @drupal'] = 'Setting up your site';
  new Settings($settings);
}

/**
 * Implements hook_form_alter().
 */
function bikeclub_installer_form_alter(array &$form, FormStateInterface $form_state, string $form_id): void {
  Hooks::formAlter($form, $form_state, $form_id);

  if ($form_id == 'installer_recipes_form') {

    $form['civicrm'] = [
      '#markup' => t('Membership and Events recipes require CiviCRM and are available after installation.</br>CiviCRM installation takes time. Please be patient.'), 
      '#weight' => -90,
    ];
   $form['add_ons']['text'] = [
    '#prefix' => '<p class="cms-installer__info">',
    '#markup' => t('After installation, go to <em>Configuration > Development > Performance</em> and click <strong>CLEAR ALL CACHES</strong>.'),
    '#suffix' => '</p>',
    '#weight' => 100,
  ];
  }
}

/**
 * Implements hook_form_alter() for install_configure_form.
 */
function bikeclub_installer_form_install_configure_form_alter(array &$form): void {
  // We always install Automatic Updates, so we don't need to expose the update
  // notification settings.
  $form['update_notifications']['#access'] = FALSE;
}