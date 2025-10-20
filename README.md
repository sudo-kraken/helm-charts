<div align="center">
<img src="docs/assets/logo.png" align="center" width="144px" height="144px"/>

### Helm Charts

_Custom Helm charts. Each chart includes its own README with usage and configuration._
</div>

<div align="center">

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/sudo-kraken&style=for-the-badge)](https://artifacthub.io/packages/search?user=sudo-kraken)

</div>

## Contents

- [Overview](#overview)
- [Important note](#important-note)
- [Using the charts](#using-the-charts)
- [Repository structure](#repository-structure)
- [Development](#development)
  - [Run linter](#run-linter)
  - [Generate docs](#generate-docs)
  - [Devcontainer](#devcontainer)
- [Licence](#licence)
- [Security](#security)
- [Contributing](#contributing)
- [Support](#support)

## Overview

These are personal Helm charts published to Artifact Hub. Documentation and values for each chart live alongside the chart in its own directory under `charts/`.

## Important note

> [!IMPORTANT]
> Do not open a pull request to update `appVersion`. This is managed by Renovate and GitHub workflows.
> If you need a more recent image version, set it in your `values.yaml`.

## Using the charts

Installation and source can differ by chart. Refer to the chart’s README for authoritative instructions. Common patterns are shown below.

# Install a chart
```bash
helm install <release-name> sudo-kraken/<chart-name> --version <x.y.z> -f values.yaml
```

### From an OCI registry

```bash
# Install directly from OCI
helm install <release-name> oci://ghcr.io/sudo-kraken/charts/<chart-name> --version <x.y.z> -f values.yaml
```

## Repository structure

```
.
├─ charts/
│  ├─ <chart-name>/
│  │  ├─ Chart.yaml
│  │  ├─ values.yaml
│  │  ├─ templates/
│  │  └─ README.md
├─ docs/
│  └─ assets/
│     └─ logo.png
└─ README.md
```

## Development

Install [helm](https://helm.sh/docs/intro/install/) and [helm-docs](https://github.com/norwoodj/helm-docs).

### Run linter

```bash
helm lint charts/<chart-name>
```

### Generate docs

```bash
helm-docs
# or limit to a single chart
helm-docs -c charts/<chart-name>
```

### Devcontainer

See the [documentation](https://code.visualstudio.com/docs/devcontainers/containers) for details on using the provided devcontainer.

## Licence

This project is licensed under the MIT Licence. See the [LICENCE](LICENCE) file for details.

## Security

If you discover a security issue, please review and follow the guidance in [SECURITY.md](SECURITY.md), or open a private security-focused issue with minimal details and request a secure contact channel.

## Contributing

Feel free to open issues or submit pull requests if you have suggestions or improvements.  
See [CONTRIBUTING.md](CONTRIBUTING.md)

## Support

Open an [issue](/../../issues) with as much detail as possible, including the chart name, version and any relevant `helm` output.
