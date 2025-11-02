# {{project-name}}

[![Crates.io](https://img.shields.io/crates/v/{{project-name}}.svg)](https://crates.io/crates/{{project-name}})
[![Docs.rs](https://docs.rs/{{project-name}}/badge.svg)](https://docs.rs/{{project-name}})
[![CI](https://github.com/{{gh_username}}/{{project-name}}/actions/workflows/rust.yml/badge.svg)](https://github.com/{{gh_username}}/{{project-name}}/actions)

-----------------------

## Additional Setup Required!!

Additional setup might be required.  
Once you do the stuff under this text, delete this section.  

### Code Coverage
To setup code coverage for this project:

1. Go to [Codecov][codecov], add your project.
2. Go to [Settings -> Secrets and variables -> Actions][gh-actions-secrets] in your repo and add a repository secret named `CODECOV_TOKEN`.

The instructions on the Codecov page will provide the token to use.

{% if mkdocs -%}
### Setup Documentation

Before you make your first commit to GitHub, you'll need to go to [Settings -> Pages][gh-pages] and set
`Source` to `GitHub Actions` for the documentation builds to work.

{% endif %}
{% if publish_crate_on_tag -%}
### Setup API Key (crates.io)

You'll need to set up an API key to publish to `crates.io` on tag.

- Generate your API key in [crates.io (Account Settings -> API Tokens)][crates-io-key].  
- Go to [Settings -> Secrets and variables -> Actions][gh-actions-secrets] in your repo and add environment secret named `CRATES_IO_TOKEN`.  
- Paste your API key.  

{% if build_csharp_libs %}
### Setup API Key (NuGet)
You'll need to set up an API key to publish to `NuGet` on tag.

- Generate your API key in [Api Keys][nuget-key].  
- Go to [Settings -> Secrets and variables -> Actions][gh-actions-secrets] in your repo and add a repository secret named `NUGET_KEY`.  
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

{% if mkdocs %}
## Getting Started with VSCode

Open the `src` folder in VSCode as your workspace for development.
{% endif %}

{% if mkdocs %}
## Developer Manual

For step-by-step development guidance, see the [Developer Manual](https://{{gh_username}}.github.io/{{gh_reponame}}/manual/).
{% endif %}

{% if mkdocs %}
## Contributing

We welcome contributions! See the [Contributing Guide](https://{{gh_username}}.github.io/{{gh_reponame}}/manual/#contributing) for details.
{% endif %}

## License

Licensed under [{{license}}](./LICENSE).  

[Learn more about Reloaded's general choice of licensing for projects.][reloaded-license].  

[codecov]: https://app.codecov.io
[gh-actions-secrets]: https://github.com/{{gh_username}}/{{project-name}}/settings/secrets/actions
[gh-pages]: https://github.com/{{gh_username}}/{{project-name}}/settings/pages
[crates-io-key]: https://crates.io/settings/tokens
[nuget-key]: https://www.nuget.org/account/apikeys
{%- if mkdocs %}
[docs]: https://{{gh_reponame}}.github.io/{{gh_reponame}} {%- endif %}
[reloaded-license]: https://reloaded-project.github.io/Reloaded.MkDocsMaterial.Themes.R2/Pages/license/