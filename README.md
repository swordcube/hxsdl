<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Simple_DirectMedia_Layer%2C_Logo.svg/1200px-Simple_DirectMedia_Layer%2C_Logo.svg.png" alt="Simple DirectMedia Layer Logo" align="right" width="150" height="80" />

# hxsdl

Haxe/hxcpp @:native bindings for [SDL 2.28.3](https://github.com/libsdl-org/SDL).

---

This library only works with the Haxe `cpp` target via `hxcpp`.

Keep in mind that not everything in SDL will be included nor will they all work!
If you notice something is broken or is missing, make an issue/pull request.

---

## 📩 Installation

Install through the haxelib

```
haxelib install hxsdl
```

or with git for the latest potentially unstable updates.

```
haxelib git hxsdl https://github.com/swordcube/hxsdl.git
```

### 🖥 Usage Example
Check out the [examples folder](https://github.com/swordcube/hxsdl/tree/main/examples) for examples on how you can use these SDL bindings.

### 📜 Compiler Defines
`hxsdl` comes with currently one define you
can add to your build.hxml/build command that might make things
easier depending on your situation:

`SDL_PREFIX` - Prefixes everything in `sdl.Types` with `SDL` (Example: `Window` becomes `SDLWindow`)

### 📜 Licensing
`hxsdl` is made available via the **MIT** license. Check [LICENSE](https://github.com/swordcube/hxsdl/blob/main/LICENSE) for more information.
