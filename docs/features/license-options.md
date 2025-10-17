# License Options

Every project needs a license to tell others what they can and can't do with your code. Choose from popular open source licenses when generating your project.<br/>
<br/>
The template automatically sets up the correct license file and updates your documentation, so you don't have to worry about the legal details.

## Available Licenses

- [**MIT**][mit] - Basically allows anyone to do whatever they want with your code.
- [**Apache 2.0**][apache] - Same as MIT, but with protection from patent lawsuits.
- [**LGPLv3**][lgpl] - Use this library anywhere, but the library itself must stay open source.
- [**GPLv3**][gpl] - Your entire program must be open source under GPL to use this code.
- **GPL v3 (with Reloaded FAQ)** - Same as GPLv3, but with extra FAQ documentation.

!!! info "Reloaded & Sewer's Projects"
    
    Most of the Reloaded ecosystem is built by ***one*** person, in a small 3×3.5m room during ***all their spare time***; unpaid.

    Because Reloaded components are made unpaid with contributions from other volunteers, many projects use **GPLv3** to prevent companies from profiting off others' work while keeping it available to the community. Some projects (like this template) use more permissive licenses if they wouldn't be usable in commercial settings otherwise.

    For non-commercial use, the terms are generally not enforced (I look the other way) - the focus is to prevent unpaid volunteers' work from being monetized without compensation.

## Quick Comparison

| License    | Commercial Use | Patent Grant | Library in Proprietary Apps | Must Share Changes |
| ---------- | -------------- | ------------ | --------------------------- | ------------------ |
| MIT        | ✅              | ❌            | ✅                           | ❌                  |
| Apache 2.0 | ✅              | ✅            | ✅                           | ❌                  |
| LGPLv3     | ✅              | ❌            | ✅                           | ✅*                 |
| GPLv3      | ✅              | ❌            | ❌                           | ✅                  |

*Only changes to the library itself, not applications that use it

## How It Works

When you generate a project:

1. Choose your license from the prompt
2. Template renames the selected file to `LICENSE`
3. Other license files are deleted
4. README.MD automatically references your choice

## Integration with Existing Projects

!!! info
    For adding to existing non-template projects.

Copy the license file you need from `templates/library/`:

```bash
# Example: Copy MIT license
cp templates/library/LICENSE-MIT ./LICENSE
```

Available files:<br/>
- `LICENSE-APACHE` - Apache License 2.0<br/>
- `LICENSE-MIT` - MIT License<br/>
- `LICENSE-LGPL3` - GNU Lesser General Public License v3<br/>
- `LICENSE-GPL3` - GNU General Public License v3<br/>
- `LICENSE-GPL3-R` - GPL v3 with Reloaded Project FAQ

Update your README.MD:

```markdown
## License

Licensed under [MIT](./LICENSE).

[Learn more about Reloaded's general choice of licensing for projects.][reloaded-license].

[reloaded-license]: https://reloaded-project.github.io/Reloaded.MkDocsMaterial.Themes.R2/Pages/license/
```

Update your Cargo.toml:

```toml
[package]
license-file = "LICENSE"
```

Remember to update the copyright information in your chosen license file with your name and the current year.

[mit]: https://opensource.org/licenses/MIT
[apache]: https://opensource.org/licenses/Apache-2.0
[lgpl]: https://www.gnu.org/licenses/lgpl-3.0
[gpl]: https://www.gnu.org/licenses/gpl-3.0