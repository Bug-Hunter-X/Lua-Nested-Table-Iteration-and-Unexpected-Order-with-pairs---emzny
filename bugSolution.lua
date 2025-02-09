-- Solution using ipairs to guarantee order if keys are numeric
local function foo(t)
  local keys = {}
  for k, v in pairs(t) do
    table.insert(keys, k)
  end
  table.sort(keys)
  for _, k in ipairs(keys) do
    if type(t[k]) == "table" then
      foo(t[k])
    end
  end
end

local t = {a = 1, b = {c = 2, d = {e = 3}}}
foo(t) 
print(t)  --Table will be processed correctly, as order is now guaranteed

--Alternative, if you cannot change the table structure for iteration
--Create a copy of the table to iterate over and make changes to the copy
local function foo_copy(t)
  local t_copy = lua_deepcopy(t)  --Requires deepcopy function from external library
  for k, v in pairs(t_copy) do
    if type(v) == "table" then
      foo_copy(v)
    end
  end
end

--Lua deepcopy function (example - needs a proper solution for real applications)
function lua_deepcopy(orig)
  local orig_type = type(orig)
  local copy
  if orig_type == 'table' then
    copy = {}
    for orig_key, orig_value in next, orig, nil do
      copy[lua_deepcopy(orig_key)] = lua_deepcopy(orig_value)
    end
  else
    copy = orig
  end
  return copy
end

local t = {a = 1, b = {c = 2, d = {e = 3}}}
foo_copy(t)
print(t) --Original table remains unchanged, only a copy is modified