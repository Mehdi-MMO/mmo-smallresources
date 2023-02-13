local Version = GetResourceMetadata(GetCurrentResourceName(), "version", 0)
local Repository = 'https://raw.githubusercontent.com/Mehdi-MMO/mmo-smallresources/main/version.txt'

AddEventHandler('onResourceStart', function(ResourceName)
    if ResourceName == GetCurrentResourceName() then
        PerformHttpRequest(Repository, function(Error, NewestVersion, Header)
            if Error == 200 then

                NewestVersion = string.gsub(NewestVersion, '\n', '')

                if NewestVersion ~= Version then
                    print(
                        "\n\n^1[WARNING]^3 The script is outdated. Please download the latest version from the Mehdi MMO's GitHub")
                    print(
                        "                  ^2Github Link: ^9https://github.com/Mehdi-MMO/mmo-smallresources/releases \n\n")
                end
            else
                print("\n\n^1[ERROR]^3 Failed to check for updates.\n")
            end
        end)
    end
end)
