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

```
$ vsce publish <major|minor|patch>
```

## Access Token

Follow instructions here: https://code.visualstudio.com/api/working-with-extensions/publishing-extension#get-a-personal-access-token
