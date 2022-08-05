local home = os.getenv('HOME')
local db = require("dashboard")
local logo = [[
                               _                         
                           ,--.\`-. __                   
                         _,.`. \:/,"  `-._               
                     ,-*" _,.-;-*`-.+"*._ )              
                    ( ,."* ,-" / `.  \.  `.              
                   ,"   ,;"  ,"\../\  \:   \             
                  (   ,"/   / \.,' :   ))  /             
                   \  |/   / \.,'  /  // ,'              
                    \_)\ ,' \.,'  (  / )/                
                        `  \._,'   `"                    
                           \../                          
                           \../                          
                 ~        ~\../           ~~             
          ~~          ~~   \../   ~~   ~      ~~         
     ~~    ~   ~~  __...---\../-...__ ~~~     ~~         
       ~~~~  ~_,--'        \../      `--.__ ~~    ~~     
   ~~~  __,--'              `"             `--.__   ~~~  
~~  ,--'                                         `--.    
   '------......______             ______......------` ~~
 ~~~   ~    ~~      ~ `````---"""""  ~~   ~     ~~       
        ~~~~    ~~  ~~~~       ~~~~~~  ~ ~~   ~~ ~~~  ~  
     ~~   ~   ~~~     ~~~ ~         ~~       ~~       
              ~        ~~       ~~~       ~              
]]

local lines = {}
for line in logo:gmatch("[^\n]+") do
  table.insert(lines, line)
end

db.custom_header = lines
vim.g.dashboard_custom_header = lines

db.custom_center = {
    { desc = '- find file', action = 'Telescope find_files' },
    { desc ='- live grep', action =  'Telescope live_grep' },
    { desc ='   - recent files', action =  'Telescope oldfiles' },
}
