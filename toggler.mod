<?xml version="1.0" encoding="UTF-8"?>
<ModuleFile xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<UiMod name="Toggler" version="0.0.1" date="18/07/2021" >
		<VersionSettings gameVersion="1.4.8" windowsVersion="1.0" />
		<Author name="Ultrakill"/>
		<Description text="Let you hide chat and other stuff" />
		 <Dependencies>                
            <Dependency name="EATemplate_DefaultWindowSkin" />
            <Dependency name="EASystem_Utils" />
            <Dependency name="EASystem_WindowUtils" />
            <Dependency name="EASystem_Tooltips" />
            <Dependency name="EA_ChatWindow" />
            <Dependency name="EATemplate_ParchmentWindowSkin" />			
          <Dependency name="EA_SiegeWeaponWindow" />
		  <Dependency name="LibSlash" optional="true"/>		  
        </Dependencies>	
		<Files>
			<File name="toggler.lua" />		
 			<File name="toggler.xml" />
		</Files>
		<OnInitialize>
			<CallFunction name="toggler.OnInitialize" /> 	
		</OnInitialize>
		<SavedVariables>
			<SavedVariable name="toggler.ToogleState" global="false"/>
		</SavedVariables>
	</UiMod>
</ModuleFile>