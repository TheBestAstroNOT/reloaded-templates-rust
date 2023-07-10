# Reloaded Project Configurations

This page hosts the common configurations for various parts of the Reloaded project that are written in Rust.

It includes configuration for `Code - OSS` (a.k.a. `vscode`), as well as scripts for debugging under different platforms.

## Usage

To use this repository, add it as a submodule to your project.

```
git submodule add https://github.com/Reloaded-Project/reloaded-project-configurations-rust.git ./src/reloaded-project-configurations
```

Periodically update the submodule to the latest version.

```
git submodule update --remote
```

## Code Style

Rust projects in Reloaded use the default code style of `rustfmt`.

## File Layout

The following is the expected file layout for your project:

```
- docs/
- src/
```

The `docs` folder should contain all documentation for your project (if present).  
The `src` folder should contain all source code for your project. Inside here is `Cargo.toml`.

## CI/CD Runs

[INCOMPLETE]

For CI runs, you can use the following composite steps to set up the required tools and SDKs:

```yaml
- name: "Setup Reloaded Library SDKs & Components"
- uses: Reloaded-Project/Reloaded.Project.Configurations/.github/actions/setup-sdks-components@main
```

```yaml
# Showing default values, not all inputs are mandatory.
# Refer to actual upload-coverage-packages file for descriptions.
- name: "Upload Codecov Coverage, Changelog & NuGet Packages"
- uses: Reloaded-Project/Reloaded.Project.Configurations/.github/actions/upload-coverage-packages@main
  with:
    code-coverage-path: './Coverage.xml'
    changelog-path: './Changelog.md'
    nupkg-glob: './src/*.nupkg'
    nuget-key: ${{ secrets.NUGET_KEY }}
    changelog-template: 'keepachangelog'
    is-release: ${{ startsWith(github.ref, 'refs/tags/') }} # if 'true' publishes to GitHub Actions and NuGet
```

Replace `@main` with appropriate version tag if you want to pin to a specific version.

### Cross Targeting CI/CD Runs

[INCOMPLETE]

Use the following template to run CI/CD for multiple target frameworks:

```yaml
name: Build, Test and Publish
on:
  push:
    branches: [ main ]
    tags:
      - '*'
  pull_request:
    branches: [ main ]
  workflow_dispatch:

jobs:
  build:
    strategy:
      matrix:
        os:
          - windows-latest
          - ubuntu-latest
          - macos-latest
        targetFramework:
          - net7.0
          - net6.0
          - net5.0
          - netcoreapp3.1
        platform:
          - x64
        include:
          - os: windows-latest
            targetFramework: net48
            platform: x64
          - os: windows-latest
            targetFramework: net48
            platform: x86
          - os: windows-latest
            targetFramework: net7.0
            platform: x86
          - os: windows-latest
            targetFramework: net6.0
            platform: x86
          - os: windows-latest
            targetFramework: net5.0
            platform: x86
          - os: windows-latest
            targetFramework: netcoreapp3.1
            platform: x86
            
    runs-on: ${{ matrix.os }}
    steps:
      - name: Checkout Code
        uses: actions/checkout@v3
        with:
          fetch-depth: 0
          submodules: 'recursive'
      - name: Setup Reloaded Library SDKs & Components
        uses: Reloaded-Project/Reloaded.Project.Configurations/.github/actions/setup-sdks-components@main
      - name: Build Library
        run: dotnet build -c Release -f ${{ matrix.targetFramework }} ./src/Reloaded.<XXX>.Tests/Reloaded.<XXX>.Tests.csproj
      - name: Run Tests
        run: dotnet test -c Release -f ${{ matrix.targetFramework }} ./src/Reloaded.<XXX>.Tests/Reloaded.<XXX>.Tests.csproj --collect:"XPlat Code Coverage;Format=opencover;" --results-directory "Coverage"
      - name: "Upload Coverage"
        uses: actions/upload-artifact@v3
        with:
          name: coverage-${{ matrix.os }}-${{ matrix.targetFramework }}
          path: Coverage/*/coverage.cobertura.xml
  upload:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - name: "Checkout Code"
        uses: actions/checkout@v3
        with:
          fetch-depth: 0
          submodules: 'recursive'
      - name: "Setup Reloaded Library SDKs & Components"
        uses: Reloaded-Project/Reloaded.Project.Configurations/.github/actions/setup-sdks-components@main
      - name: Build Library
        run: dotnet build -c Release ./src
      - name: "Install ReportGenerator"
        run: dotnet tool install --global dotnet-reportgenerator-globaltool
      - name: "Download Coverage Artifacts"
        uses: actions/download-artifact@v3
        with:
            path: artifacts
      - name: "Merge Coverage Files"
        run: |
            dotnet tool install --global dotnet-coverage
            dotnet-coverage merge ./artifacts/*.cobertura.xml --recursive --output ./Cobertura.xml --output-format xml
      - name: "Upload Coverage & Packages"
        uses: Reloaded-Project/Reloaded.Project.Configurations/.github/actions/upload-coverage-packages@main
        with:
          code-coverage-path: './Cobertura.xml'
          changelog-path: './Changelog.md'
          nupkg-glob: './src/*.nupkg'
          nuget-key: ${{ secrets.NUGET_KEY }}
          changelog-template: 'keepachangelog'
          is-release: ${{ startsWith(github.ref, 'refs/tags/') }}
          release-tag: ${{ github.ref_name }}
```

## Documentation

If documentation is required, please follow the guidelines
for [Reloaded MkDocs Theme](https://reloaded-project.github.io/Reloaded.MkDocsMaterial.Themes.R2/Pages/)
on how to set up documentation.

## License

This repository is licensed under the GPLv3 license; as per all Reloaded components since June 2023.