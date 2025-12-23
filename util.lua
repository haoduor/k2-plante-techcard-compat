local M = {}

-- =============================================================================
-- 导出的函数：替换所有科技中的特定科技瓶
-- =============================================================================

--- 替换游戏中所有科技（Technology）成本中的某个物品（科技瓶）。
---
--- @param old_pack_name string 要查找并替换的旧科技瓶的名称（例如: "science-pack-1"）
--- @param new_pack_name string 替换成的新科技瓶的名称（例如: "science-pack-2"）
function M.replace_science_pack_in_all_technologies(old_pack_name, new_pack_name)
    -- 确保 data.raw.technology 存在并且名称不为空
    if not data or not data.raw or not data.raw.technology or not old_pack_name or not new_pack_name then
        log("警告: 无法执行科技瓶替换。数据结构或名称参数缺失。", true)
        return
    end

    local technologies = data.raw.technology
    local replacement_count = 0

    -- 遍历所有科技定义
    for name, technology in pairs(technologies) do
        -- 检查科技是否有 unit (研究消耗) 部分
        if technology.unit and technology.unit.ingredients then
            local ingredients = technology.unit.ingredients
            local found_match = false

            -- 遍历 ingredients 数组 (科技瓶配方)
            for i, ingredient in ipairs(ingredients) do
                -- ingredient 是一个数组，格式为 {"物品名称", 数量}
                local item_name = ingredient[1]

                -- 检查物品名称是否与要替换的旧科技瓶名称匹配
                if item_name == old_pack_name then
                    -- 找到了！执行替换操作
                    ingredient[1] = new_pack_name
                    found_match = true
                end
            end

            if found_match then
                replacement_count = replacement_count + 1
                log("已在科技 '" .. name .. "' 替换")
            end
        end
    end

    log("信息：科技瓶替换完成。总共修改了 " .. replacement_count .. " 个科技。")
end

function M.add_lab_input(lab_name, input)
    if not data.raw.lab[lab_name] then
        return
    end
    local lab = data.raw.lab[lab_name]
    if not lab.inputs then
        lab.inputs = {}
    end
    lab.inputs[#lab.inputs + 1] = input
end

function M.remove_lab_input(lab_name, input_name)
	local lab = data.raw.lab[lab_name]
	local inputs = lab.inputs
	for i = 1, #inputs do
		if inputs[i] == input_name then
			table.remove(inputs, i)
			return
		end
	end
end

return M

