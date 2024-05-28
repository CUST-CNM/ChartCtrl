project "ChartCtrl2Demo"
    kind "WindowsAPP"
    language "C++"
	cppdialect "C++17"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "Src/**.h",
        "Src/**.cpp",
    }

	defines
	{
		"WIN32",
		"_WINDOWS",
		"_USE_MATH_DEFINE",
		"_DEBUGS",
		"_LIB"
	}

	prebuildcommands {".\\verbuild.exe .\\Src\\VersionNo.h 1.2.*.+ -d2000 -xFp -b1.0.0.0 -e10.100.9999.100  -rd -u -t5"}

    filter "system:windows"
        staticruntime "On"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
