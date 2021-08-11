--default windows settings
DefaultToogleState = {
  ["EA_ChatWindowGroup1"] = true, 
  ["EA_TacticsEditorContents"] = true,
  ["ActionBarLockToggler" ] = true,
  ["EA_ActionBar2" ] = true,
  ["EA_ActionBar3"] = true,
  ["EnemyMarksWindow"]  = true,
  ["EnemyStopwatch"]  = true,
  ["RoR_SoR_ButtonBtn"] = true,
  ["WarBoard_GameMenu" ] = true,
  ["WarBoard_TogglerDeathblow2"] = true, 
  ["WarBoard_TogglerEnemy"]  = true,
  ["WarBoard_ClockText"]  = true,
  ["WarBoard_LuaMemory" ] = true,
  ["WarBoard_TogglerQQueuer"] = true,
  ["MoraleWindow3"] = true,
}
if not toggler then toggler= {} end
if not toggler.ToogleState then toggler.ToogleState = DefaultToogleState end
btnState = true;

function toggler.OnInitialize()
    RegisterEventHandler(SystemData.Events.ALL_MODULES_INITIALIZED, "toggler.init")
    CreateWindow("toggler_button", true)
    LayoutEditor.RegisterWindow("toggler_button", L"UltraToggler", L"UltraToggler", false, false, false, nil )
end

function toggler:RegisterSelfEvents()
  RegisterEventHandler( SystemData.Events.ENTER_WORLD, "toggler.init" )
  RegisterEventHandler( SystemData.Events.INTERFACE_RELOADED, "toggler.init" )
  RegisterEventHandler(SystemData.Events.ALL_MODULES_INITIALIZED, "toggler.init")
  RegisterEventHandler(SystemData.Events.SCENARIO_END, "toggler.init")
  RegisterEventHandler(SystemData.Events.SCENARIO_BEGIN, "toggler.init")
  RegisterEventHandler(SystemData.Events.RELOAD_INTERFACE, "toggler.init")
  RegisterEventHandler(SystemData.Events.USER_SETTINGS_CHANGED, "toggler.init")
  RegisterEventHandler(SystemData.Events.KEYBINDINGS_UPDATED, "toggler.init")
end

function toggler.Toggle()
   if (btnState == true) then 
      ButtonSetTexture("toggler_buttonBtn", Button.ButtonState.NORMAL, "off_icon", 0,0); 
      btnState = false;
      for key, val in pairs(toggler.ToogleState) do
        WindowSetShowing(key, true)
      end
    else  
      ButtonSetTexture("toggler_buttonBtn", Button.ButtonState.NORMAL, "on_icon", 0,0); 
      btnState = true;
      toggler.init()
   end
end

function toggler.MainTooltip()
  Tooltips.CreateTextOnlyTooltip(SystemData.MouseOverWindow.name,nil)
  Tooltips.SetTooltipText( 1, 1, L"UltraToggler")
  Tooltips.SetTooltipColorDef( 1, 1, {b=194, g=51, r=255})
  Tooltips.SetTooltipText( 3, 1, L"Ultratooggle<br>For Ultrakill")
  Tooltips.Finalize()    
  Tooltips.AnchorTooltip( Tooltips.ANCHOR_WINDOW_TOP )
  return	
end

function toggler.init()
  for key, val in pairs(toggler.ToogleState) do
    WindowSetShowing(key, val)
  end
end

function toggler.Menu()
  local function MakeCallBack( SelectedOption )
        return function() toggler.ToggleShow(SelectedOption) end
      end
      
      EA_Window_ContextMenu.CreateContextMenu( SystemData.MouseOverWindow.name, EA_Window_ContextMenu.CONTEXT_MENU_1,L"List of Windows")
      EA_Window_ContextMenu.AddMenuDivider( EA_Window_ContextMenu.CONTEXT_MENU_1 )	

      for key, val in pairs(toggler.ToogleState) do 
        if val == true then
          EA_Window_ContextMenu.AddMenuItem( L"<icon00057>  " .. towstring(key) , MakeCallBack(key), false, true )
          else
           EA_Window_ContextMenu.AddMenuItem( L"<icon00058>  " .. towstring(key) , MakeCallBack(key), false, true )
         end
  end
  EA_Window_ContextMenu.Finalize()	
end

function toggler.ToggleShow(SelectedOption) 
  if toggler.ToogleState[SelectedOption] then toggler.ToogleState[SelectedOption] = false else toggler.ToogleState[SelectedOption] = true end
  toggler.init()
  return
end