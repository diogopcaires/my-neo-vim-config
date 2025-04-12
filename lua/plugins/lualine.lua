return {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons', 'Mofiqul/dracula.nvim'},
    config = function()
        -- 🧠 Memória usada (em MB)
        local function memory_usage()
            local handle = io.popen("ps -o rss= -p " .. vim.fn.getpid())
            local result = handle:read("*a")
            handle:close()
            local mem_kb = tonumber(result)
            if not mem_kb then
                return '🧠 N/A'
            end
            local mem_mb = math.floor(mem_kb / 1024)
            return '🧠 ' .. mem_mb .. 'MB'
        end

        -- 🔥 CPU usage (load average)
        local function cpu_usage()
            local handle = io.popen("uptime | awk -F'load averages?: ' '{ print $2 }'")
            local result = handle:read("*a")
            handle:close()
            local load = result:match("^[%d%.]+")
            return load and ('🔥 ' .. load) or '🔥 N/A'
        end

        -- 🕐 Hora com ícone animado
        local function animated_clock()
            local clocks = {'🕐', '🕑', '🕒', '🕓', '🕔', '🕕', '🕖', '🕗', '🕘', '🕙', '🕚',
                            '🕛'}
            local hour = tonumber(os.date('%I'))
            return clocks[hour] .. ' ' .. os.date('%H:%M')
        end

        -- 🔄 LSP com animação e cores diferentes para conectado/desconectado
        local lsp_spinner_frames = {'⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'}
        local function lsp_status_animated()
            local clients = vim.lsp.get_active_clients({
                bufnr = 0
            })
            local lsp_status = ''
            local color = '' -- Para definir a cor dinamicamente

            if #clients == 0 then
                -- Animação enquanto o LSP não está conectado
                local frame = lsp_spinner_frames[math.floor(vim.loop.hrtime() / 10000000) % #lsp_spinner_frames + 1]
                lsp_status = frame .. ' LSP: starting...'
                color = {
                    fg = '#FFA500'
                } -- Laranja para LSP desconectado
            else
                -- LSP conectado
                local names = {}
                for _, client in ipairs(clients) do
                    table.insert(names, client.name)
                end
                lsp_status = ' ' .. table.concat(names, ', ')
                color = {
                    fg = '#32CD32'
                } -- Verde para LSP conectado
            end

            return lsp_status, color
        end

        -- 🎨 Setup do lualine com tema Dracula
        require('lualine').setup {
            options = {
                theme = 'dracula', -- Tema Dracula
                section_separators = {
                    left = '',
                    right = ''
                },
                component_separators = {
                    left = '',
                    right = ''
                },
                globalstatus = true -- Exibe status global (sem estar restrito ao buffer atual)
            },
            sections = {
                lualine_a = {'mode'}, -- Exibe o modo (insira, normal, etc.)
                lualine_b = {'branch', 'diff'}, -- Exibe a branch do git e a diferença no código
                lualine_c = {'filename'}, -- Exibe o nome do arquivo
                lualine_x = { -- O status do LSP com animação e cor dinâmica
                {
                    lsp_status_animated,
                    color = function()
                        local status, color = lsp_status_animated()  -- Obtemos a cor do LSP
                        return color
                    end
                }},
                lualine_y = {'filetype'}, -- Exibe o tipo do arquivo (por exemplo, lua, python)
                lualine_z = {'location'} -- Exibe a localização do cursor
            },
            extensions = {'fugitive'} -- Extensão fugitive para integração com git
        }
    end
}
