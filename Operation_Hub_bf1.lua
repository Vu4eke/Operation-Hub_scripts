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
    SubTitle = "Blox Fruit • ".. currentTime,
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
    Main = Window:CreateTab{
        Title = "General",
        Icon = "circle-user-round"
    },
    Farming = Window:CreateTab{
        Title = "Farming",
        Icon = "biohazard"
    },
    Raids = Window:CreateTab{
        Title = "Raids",
        Icon = "swords"
    },
    Shop = Window:CreateTab{
        Title = "Shop",
        Icon = "store"
    },
    Fruits = Window:CreateTab{
        Title = "Fruits",
        Icon = "cherry"
    },
    Race = Window:CreateTab{
        Title = "Race v3/v4",
        Icon = "person-standing"
    },
    Esp = Window:CreateTab{
        Title = "ESP",
        Icon = "scan"
    },
    AI = Window:CreateTab{
        Title = "AI",
        Icon = "bot"
    },
    Misc = Window:CreateTab{
        Title = "Misc",
        Icon = "blocks"
    },
    Settings = Window:CreateTab{
        Title = "Settings",
        Icon = "settings"
    }
}

local Options = Library.Options

Tabs.AI:CreateParagraph("Why soon?", {
    Title = "Почему не доступен",
    Content = "Вкладка “ИИ” в настоящее время находится на стадии активной разработки и недоступна для пользователей. Её функциональность ещё не завершена и проходит внутреннее тестирование. Мы сообщим о её запуске дополнительно.",
    TitleAlignment = "Middle",
    ContentAlignment = Enum.TextXAlignment.Center
})

Tabs.Shop:CreateParagraph("Fighting Styles", {
    Title = "Fighting Styles",
    Content = "Боевые стили — базовый тип оружия в Blox Fruits для ближнего боя с тремя приёмами, сочетающие универсальность и умеренный урон.",
    TitleAlignment = "Middle",
    ContentAlignment = Enum.TextXAlignment.Center
})


