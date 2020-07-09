#!/bin/sh -l

# Copyright 2020 MaidSafe.net limited.
#
# This SAFE Network Software is licensed to you under the MIT license <LICENSE-MIT
# http://opensource.org/licenses/MIT> or the Modified BSD license <LICENSE-BSD
# https://opensource.org/licenses/BSD-3-Clause>, at your option. This file may not be copied,
# modified, or distributed except according to those terms. Please review the Licences for the
# specific language governing permissions and limitations relating to use of the SAFE Network
# Software.

echo "Running new SAFE Network section with $1 vault and $2 cli"
echo ""

# Download the specified vault version 
wget "https://safe-vault.s3.eu-west-2.amazonaws.com/safe_vault-$1-x86_64-unknown-linux-musl.tar.gz" -O ./vault.tar.gz;

ls .
mkdir -p $HOME/.safe/vault
tar -xvzf ./vault.tar.gz -C $HOME/.safe/vault/
chmod +x $HOME/.safe/vault/safe_vault

# Download the specified cli version
wget "https://safe-api.s3.eu-west-2.amazonaws.com/safe-cli-$2-x86_64-unknown-linux-gnu.tar.gz" -O ./safe.tar.gz;

ls .
mkdir -p $HOME/.safe/safe-cli
mkdir -p $HOME/.safe/authd
tar -xvzf ./safe.tar.gz -C $HOME/.safe/safe-cli/
echo "::add-path::$HOME/.safe/safe-cli"
echo "::add-path::$HOME/.safe/authd"
chmod +x $HOME/.safe/safe-cli/safe

# Install safe authd   
safe auth install
chmod +x $HOME/.safe/authd/safe-authd

# Check versions
$HOME/.safe/authd/safe-authd -V
$HOME/.safe/vault/safe_vault -V
safe --version

# Start Baby Fleming Network
safe vault run-baby-fleming
