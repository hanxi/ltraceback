local tb = require "traceback.c"
local max_depth= 10
local max_ele = 10
local max_string = 100
local max_len = 1000
local levels1 = 10
local levels2 = 11
debug.traceback = tb.get_traceback(max_depth, max_ele, max_string, max_len, levels1, levels2)

local z = "test upvalue a"

local function getupvaluetable(u, func, unique)
    local i = 1
    while true do
        local name, value = debug.getupvalue(func, i)
        if name == nil then
            return
        end
        local t = type(value)
        if t == "table" then
            u[name] = value
        elseif t == "function" then
            if not unique[value] then
                unique[value] = true
                getupvaluetable(u, value, unique)
            end
        end
        i=i+1
    end
end

local function dump_upvalue(func)
    local u ={}
    local unique={}
    getupvaluetable(u, func, unique)
end

local function f(a, b, c, d, e)
    local x = a
    dump_upvalue(f)
    if x/0 then
    end
end

local function f1(a, b, c, d, e)
    local y=a
    f(a,b,c,d,e)
end

local c = {2,2.22}
local a = {
    b = {"x","y"},
    c = c,
}
a.b.xx = c
a.c.yy = a.b
a.c.zz = a.b.xx

function string.fromhex(str)
    return (str:gsub('..', function (cc)
        return string.char(tonumber(cc, 16))
    end))
end
a.fuck = string.fromhex("abcdef")

local begin_clock = os.clock()
local ok, msg
local count = 10000
for i=1,count do
    ok, msg = xpcall(f1, debug.traceback, a, "xs", 1.22, 100, 1)
end
local end_clock = os.clock()
--print("msg:", msg)
print("=====================================================")
print("begin clock:", begin_clock)
print("end clock:", end_clock)
print("total clock:", end_clock-begin_clock)
print("count :", count)
print("msg len:", #msg)
