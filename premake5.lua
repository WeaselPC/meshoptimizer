project "meshoptimizer"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("bin/%{cfg.buildcfg}")
    objdir    ("bin-int/%{cfg.buildcfg}")

    -- meshoptimizer lives in src/, with meshoptimizer.h + a bunch of .cpp files
    files {
        "src/**.h",
        "src/**.hpp",
        "src/**.inl",
        "src/**.cpp"
    }

    includedirs {
        "src"
    }

    filter "system:windows"
        systemversion "latest" -- safe default on Windows

    filter "configurations:Debug"
        defines { "_DEBUG", "MESHOPTIMIZER_DEBUG" }
        runtime "Debug"
        symbols "On"
        optimize "Off"

    filter "configurations:Release"
        defines { "NDEBUG" }
        runtime "Release"
        symbols "Off"
        optimize "Full"