Tabs.Shop:CreateButton{
    Title = "Dark Step",
    Description = "150,000$",
    Callback = function()
        Window:Dialog{
            Title = "Dark Step",
            Content = "Уверены? После покупки боевой стиль будет применён.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
                        Library:Notify{
                            Title = "Shop | Fighting Styles",
                            Content = "Вы купили Dark Step.",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Electric",
    Description = "500,000$",
    Callback = function()
        Window:Dialog{
            Title = "Electric",
            Content = "Уверены? После покупки боевой стиль будет применён.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                        Library:Notify{
                            Title = "Shop | Fighting Styles",
                            Content = "Вы купили Electric.",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Water Kung Fu",
    Description = "750,000$",
    Callback = function()
        Window:Dialog{
            Title = "Water Kung Fu",
            Content = "Уверены? После покупки боевой стиль будет применён.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                        Library:Notify{
                            Title = "Shop | Fighting Styles",
                            Content = "Вы купили Water Kung Fu.",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Dragon Breath",
    Description = "1,500F",
    Callback = function()
        Window:Dialog{
            Title = "Dragon Breath",
            Content = "Уверены? После покупки боевой стиль будет применён.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2")
                        Library:Notify{
                            Title = "Shop | Fighting Styles",
                            Content = "Вы купили Dragon Breath.",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Superhuman",
    Description = "3,000,000$",
    Callback = function()
        Window:Dialog{
            Title = "Superhuman",
            Content = "Уверены? После покупки боевой стиль будет применён.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                        Library:Notify{
                            Title = "Shop | Fighting Styles",
                            Content = "Вы купили SuperHuman.",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Death Step",
    Description = "2,500,000$ 5,000F",
    Callback = function()
        Window:Dialog{
            Title = "Death Step",
            Content = "Уверены? После покупки боевой стиль будет применён.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                         game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
                         Library:Notify{
                            Title = "Shop | Fighting Styles",
                            Content = "Вы купили Death Step.",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Sharkman Karate",
    Description = "2,500,000$ 5,000F",
    Callback = function()
        Window:Dialog{
            Title = "Sharkman Karate",
            Content = "Уверены? После покупки боевой стиль будет применён.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
                        Library:Notify{
                            Title = "Shop | Fighting Styles",
                            Content = "Вы купили Sharkman Karate.",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Electric Claw",
    Description = "3,000,000$ 5,000F",
    Callback = function()
        Window:Dialog{
            Title = "Electric Claw",
            Content = "Уверены? После покупки боевой стиль будет применён.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
                        Library:Notify{
                            Title = "Shop | Fighting Styles",
                            Content = "Вы купили Electric Claw.",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Dragon Talon",
    Description = "3,000,000$ 5,000F",
    Callback = function()
        Window:Dialog{
            Title = "Dragon Talon",
            Content = "Уверены? После покупки боевой стиль будет применён.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
                        Library:Notify{
                            Title = "Shop | Fighting Styles",
                            Content = "Вы купили Dragon Talon.",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "GodHuman",
    Description = "5,000,000$ 5,000F | 10 Dragon Scale, 20 Fish Tail, 10 Mystic Droplet, 20 Magma Ore.",
    Callback = function()
        Window:Dialog{
            Title = "GodHuman",
            Content = "Уверены? После покупки боевой стиль будет применён.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")

                        Library:Notify{
                            Title = "Shop | Fighting Styles",
                            Content = "Вы купили GodHuman.",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Sanguine Art",
    Description = "5,000,000$ 5,000F | 2 Dark Fragments, 20 Demonic Wisps, 20 Vampire Fangs.",
    Callback = function()
        Window:Dialog{
            Title = "Sanguine Art",
            Content = "Уверены? После покупки боевой стиль будет применён.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")

                        Library:Notify{
                            Title = "Shop | Fighting Styles",
                            Content = "Вы купили Sanguine Art.",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateParagraph("Accessory", {
    Title = "Accessory",
    Content = "Нет описании...",
    TitleAlignment = "Middle",
    ContentAlignment = Enum.TextXAlignment.Center
})

Tabs.Shop:CreateButton{
    Title = "Tomoe Ring",
    Description = "500,000$",
    Callback = function()
        Window:Dialog{
            Title = "Tomoe Ring",
            Content = "Уверены? После покупки бели снимутся.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Tomoe Ring")

                        Library:Notify{
                            Title = "Shop | Accessory",
                            Content = "Вы купили Tomoe Ring",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog. (Tomoe Ring)")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Black Cape",
    Description = "50.000$",
    Callback = function()
        Window:Dialog{
            Title = "Black Cape",
            Content = "Уверены? После покупки бели снимутся.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Black Cape")

                        Library:Notify{
                            Title = "Shop | Accessory",
                            Content = "Вы купили Black Cape",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog. (Tomoe Ring)")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Swordsman Hat",
    Description = "150.000$",
    Callback = function()
        Window:Dialog{
            Title = "Swordsman Hat",
            Content = "Уверены? После покупки бели снимутся.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Swordsman Hat")

                        Library:Notify{
                            Title = "Shop | Accessory",
                            Content = "Вы купили Swordsman Hat",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog. (Tomoe Ring)")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateParagraph("Swords", {
    Title = "Swords",
    Content = "Нет описании...",
    TitleAlignment = "Middle",
    ContentAlignment = Enum.TextXAlignment.Center
})

Tabs.Shop:CreateButton{
    Title = "Cutlass",
    Description = "1.000$",
    Callback = function()
        Window:Dialog{
            Title = "Cutlass",
            Content = "Уверены? После покупки бели снимутся.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Cutlass")

                        Library:Notify{
                            Title = "Shop | Swords",
                            Content = "Вы купили Cutlass",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog. (Tomoe Ring)")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Katana",
    Description = "1.000$",
    Callback = function()
        Window:Dialog{
            Title = "Katana",
            Content = "Уверены? После покупки бели снимутся.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Katana")

                        Library:Notify{
                            Title = "Shop | Swords",
                            Content = "Вы купили Katana",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog. (Tomoe Ring)")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Dual Katana",
    Description = "12.000$",
    Callback = function()
        Window:Dialog{
            Title = "Dual Katana",
            Content = "Уверены? После покупки бели снимутся.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Duel Katana")

                        Library:Notify{
                            Title = "Shop | Swords",
                            Content = "Вы купили Dual Katana",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog. (Tomoe Ring)")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Triple Katana",
    Description = "60.000$",
    Callback = function()
        Window:Dialog{
            Title = "Triple Katana",
            Content = "Уверены? После покупки бели снимутся.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Triple Katana")

                        Library:Notify{
                            Title = "Shop | Swords",
                            Content = "Вы купили Triple Katana",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog. (Tomoe Ring)")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Iron Mace",
    Description = "25.000$",
    Callback = function()
        Window:Dialog{
            Title = "Iron Mace",
            Content = "Уверены? После покупки бели снимутся.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Iron Mace")

                        Library:Notify{
                            Title = "Shop | Swords",
                            Content = "Вы купили Iron Mace",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog. (Tomoe Ring)")
                    end
                }
            }
        }
    end
}



Tabs.Shop:CreateButton{
    Title = "Pipe",
    Description = "100.000$",
    Callback = function()
        Window:Dialog{
            Title = "Pipe",
            Content = "Уверены? После покупки бели снимутся.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Pipe")

                        Library:Notify{
                            Title = "Shop | Pipe",
                            Content = "Вы купили Swordsman Hat",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog. (Tomoe Ring)")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Dual-Headed Blade",
    Description = "400.000$",
    Callback = function()
        Window:Dialog{
            Title = "Dual-Headed Blade",
            Content = "Уверены? После покупки бели снимутся.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Dual-Headed Blade")

                        Library:Notify{
                            Title = "Shop | Swords",
                            Content = "Вы купили Dual-Headed Blade",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog. (Tomoe Ring)")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Soul Cane",
    Description = "750.000$",
    Callback = function()
        Window:Dialog{
            Title = "Soul Cane",
            Content = "Уверены? После покупки бели снимутся.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Soul Cane")

                        Library:Notify{
                            Title = "Shop | Swords",
                            Content = "Вы купили Soul Cane",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog. (Tomoe Ring)")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Bisento",
    Description = "1.000.000$",
    Callback = function()
        Window:Dialog{
            Title = "Bisento",
            Content = "Уверены? После покупки бели снимутся.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem","Bisento")

                        Library:Notify{
                            Title = "Shop | Swords",
                            Content = "Вы купили Bisento",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog. (Tomoe Ring)")
                    end
                }
            }
        }
    end
}


Tabs.Shop:CreateParagraph("Race", {
    Title = "Расы",
    Content = "Нет описании...",
    TitleAlignment = "Middle",
    ContentAlignment = Enum.TextXAlignment.Center
})





Tabs.Shop:CreateButton{
    Title = "Ghoul Race",
    Description = "Меняет рассу на гуля.",
    Callback = function()
        Window:Dialog{
            Title = "Ghoul Race",
            Content = "Уверены? Ваша расса сменится.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        FireRemote("Ectoplasm", "Change", 4)

                        Library:Notify{
                            Title = "Shop | Рассы",
                            Content = "Вы теперь гуль.",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog. (Tomoe Ring)")
                    end
                }
            }
        }
    end
}

Tabs.Shop:CreateButton{
    Title = "Cyborg Race",
    Description = "Меняет рассу на киборга (ВАЖНО: Надо 2.500F).",
    Callback = function()
        Window:Dialog{
            Title = "Cyborg Race",
            Content = "Уверены? Ваша расса сменится.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        FireRemote("CyborgTrainer", "Buy")

                        Library:Notify{
                            Title = "Shop | Рассы",
                            Content = "Вы теперь киборг.",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog. (Tomoe Ring)")
                    end
                }
            }
        }
    end
}


Tabs.Misc:CreateParagraph("Персонаж", {
    Title = "Персонаж",
    Content = "Нет описании...",
    TitleAlignment = "Middle",
    ContentAlignment = Enum.TextXAlignment.Center
})

local Toggle = Tabs.Misc:CreateToggle("AntiAFK", {Title = "Anti-AFK", Default = true })

Toggle:OnChanged(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new(math.huge, math.huge))task.wait(600)
end)

local Toggle = Tabs.Misc:CreateToggle("WalkOnWater", {Title = "Ходьба по воде", Default = false })

Toggle:OnChanged(function()
    local Map = workspace:WaitForChild("Map", 9e9)
    
    while getgenv().WalkOnWater do task.wait(0.1)
      Map:WaitForChild("WaterBase-Plane", 9e9).Size = Vector3.new(1000, 113, 1000)
    end
    Map:WaitForChild("WaterBase-Plane", 9e9).Size = Vector3.new(1000, 80, 1000)
  end)

local Slider = Tabs.Misc:CreateSlider("Fast_Run", {
    Title = "Быстрый бег",
    Description = "Изменяет скорость персонажа.",
    Default = 2,
    Min = 0,
    Max = 5,
    Rounding = 1,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

Slider:OnChanged(function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

Slider:SetValue(3)


Tabs.Misc:CreateParagraph("Team", {
    Title = "Команда",
    Content = "Нет описании...",
    TitleAlignment = "Middle",
    ContentAlignment = Enum.TextXAlignment.Center
})

Tabs.Misc:CreateButton{
    Title = "Marine",
    Description = "Меняет команду на маринов.",
    Callback = function()
        Window:Dialog{
            Title = "Поменять команду",
            Content = "Уверены? После подтверждение вы перейдете в команду маринов.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        local args = {
			                [1] = "SetTeam",
			                [2] = "Marines"
		                }
		                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		                    local args = {
			                      [1] = "BartiloQuestProgress"
		                         }
		                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        Library:Notify{
                            Title = "Misc | Команда",
                            Content = "Вы перешли за маринов.",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog. (Tomoe Ring)")
                    end
                }
            }
        }
    end
}

Tabs.Misc:CreateButton{
    Title = "Pirate",
    Description = "Меняет команду на пиратов.",
    Callback = function()
        Window:Dialog{
            Title = "Поменять команду",
            Content = "Уверены? После подтверждение вы перейдете в команду пиратов.",
            Buttons = {
                {
                    Title = "Да",
                    Callback = function()
                        local args = {
			                [1] = "SetTeam",
			                [2] = "Pirates"
		                }
		                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		                    local args = {
			                      [1] = "BartiloQuestProgress"
		                         }
		                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

                        Library:Notify{
                            Title = "Misc | Команда",
                            Content = "Вы перешли за пиратов.",
                            Duration = 5 -- Set to nil to make the notification not disappear
                        }
                    end
                },
                {
                    Title = "Нет",
                    Callback = function()
                        print("Cancelled the dialog. (Tomoe Ring)")
                    end
                }
            }
        }
    end
}

Tabs.Misc:CreateParagraph("Menus", {
    Title = "Меню",
    Content = "Нет описании...",
    TitleAlignment = "Middle",
    ContentAlignment = Enum.TextXAlignment.Center
})

Tabs.Misc:CreateButton{
    Title = "Inventory",
    Description = "Открывает инвентарь",
    Callback = function()
        Library:Notify{
             Title = "Misc | Инвентарь",
            Content = "В настоящие время не доступен.",
            Duration = 5 -- Set to nil to make the notification not disappear
            }
    end
}

Tabs.Misc:CreateButton{
    Title = "Normal Fruit Shop",
    Description = "Открывает меню Devil Fruit Shop",
    Callback = function()
        local args = {
			[1] = "GetFruits"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		game.Players.localPlayer.PlayerGui.Main.FruitShop.Visible = true
    end
}

Tabs.Misc:CreateButton{
    Title = "Mirage Fruit Shop",
    Description = "Открывает меню Mirage Fruit Shop",
    Callback = function()
        local function StartDialog(DialogName)
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local DialogueController = require(ReplicatedStorage.DialogueController)
        local DialoguesList = require(ReplicatedStorage.DialoguesList)
  
        for Index,Dialog in pairs(DialoguesList) do
        if tostring(Index) == DialogName then
        DialogueController.Start(DialogueController, Dialog)
    end
  end
end

StartDialog("FruitShop2")
    end
}

Tabs.Misc:CreateButton{
    Title = "Titles",
    Description = "Открывает меню Titles",
    Callback = function()
        local args = {
			[1] = "getTitles"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
    end
}


Tabs.Misc:CreateButton{
    Title = "Color Haki",
    Description = "Открывает меню Color Haki",
    Callback = function()
        game.Players.localPlayer.PlayerGui.Main.Colors.Visible = true
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
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Library:Notify{
    Title = "Добро пожаловать.",
    Content = "Выбрана игра: Blox Fruit",
    SubContent = "Отличный выбор. Удачной игры.", -- Optional
    Duration = 5 -- Set to nil to make the notification not disappear
}

local NotifiFruits = false
local NotifiTime = 15

workspace.ChildAdded:Connect(function(part)
  if NotifiFruits then
    if part:IsA("Tool") or string.find(part.Name, "Fruit") then
      Library:Notify{
          Title = "Fruit Notifier",
          Content = "Заспавнился фрукт!",
          SubContent = "Фрукт: '" .. part.Name .. "' удачного поиска.", -- Optional
          Duration = 5 -- Set to nil to make the notification not disappear
      }
    end
  end
end)


print(" ")
print("░█████╗░██████╗░███████╗██████╗░░█████╗░████████╗██╗░█████╗░███╗░░██╗ ")
print("██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║ ")
print("██║░░██║██████╔╝█████╗░░██████╔╝███████║░░░██║░░░██║██║░░██║██╔██╗██║ ")
print("██║░░██║██╔═══╝░██╔══╝░░██╔══██╗██╔══██║░░░██║░░░██║██║░░██║██║╚████║ ")
print("╚█████╔╝██║░░░░░███████╗██║░░██║██║░░██║░░░██║░░░██║╚█████╔╝██║░╚███║ ")
print("░╚════╝░╚═╝░░░░░╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝ ")
print("Made by Vu4eke | Game: Blox Fruit | Version:", ScriptVersion)


-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
