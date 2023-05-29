import argparse
import json
import os.path
import toml

VIMSTART = '''
hi clear
set background=dark
if exists("syntax_on")
    syntax reset
endif
set termguicolors
'''


def gen_vim(palette, vim):
    color_theme = [
        VIMSTART,
        f"let g:colors_name='{vim['colors_name']}'",
        f"hi Normal guibg={palette['editor']['background']}",
    ] + [
        f"hi {hl_group} guifg={palette['tokens'][color]} guibg=NONE gui=NONE"
        for color, hl_groups in vim["groups"].items()
        for hl_group in hl_groups
    ] + [
        f"hi! link {source} {destination}"
        for destination, sources in vim["links"].items()
        for source in sources
    ]
    try:
        path = os.path.normpath(vim["file"])
        print(f"saving {path}...")
        with open(path, "w") as f:
            f.writelines("\n".join(color_theme))
    except KeyError:
        print("\n[[=== Vim ===]]")
        print("\n".join(color_theme))


def gen_vscode(palette, vscode):
    print("generating VS Code theme...")
    color_theme = {
        "$schema": "vscode://schemas/color-theme",
        "name": vscode["name"],
        "type": vscode["type"],
        "colors": {
            scope: palette["editor"][color]
            for color, scopes in vscode["colors"].items()
            for scope in scopes
        },
        "tokenColors": [
            {
                "scope": scopes,
                "settings": {"foreground": palette["tokens"][color]}
            }
            for color, scopes in vscode["tokenColors"].items()
        ],
    }
    try:
        save_json(color_theme, vscode["file"])
    except KeyError:
        print("\n[[=== VS Code ===]]")
        print(json.dumps(color_theme, indent=2))


def load_toml(file):
    path = os.path.normpath(file)
    print(f"loading {path}...")
    with open(path) as f:
        toml_obj = toml.load(f)
    return toml_obj


def save_json(data, file):
    path = os.path.normpath(file)
    print(f"saving {path}...")
    with open(path, "w") as f:
        json.dump(data, f, indent=2)


def save_chromaplay(palette, file):
    print("generating Chromaplay file for palette...")
    colors = []
    for color in palette["tokens"].values():
        if color not in colors:
            colors.append(color)
    chromaplay = {
        "background": palette["editor"]["background"],
        "colors": colors
    }
    save_json(chromaplay, file)


def validate_palette(palette):
    print("validating palette...")
    required_keys = ["editor", "tokens"]
    required_editor_keys = ["foreground", "background"]
    required_token_keys = [
        "foreground", "punctuation", "keywords", "functions",
        "strings", "constants", "other", "comments", "changed",
        "deleted", "inserted"
    ]
    for k in required_keys:
        if k not in palette:
            raise Exception(f"{k} not in palette")
    for k in required_editor_keys:
        if k not in palette["editor"]:
            raise Exception(f"{k} not in 'editor' section")
    for k in required_token_keys:
        if k not in palette["tokens"]:
            raise Exception(f"{k} not in 'tokens' section")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("theme_dir", help="The directory with a palette.toml and <editor>.toml files")
    args = parser.parse_args()
    palette = load_toml(f"{args.theme_dir}/palette.toml")
    validate_palette(palette)

    # I always want a JSON file that matches my TOML file so I can load it into Chromaplay when I need to.
    save_chromaplay(palette, f"{args.theme_dir}/chromaplay.json")

    if os.path.exists(f"{args.theme_dir}/vim.toml"):
        vim = load_toml(f"{args.theme_dir}/vim.toml")
        gen_vim(palette, vim)
    if os.path.exists(f"{args.theme_dir}/vscode.toml"):
        vscode = load_toml(f"{args.theme_dir}/vscode.toml")
        gen_vscode(palette, vscode)
