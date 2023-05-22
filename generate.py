import json
import toml


# def gen_sublime(config):
#     palette = config["palette"]
#     sublime = config["sublime"]
#     # todo
#     print("sublime not implemented yet")

# def gen_vim(config):
#     palette = config["palette"]
#     vim = config["vim"]
#     color_theme = [f"hi {hl_group} guifg={palette[color]} ctermfg={palette[color]}" for color,hl_groups in vim["colors"].items() for hl_group in hl_groups]
#     try:
#         with open(vim["file"]) as f:
#             f.writelines(color_theme)
#     except KeyError:
#         print("\n[[=== Vim ===]]")
#         print("\n".join(color_theme))

def gen_vscode(palette):
    vscode = load_toml("vscode.toml")
    color_theme = {
        "$schema": "vscode://schemas/color-theme",
        "name": vscode["name"],
        "type": vscode["type"],
        "colors": {scope:palette["editor"][color] for color,scopes in vscode["colors"].items() for scope in scopes},
        "tokenColors": [{ "scope": scopes, "settings": { "foreground": palette["tokens"][color] }} for color,scopes in vscode["tokenColors"].items()],
    }
    try:
        save_json(color_theme, vscode["file"])
    except KeyError:
        print("\n[[=== VS Code ===]]")
        print(json.dumps(color_theme, indent=2))


def load_toml(file):
    with open(file) as f:
        toml_obj = toml.load(f)
    return toml_obj


def load_json(file):
    with open(file) as f:
        json_obj = json.load(f)
    return json_obj


def save_json(data, file):
    with open(file, "w") as f:
        json.dump(data, f, indent=2)


def save_chromaplay(palette):
    colors = [];
    for color in palette["tokens"].values():
        if color not in colors:
            colors.append(color)
    chromaplay = {
        "background": palette["editor"]["background"],
        "colors": colors
    }
    save_json(chromaplay, "chromaplay.json")


if __name__ == "__main__":
    palette = load_toml("palette.toml")

    # I always want a JSON file that matches my TOML file so I can load it into Chromaplay when I need to.
    save_chromaplay(palette)

    # gen_sublime(palette)
    # gen_vim(palette)
    gen_vscode(palette)

