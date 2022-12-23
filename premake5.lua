include "../../premake/common_premake_defines.lua"

project "RectangleBinPack"
	kind "StaticLib"
	language "C++"
	cppdialect "C++latest"
	cdialect "C17"
	targetname "%{prj.name}"
	inlining "Auto"

	includedirs {
		"%{IncludeDir.rectangle_bin_pack}"
	}

	files {
		"./*.h",
		"./*.cpp"
	}

	excludes {
		"./boost_binpacker.cpp"
	}

	filter "toolset:msc"
		disablewarnings { "4267" }