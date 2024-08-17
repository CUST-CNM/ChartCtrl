project "libChartCtrl2"
    kind "StaticLib"
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

	characterset  "Unicode"

    files
    {
        "Src/**.h",
        "Src/**.cpp",
    }

	defines
	{
		"WIN32",
		"_WINDOWS",
		"_USE_MATH_DEFINES",
		"_LIB"
	}

	prebuildcommands {".\\verbuild.exe .\\Src\\VersionNo.h 1.2.*.+ -d2000 -xFp -b1.0.0.0 -e10.100.9999.100  -rd -u -t5"}

    filter "system:windows"
        staticruntime "On"

    filter "configurations:Debug"
		defines "_DEBUGS"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
