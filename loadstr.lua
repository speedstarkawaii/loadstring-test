local score = 0
local totalTests = 10

if loadstring then -- thisis Not Even required lol bc most envs will always check on this majority of them
	
	print("...................................................................")
	warn("loadstring() test has started ⚠")
	print("find the test at https://github.com/speedstarkawaii/loadstring-test 😱")
	wait(0.30)


	print("performing tests...")

	local test1 = loadstring("return 2 + 2") -- should return 4
	if test1() == 4 then
		score = score + 1
		print("test 1 passed [simple addition math] ✅")
	else
		print("test 1 failed ❌")
	end

	local test2 = loadstring("return 'Hello' .. ' World'")
	if test2() == "Hello World" then
		score = score + 1
		print("test 2 passed [returned Hello World] ✅")
	else
		print("test 2 failed ❌")
	end

	local test3 = loadstring("local x = 5; return x")
	if test3() == 5 then
		score = score + 1
		print("test 3 passed [returned var x as 5] ✅")
	else
		print("test 3 failed ❌")
	end

	-- Medium tests
	print("performing medium tests...")

	local test4 = loadstring([[
        local sum = 0
        for i = 1, 10 do
            sum = sum + i
        end
        return sum
    ]])
	if test4() == 55 then
		score = score + 1
		print("test 4 passed ✅")
	else
		print("test 4 failed ❌")
	end

	-- test 6: Syntax error
	local test5 = loadstring([[
    local t = {a = 1, b = 2, c = 3
    return t.a
]])
	local success, result = pcall(test5)
	if not success then
		score = score + 1
		print("test 6 failed due to syntax error [good, your loadstring should do this] ❌")
	else
		print("test 6 passed ✅ [no error checker)")
	end


	local test6 = loadstring([[
        local t = {a = 1, b = 2, c = 3}
        t.d = 4
        return t.d
    ]])
	if test6() == 4 then
		score = score + 1
		print("test 6 passed ✅")
	else
		print("test 6 failed ❌")
	end

	print("performing hard tests...")

	local test7 = loadstring([[
        local function factorial(n)
            if n == 0 then return 1 end
            return n * factorial(n - 1)
        end
        return factorial(5)
    ]])
	if test7() == 120 then
		score = score + 1
		print("test 7 passed ✅")
	else
		print("test 7 failed ❌")
	end

	local test8 = loadstring([[
        local t = {}
        setmetatable(t, {
            __index = function(_, key)
                return key .. ' not found'
            end
        })
        return t.test
    ]])
	if test8() == "test not found" then
		score = score + 1
		print("test 8 passed ✅")
	else
		print("test 8 failed ❌")
	end

	local test9 = loadstring([[
        local co = coroutine.create(function()
            coroutine.yield('Paused')
            return 'Resumed'
        end)
        local _, paused = coroutine.resume(co)
        local _, resumed = coroutine.resume(co)
        return paused, resumed
    ]])
	local paused, resumed = test9()
	if paused == "Paused" and resumed == "Resumed" then
		score = score + 1
		print("test 9 passed ✅")
	else
		print("test 9 failed ❌")
	end

	local test10 = loadstring([[
        local t = {
            numbers = {1, 2, 3},
            letters = {'a', 'b', 'c'}
        }
        table.insert(t.numbers, 4)
        table.insert(t.letters, 'd')
        return t.numbers[4], t.letters[4]
    ]])
	local num, letter = test10()
	if num == 4 and letter == "d" then
		score = score + 1
		print("test 10 passed ✅")
	else
		print("test 10 failed ❌")
	end
	
	local test11 = loadstring([[
        local success, response = pcall(function()
            return game:HttpGet("https://pastebin.com/raw/scZGqHDQ")
        end)
        if success and response then
            return true
        else
            return false
        end
    ]])
    if test11() then
        score = score + 1
        print("test 11 passed ✅")
    else
        print("test 11 failed ❌")
	end
	
	  local test12 = loadstring("return ...", "@chunkname_test")
    if test12() == "@chunkname_test" then
        score = score + 1
        print("test 12 passed ✅")
    else
        print("test 12 failed ❌")
    end

	print("all tests completed successfully ✅")
	print("final score: " .. score .. "/" .. totalTests)
	
	if (score > 6) then
		print"you got 50% of the test."
	else
		print"you got below then a 50%, please consider rewriting your loadstring"
	end
	print("...................................................................")

else
	error("oops the exploit to test loadstring() on is not registered; please register it and try again ❌")
end
