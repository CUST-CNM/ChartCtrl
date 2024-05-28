project "ChartCtrl2Demo"
    kind "WindowedApp"
    language "C++"
	cppdialect "C++17"

    targetdir ("../bin/" .. outputdir .. "/%{prj.name}")
    objdir ("../bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "stdafx.h"
    pchsource "%{prj.location}/Src/stdafx.cpp"

	includedirs
	{
		"Src"
	}

	flags
	{
		"MFC"
	}

    files
    {
		"res/**.ico",
		"res/**.rc2",
        "Src/**.h",
        "Src/**.cpp",
        "Src/**.rc",
    }

	defines
	{
		"WIN32",
		"_WINDOWS",
		"_USE_MATH_DEFINES",
		"_LIB"
	}

	includedirs
	{
        "%{wks.location}/NMROSApp/vendor/ChartCtrl2/ChartCtrllib/src",
	}

	links
	{
		"LibChartCtrl2"
	}

    filter "system:windows"
        staticruntime "On"

    filter "configurations:Debug"
		defines "_DEBUGS"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
