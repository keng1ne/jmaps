# jmaps
little script for creating keybindings in a json file

## Work in Progress
Still trying to come up with a way of having multiple keys mapped to a function,
without creating a complicated json file.

Furthermore having ```["K", "<leader>F"] : "command"``` wont work obviously.

## Setup
```lua
local jmaps = require('jmaps')
jmaps.setup("~/.config/nvim/mappings.json")
```
