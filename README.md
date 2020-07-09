# Start local SAFE Network action

This action starts a SAFE Network section on the GitHub Actions VM it runs on.

It is intended to be called by other GitHub Actions when they require a section to be running, for example, to run tests against a real section.

## Inputs

### `vault-version`

**Required** The version of safe-vault to be downloaded and ran. Default `"latest"`.

### `cli-version`

**Required** The version of safe-cli to be downloaded and ran. Default `"latest"`.

## Example usage

uses: maidsafe/start-local-safe-network-action@v1
with:
  vault-version: 'latest'
  cli-version: 'latest'

## License

This action is dual-licensed under the Modified BSD ([LICENSE-BSD](LICENSE-BSD) https://opensource.org/licenses/BSD-3-Clause) or the MIT license ([LICENSE-MIT](LICENSE-MIT) https://opensource.org/licenses/MIT) at your option.

## Contributing

Want to contribute? Great :tada:

There are many ways to give back to the project, whether it be writing new code, fixing bugs, or just reporting errors. All forms of contributions are encouraged!

For instructions on how to contribute, see our [Guide to contributing](https://github.com/maidsafe/QA/blob/master/CONTRIBUTING.md).
