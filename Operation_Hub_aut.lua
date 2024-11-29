local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/SaveManager.luau"))()
local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/InterfaceManager.luau"))()

local ScriptVersion = "v0.1"

local function getMoscowTime()
  -- Получаем текущее время в секундах с начала эпохи (1 января 1970 года)
  local currentTimeSeconds = os.time()

  -- Получаем таблицу с часовыми данными
  local timeTable = os.date("*t", currentTimeSeconds)


  -- корректировка на МСК (UTC+3) (если ваше системное время уже МСК, то это не нужно)
  timeTable.hour = timeTable.hour + 3
  if timeTable.hour >= 24 then
      timeTable.hour = timeTable.hour - 24
      timeTable.day = timeTable.day + 1
  end

  -- Форматирование времени в формате ЧЧ:ММ:СС
  local formattedTime = string.format("%02d:%02d:%02d", timeTable.hour, timeTable.min, timeTable.sec)
  return formattedTime
end

-- Пример использования:
local currentTime = getMoscowTime()

-- Для вызова через {time} вам нужно интегрировать это в вашу систему, например:
-- Предположим, у вас есть функция, которая обрабатывает строку с {time}:

local Window = Library:CreateWindow{
    Title = `Operation Hub `,
    SubTitle = "A Universal Time • ".. currentTime,
    TabWidth = 160,
    Size = UDim2.fromOffset(830, 525),
    Resize = true, -- Resize this ^ Size according to a 1920x1080 screen, good for mobile users but may look weird on some devices
    MinSize = Vector2.new(470, 380),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Vynixu",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
}

-- Fluent Renewed provides ALL 1470 Lucide 0.395.0 Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    General = Window:CreateTab{
        Title = "General",
        Icon = "book-marked"
    },
    Sa = Window:CreateTab{
        Title = "Smart Assistant",
        Icon = "atom"
    },
    Settings = Window:CreateTab{
        Title = "Settings",
        Icon = "settings"
    }
}

local Options = Library.Options

Tabs.General:CreateParagraph("Why soon?", {
    Title = "Почему не доступен",
    Content = "Вкладка “General” в настоящее время находится на стадии активной разработки и недоступна для пользователей. Её функциональность ещё не завершена и проходит внутреннее тестирование. Мы сообщим о её запуске дополнительно.",
    TitleAlignment = "Middle",
    ContentAlignment = Enum.TextXAlignment.Center
})




Tabs.Sa:CreateButton{
    Title = "Открыть “Black Market”",
    Description = "Открыть меню черного дилера",
    Callback = function()
        game.Players.LocalPlayer.PlayerGui.UI.Menus.Visible = true
        game.Players.LocalPlayer.PlayerGui.UI.Menus["Black Market"].Visible = true
    end
}

Tabs.Sa:CreateButton{
    Title = "Открыть “The Master Crafter”",
    Description = "Открыть меню крафтера",
    Callback = function()
        
    end
}

Tabs.Sa:CreateButton{
    Title = "Открыть “The Adventure”",
    Description = "Открыть меню путешественика",
    Callback = function()
        
    end
}

Tabs.Sa:CreateParagraph("The Slayer Master", {
    Title = "The Slayer Master",
    Content = "Нет описании...",
    TitleAlignment = "Middle",
    ContentAlignment = Enum.TextXAlignment.Center
})

Tabs.Sa:CreateButton{
    Title = "Контракт “The Boss”",
    Description = "Нужен 60+ LVL ",
    Callback = function()
        
    end
}

Tabs.Sa:CreateButton{
    Title = "Контракт “The Oni”",
    Description = "Нужен 90+ LVL ",
    Callback = function()
        
    end
}

Tabs.Sa:CreateButton{
    Title = "Контракт “The Knight”",
    Description = "Нужен 120+ LVL ",
    Callback = function()
        
    end
}

Tabs.Sa:CreateButton{
    Title = "Контракт “The Bearer”",
    Description = "Нужен 150+ LVL ",
    Callback = function()
        
    end
}

Tabs.Sa:CreateButton{
    Title = "Контракт “The Honored One”",
    Description = "Нужен 180+ LVL ",
    Callback = function()
        
    end
}




-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Library)
InterfaceManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes{}

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("OperationHub")
SaveManager:SetFolder("OperationHub/aut")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Library:Notify{
    Title = "Добро пожаловать.",
    Content = "Выбрана игра: A Universal Time",
    SubContent = "Отличный выбор. Удачной игры.", -- Optional
    Duration = 5 -- Set to nil to make the notification not disappear
}



print(" ")
print("░█████╗░██████╗░███████╗██████╗░░█████╗░████████╗██╗░█████╗░███╗░░██╗ ")
print("██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║ ")
print("██║░░██║██████╔╝█████╗░░██████╔╝███████║░░░██║░░░██║██║░░██║██╔██╗██║ ")
print("██║░░██║██╔═══╝░██╔══╝░░██╔══██╗██╔══██║░░░██║░░░██║██║░░██║██║╚████║ ")
print("╚█████╔╝██║░░░░░███████╗██║░░██║██║░░██║░░░██║░░░██║╚█████╔╝██║░╚███║ ")
print("░╚════╝░╚═╝░░░░░╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝ ")
print("Made by Vu4eke | Game: A Universal Time | Version:", ScriptVersion)


-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
