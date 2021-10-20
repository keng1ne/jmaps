local M = {}

local json_decode = function(data)
    local ok, result = pcall(vim.fn.json_decode, data)
    if ok then
        return result
    else
        return nil, result
    end
end

local load_settings = function(settings)
    local opts = settings['opts'] or {}
    local maps = settings['maps'] or {}
    for mode, value in pairs(maps) do
        if value then
            for key, func in pairs(value) do
                vim.api.nvim_set_keymap(
                    mode,
                    key,
                    func,
                    opts
                )
            end
        end
    end
end

local load_from_path = function(path)
    vim.validate {
        path = { path, 's' },
    }

    local decoded, err = json_decode(vim.fn.readfile(path))
    if err ~= nil then
        print('error while loading keymaps', err)
        return true
    end
    if decoded == nil then
        return
    end

    load_settings(decoded)
end

M.setup = function(path)
    vim.validate {
        path = { path, 's' },
    }

    load_from_path(path)
end

return M
