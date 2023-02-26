local function trim(s)
    return s:match('^%s*(.*%S)') or ''
end

local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
local repositoryUrl = 'https://raw.githubusercontent.com/Mehdi-MMO/mmo-smallresources/main/version.txt'

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        PerformHttpRequest(repositoryUrl, function(errorCode, newestVersion, headers)
            if errorCode == 200 then
                newestVersion = trim(newestVersion)
                currentVersion = trim(currentVersion)

                if newestVersion ~= currentVersion then
                    print(string.format(
                        '\n\n^1[WARNING]^3 The script is outdated v(%s). Please download the latest version v(%s) from Mehdi MMO\'s GitHub repository: ^9%s/releases\n\n',
                        currentVersion, newestVersion, 'https://github.com/Mehdi-MMO/mmo-smallresources'))
                end
            else
                print('\n\n^1[ERROR]^3 Failed to check for updates.\n')
            end
        end)
    end
end)
