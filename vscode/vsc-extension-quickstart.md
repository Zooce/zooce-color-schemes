# Development Guide

## Local Testing and Development

There should be a .vscode/launch.json here that looks like this:

```json
{
	"version": "0.2.0",
    "configurations": [
        {
            "name": "Extension",
            "type": "extensionHost",
            "request": "launch",
            "args": [
                "--extensionDevelopmentPath=${workspaceFolder}"
            ]
        }
    ]
}
```

To run it just press `F5` then in the dev window that popups up, change the color theme to the one you're working on. Search for `tokens and scopes` in the Command Palette to view scopes under your cursor. Changes to the color scheme should show up without having to reload.

## Adopt your theme to Visual Studio Code

* The token colorization is done based on standard TextMate themes. Colors are matched against one or more scopes.

To learn more about scopes and how they're used, check out the [color theme](https://code.visualstudio.com/api/extension-guides/color-theme) documentation.

## Install your extension

* To start using your extension with Visual Studio Code copy it into the `<user home>/.vscode/extensions` folder and restart Code.
* To share your extension with the world, read on https://code.visualstudio.com/docs about publishing an extension.

# More Notes

## Publish

See: https://code.visualstudio.com/api/working-with-extensions/publishing-extension

### Step 1 - Publish

> Do this first so the package.json version is updated

```
$ (cd vscode && npx @vscode/vsce publish <major|minor|patch>)
```

### Step 2 - Update CHANGELOG.md

### Step 3 - Commit and push changes

```
$ git add vscode/*
$ git commit -m "vscode: publish [version]"
$ git push origin
```

## Access Token

> WARNING: This process is a pain in the ass!!

Follow instructions here: https://code.visualstudio.com/api/working-with-extensions/publishing-extension#get-a-personal-access-token
