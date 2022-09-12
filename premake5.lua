project "HLSLcc"
	kind "StaticLib"
	language "C++"
	if(staticRuntime) then
		staticruntime "on"
	end

	targetdir ("bin/" .. outputdir .."")
	objdir ("bin-int/" .. outputdir .."")

	files
	{
		"include/**.h",
		"src/**.cpp",
		"src/**.c",
		"src/**.h"
	}

	
	includedirs {
		"%{prj.location}",
		"include",
		"src",
		"src/cbstring",
		"src/internal_includes"
	}

	defines {
		--"HLSLCC_DYNLIB",
		"_CRT_SECURE_NO_WARNINGS"
	}

	filter "system:linux"
		pic "On"
		systemversion "latest"

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"

