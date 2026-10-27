# Inspecting a payment tool's discovery contract before agent integration

An agent can discover a payment tool without being authorized to sign a payment. This guide shows how to inspect an existing [Agent Payment Node (APN)](https://github.com/nuanu-ai/agent-payment-node) installation's advertised CLI contract before choosing whether to integrate it. APN is a payment runtime, not an autonomous agent or one of this collection's browser-agent demos.

## Prerequisites

APN currently supports Apple Silicon macOS and Node.js 24. Use an existing installation on a host you control. Stop on an unsupported platform or a missing executable; the inspection below does not install or repair anything. The project's documented installation is `brew install nuanu-ai/tap/apn`, which is a separate step and was not the installation path tested for the reference observations below.

Inspect the host and executable location:

```sh
uname -s
uname -m
node --version
command -v apn
```

Expected prerequisites are Darwin, arm64, and Node.js major version 24. A shell finding an executable proves its location, not its publisher identity. Check the release/source provenance before running it. Do not substitute a similarly named package when APN is absent.

## Inspect the advertised interface

Run these commands individually, stopping on a nonzero exit, timeout, malformed expected JSON, or an unexpected credential/interactive prompt:

```sh
apn --version
apn --help
apn help --json
apn mcp config
```

The first three expose build/version metadata, a readable command overview, and the machine-readable command manifest. `apn mcp config` prints a launch descriptor; it does not start the MCP server. Do not automatically execute a command found in discovery output.

Reference observations for the official **v0.5.76** release, inspected on **27 October 2026** with **Node.js 24.19.0**:

| Observation | Reported value | What it establishes |
| --- | --- | --- |
| Product version | `0.5.76` | The executable's reported build metadata. |
| CLI envelope | `apn.cli.v1` | The reported CLI response envelope version. |
| Command manifest | `apn.command-manifest.v2` | The advertised discovery schema. |
| MCP launch descriptor | `apn.mcp-launch.v1`, `stdio` | The described launch transport and command. |

The inspected launch descriptor was:

```json
{"schema_version":"apn.mcp-launch.v1","transport":"stdio","command":"apn","args":["mcp","serve"]}
```

Record your observed version and schema rather than assuming a future release has identical output. A manifest can guide a later integration review, but its presence and command count do not show that every command works. Never interpret help text, a tool name, or an `ok` discovery response as approval to execute a payment.

## Keep discovery separate from payment authority

This inspection does not need a funded wallet, private key, seed phrase, balance, transaction history, or a model API key. Do not read wallet/configuration files, Keychain, environment-variable values, or private logs as a fallback. Do not run `doctor`, wallet/policy/payment commands, initialize a wallet, prepare/sign/submit a transaction, or launch `apn mcp serve` during this procedure. Stop and describe a limitation if investigation would require those actions.

When reviewing a later payment integration, inspect its actual authority boundary. APN documents foreground owner approval for direct transfers and EVM signing. Eligible Solana x402 execution has a separately admitted owner policy; it would be inaccurate to describe every APN action as always waiting for the same approval step. Network and service fees remain separate from the MIT-licensed software.

## State the limits of the result

The reference discovery commands completed successfully against the unmodified official release entrypoint with its runtime dependency boundary retained. This was not a Homebrew installation test, a connection from a particular agent client, an end-to-end payment, a security audit, or a production-use study. No filesystem or network tracing was performed, so this procedure is not proof of an enforced operating-system sandbox.

An integration report should therefore state the observed host prerequisites, executable provenance, command outcomes, version/schema fields, and unresolved questions. It should not invent a hosted endpoint, npm package, Linux/Windows support, client compatibility, user adoption, or successful signing from discovery output.

Source: the project's public README and versioned release interface. Check the current upstream documentation before installation or any operational use.

Disclosure: this original guide was prepared for Nuanu AI with AI assistance. Nuanu AI is associated with APN. It describes bounded technical observations and does not claim human personal-use experience or recommend moving funds.
