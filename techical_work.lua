local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
 
local Window = Library:CreateWindow{
    Title = `Operation Hub `,
    SubTitle = "Технические работы • ".. currentTime,
    TabWidth = 160,
    Size = UDim2.fromOffset(830, 525),
    Resize = true, -- Resize this ^ Size according to a 1920x1080 screen, good for mobile users but may look weird on some devices
    MinSize = Vector2.new(470, 380),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Vynixu",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
}

Library:Notify{
    Title = "Технические работы.",
    Content = "В настоящие время идут тех.работы в скрипте.",
    SubContent = "В ближащие время, работа воозобновится.", -- Optional
    Duration = 15
}
