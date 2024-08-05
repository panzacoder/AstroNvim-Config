# jondkinney AstroNvim Template

**NOTE:** This is for AstroNvim v4+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Fork the repository, then clone

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim
```

## Plugin Conventions

#### Each plugin in the plugins directory should adhere to the following conventions:

Example plugin file path: `./lua/plugins/plugin_name.lua`

1.  Add a documentation section to the top of the plugin specifying 4 things:
    * Linking to the plugin's home page(s)
    * Describe the plugin's functionality
    * Describe any settings configured
    * Note if this plugin is available in AstroCommunity and why we aren't using that version


2. Add type annotations for the Lazy plugin spec right before the return {} 

    ```lua
    ---@type LazySpec
    return {
      -- plugin details here
    }
    ```

3. If two plugins are needed to achieve a desired outcome, configure them in the
same plugin file in `./lua/plugins/`. See the `zoom-focus.lua` plugin for an
example.


4. Small keymap changes or additions and global vim config settings should be made in the `astrocore.lua` file.


5. If a plugin is currently disabled because it's causing issues, do two things to help denote that problem: 

    1. Add a line to the top of the file to early return

        ```lua
        if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
        ```

    2. Change the plugin's filename to `<plugin_name>.disabled.lua`

6. If a plugin is currently experimental, meaning its behavior hasn't been verified yet:

    1. Add a code comment at the bottom of the code comment template 

        ```lua
        -- TODO: validate that the <file-name> plugin works and is desired
        ```

    2. Change the plugin's filename to `<plugin_name>.experimental.lua`

7. If a plugin is overriding default functionality of AstroNvim:

    1. Change the plugin's filename to `<plugin_name>.override.lua`
