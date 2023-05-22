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

def gen_vs_code(palette):
    vscode = load_toml("vscode.toml")
    color_theme = {
        "$schema": "vscode://schemas/color-theme",
        "name": vscode["name"],
        "type": vscode["type"],
        "colors": {scope:palette["editor"][color] for color,scopes in vscode["colors"].items() for scope in scopes},
        "tokenColors": [{ "scope": scopes, "settings": { "foreground": palette["tokens"][color] }} for color,scopes in vscode["tokenColors"].items()],
    }
    try:
        with open(vscode["file"], "w") as f:
            json.dump(color_theme, f, indent=2)
    except KeyError:
        print("\n[[=== VS Code ===]]")
        print(json.dumps(color_theme, indent=2))


def load_toml(file):
    with open(file) as f:
        toml_obj = toml.load(f)
    return toml_obj


if __name__ == "__main__":
    palette = load_toml("palette.toml")
    # gen_sublime(palette)
    # gen_vim(palette)
    gen_vs_code(palette)

