function main()
    -- Tables
    tbl1 = {"alpha", "beta", "gamma"}
    tbl2 = {"delta", "epsilon", "zeta"}
    tbl3 = {"Babe"}
    tbl4 = {["Night elf"] = "Nachtelf"}
    mt = {}    
   
    enUS_defaults = {
        ["Human"] = "Human",
        ["Night elf"] = "Night elf",
    }

    -- Metatable Setup
    setmetatable(tbl1, mt)
    setmetatable(tbl2, mt)
    setmetatable(tbl3, mt)
    setmetatable(tbl4, mt)
    
    --[[
    List of Functions
        mt.__add(tbl1, tbl2)
        mt.__tostring(tbl1)
        mt.__cat()
    --]]
    
    -- TEST - mt.__add 
    --[[
    add_test = tbl1 + tbl2
    print(#add_test)

    for i = 1, #add_test do
        print(i, add_test[i])
    end
    --]]

    -- TEST - mt.__unm
    --[[
    unm_test = -tbl1
    for i = 1, #unm_test do
        print(i, unm_test[i])
    end
    unm_test = -tbl1 + tbl2
    for i = 1, #unm_test do
        print(i, unm_test[i])
    end
    --]]

    -- TEST - 
end

-- Function Definitions

-- mt.__add
-- Returns the combination of two tables 'a' and 'b' as a single table 'result'
function mt.__add(a, b)
    local result = setmetatable({}, mt)

    -- Copy table a in first
    for i = 1, #a do
        table.insert(result, a[i])
    end

    -- Copy table b in second
    for i = 1, #b do
        table.insert(result,b[i])
    end

    return result
end


-- mt.__unm (unary minus [negation] operator)
-- returns the result of the argument being negated
-- If given an array, this means reversing the array part of the given table
function mt.__unm(a)
    local result = setmetatable({}, mt)

    -- Reverse through the elments of the array
    for i = #a, 1, -1 do
        table.insert(result, a[i])
    end

    return result
end

-- mt.__tostring
-- compiles elements of a metatable and converts them to a string.
-- print (tbl) might would output {alpha, beta, gamma}
function mt.__tostring(tbl)
    local result = "{"
    for i = 1, #tbl do
        if i > 1 then
            result = result .. ", "
        end
        result = result .. tostring(tbl[i])
    end
    result = result .. "}"
end

-- mt.__concat
-- Uses the "__add" functionality to concatinate two different tables.
function mt.__concat = mt.__add

-- default metatable
defaults_mt = {
    __index = function(tb1, key)
        if type(key) == "string" then
            print ("Return default value of '" .. key .. "' for key: " .. key)
            return key
        else
            return nil
        end
    end,
} 

main()

print "End of call"


setmetatable(enUS_defaults, defaults_mt)

print(tbl4["Night elf"])

print(tbl4["Human"])

print(tbl3["Night elf"])

print("END of LUA TESTING")
