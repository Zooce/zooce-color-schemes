import json
import toml


def gen_sublime(config):
    palette = config["palette"]
    sublime = config["sublime"]
    # todo
    print("sublime not implemented yet")

def gen_vim(config):
    palette = config["palette"]
    vim = config["vim"]
    color_theme = [f"hi {hl_group} guifg={palette[color]} ctermfg={palette[color]}" for color,hl_groups in vim["colors"].items() for hl_group in hl_groups]
    try:
        with open(vim["file"]) as f:
            f.writelines(color_theme)
    except KeyError:
        print("\n[[=== Vim ===]]")
        print("\n".join(color_theme))

def gen_vs_code(config):
    palette = config["palette"]
    vs_code = config["vs_code"]
    color_theme = {
        "$schema": "vscode://schemas/color-theme",
        "name": vs_code["name"],
        "type": vs_code["type"],
        "colors": {scope:palette[color] for color,scopes in vs_code["colors"].items() for scope in scopes},
        "tokenColors": [{ "scope": scope, "settings": { "foreground": palette[color] }} for color,scopes in vs_code["tokenColors"].items() for scope in scopes],
    }
    try:
        with open(vs_code["file"]) as f:
            json.dump(color_theme, f, indent=2)
    except KeyError:
        print("\n[[=== VS Code ===]]")
        print(json.dumps(color_theme, indent=2))


def load_toml(file):
    with open(file) as f:
        config = toml.load(f)
    return config


if __name__ == "__main__":
    config = load_toml("config.toml")
    gen_sublime(config)
    gen_vim(config)
    gen_vs_code(config)

