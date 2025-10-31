# {{project-name}}

[![Crates.io](https://img.shields.io/crates/v/{{project-name}}.svg)](https://crates.io/crates/{{project-name}})
[![Docs.rs](https://docs.rs/{{project-name}}/badge.svg)](https://docs.rs/{{project-name}})
[![CI](https://github.com/{{gh_username}}/{{project-name}}/actions/workflows/rust.yml/badge.svg)](https://github.com/{{gh_username}}/{{project-name}}/actions)

-----------------------

## Additional Setup Required!!

Additional setup might be required.  
Once you do the stuff under this text, delete this section.  

### Code Coverage
To setup code coverage for this project. Login into [Codecov][codecov] and add this repository from your list of tracked repos.

{% if mkdocs -%}
### Setup Documentation

Before you make your first commit to GitHub, you'll need to go to `Settings -> Pages` and set
`Source` to `GitHub Actions` for the documentation builds to work.

{% endif %}
{% if publish_crate_on_tag -%}
### Setup API Key (crates.io)

You'll need to set up an API key to publish to `crates.io` on tag.

- Go to `Settings -> Secrets -> Actions` in your repo and add environment secret named `CRATES_IO_TOKEN`.  
- Paste your API key generated in [crates.io (Account Settings -> API Tokens)][crates-io-key].  

{% if build_csharp_libs %}
### Setup API Key (NuGet)
You'll need to set up an API key to publish to `NuGet` on tag.

- Go to `Settings -> Secrets -> Actions` in your repo and add environment secret named `NUGET_KEY`.  
- Paste your API key generated in [Api Keys][nuget-key].  
{% endif %}
{% endif %}

### Fill in Crate Description

This readme file (under the dashed line) is used for the crate description on GitHub and
crates.io (if uploaded). Consider filling in this readme with examples for end users and any
other useful info.

-----------------------

## About

{{project_description}}
{% if mkdocs %}
You can learn more about this project in the [dedicated documentation page][docs].
{% endif %}

## Development

For information on how to work with this codebase, see [README-DEV.MD](README-DEV.MD).

## License

Licensed under [{{license}}](./LICENSE).  

[Learn more about Reloaded's general choice of licensing for projects.][reloaded-license].  

[codecov]: https://about.codecov.io/
[crates-io-key]: https://crates.io/settings/tokens
[nuget-key]: https://www.nuget.org/account/apikeys
{%- if mkdocs %}
[docs]: https://{{gh_reponame}}.github.io/{{gh_reponame}} {%- endif %}
[reloaded-license]: https://reloaded-project.github.io/Reloaded.MkDocsMaterial.Themes.R2/Pages/license/