project "libChartCtrl2"
    kind "StaticLib"
		cppdialect "C++17"
    language "C++"

    targetdir ("../bin/" .. outputdir .. "/%{prj.name}")
    objdir ("../bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "stdafx.h"
    pchsource "src/stdafx.cpp"

		characterset  "Unicode"

    files
    {
        "src/**.h",
        "src/**.cpp",
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
        systemversion "latest"

    filter "configurations:Debug"
			defines {"_DEBUGS", "_AFXDLL"}
      runtime "Debug"
      symbols "on"
			staticruntime "off"

    filter "configurations:Release"
      runtime "Release"
      optimize "on"
			staticruntime "On"
