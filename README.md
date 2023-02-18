# ltraceback

```lua
local tb = require "traceback.c"
local max_depth= 10
local max_ele = 10
local max_string = 100
local max_len = 1000
local levels1 = 10
local levels2 = 11
debug.traceback = tb.get_traceback(max_depth, max_ele, max_string, max_len, levels1, levels2)
```

The traceback will dump function params and upvalues.

```txt
test.lua:54: attempt to perform arithmetic on a table value (local 'x')
stack traceback:
        test.lua:54: in upvalue 'f'
                <arg 1> a = {['fuck']="0xabcdef",['b']={[1]="x",[2]="y",['xx']={[1]=2,[2]=2.22}}}
                        a['b']['xx']['zz'] = a['b']['xx']
                        a['b']['xx']['yy'] = a['b']
                        a['c'] = a['b']['xx']
                <arg 2> b = "xs"
                <arg 3> c = 1.22
                <arg 4> d = 100
                <arg 5> e = 1
                <upvalue 1> _ENV = {['rawequal']=function: 0x5568c9715580,['debug']={['getuservalue']=function: 0x5568c9716e50,['debug']=function: 0x5568c9716ed0,['getmetatable']=function: 0x5568c9716e10,['getinfo']=function: 0x5568c9717940,['gethook']=function: 0x5568c97171f0,['getregistry']=function: 0x5568c9716af0,['setcstacklimit']=function: 0x5568c9716ac0,['upvaluejoin']=function: 0x5568c9716d30...},['pcall']=function: 0x5568c97162a0,['table']={['insert']=function: 0x5568c9721020,['sort']=function: 0x5568c9720d20,['concat']=function: 0x5568c9720ef0,['unpack']=function: 0x5568c9720550,['remove']=function: 0x5568c9720de0...},['print']=function: 0x5568c9715670,['arg']={[-1]="lua",[0]="test.lua"},['pairs']=function: 0x5568c9715aa0,['string']={['byte']=f...
        test.lua:61: in function <test.lua:58>
                <arg 1> a = {['fuck']="0xabcdef",['b']={[1]="x",[2]="y",['xx']={[1]=2,[2]=2.22}}}
                        a['b']['xx']['zz'] = a['b']['xx']
                        a['b']['xx']['yy'] = a['b']
                        a['c'] = a['b']['xx']
                <arg 2> b = "xs"
                <arg 3> c = 1.22
                <arg 4> d = 100
                <arg 5> e = 1
                <upvalue 1> _ENV = {['rawequal']=function: 0x5568c9715580,['debug']={['getuservalue']=function: 0x5568c9716e50,['debug']=function: 0x5568c9716ed0,['getmetatable']=function: 0x5568c9716e10,['getinfo']=function: 0x5568c9717940,['gethook']=function: 0x5568c97171f0,['getregistry']=function: 0x5568c9716af0,['setcstacklimit']=function: 0x5568c9716ac0,['upvaluejoin']=function: 0x5568c9716d30...},['pcall']=function: 0x5568c97162a0,['table']={['insert']=function: 0x5568c9721020,['sort']=function: 0x5568c9720d20,['concat']=function: 0x5568c9720ef0,['unpack']=function: 0x5568c9720550,['remove']=function: 0x5568c9720de0...},['print']=function: 0x5568c9715670,['arg']={[-1]="lua",[0]="test.lua"},['pairs']=function: 0x5568c9715aa0,['string']={['byte']=f...
        [C]: in function 'xpcall'
        test.lua:80: in main chunk
                <upvalue 1> _ENV = {['rawequal']=function: 0x5568c9715580,['debug']={['getuservalue']=function: 0x5568c9716e50,['debug']=function: 0x5568c9716ed0,['getmetatable']=function: 0x5568c9716e10,['getinfo']=function: 0x5568c9717940,['gethook']=function: 0x5568c97171f0,['getregistry']=function: 0x5568c9716af0,['setcstacklimit']=function: 0x5568c9716ac0,['upvaluejoin']=function: 0x5568c9716d30...},['pcall']=function: 0x5568c97162a0,['table']={['insert']=function: 0x5568c9721020,['sort']=function: 0x5568c9720d20,['concat']=function: 0x5568c9720ef0,['unpack']=function: 0x5568c9720550,['remove']=function: 0x5568c9720de0...},['print']=function: 0x5568c9715670,['arg']={[-1]="lua",[0]="test.lua"},['pairs']=function: 0x5568c9715aa0,['string']={['byte']=function: 0x5568c971dca0...},['require']=function: 0x5568cb33e690...}
                        _ENV['_G'] = _ENV
        [C]: in ?
```
