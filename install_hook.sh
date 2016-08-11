#!/usr/bin/env bash

info "Configure Code Sniffer Git Hook"

FULL_PATH="$(cd "$(dirname "$1")"; pwd)/$(basename "$1")"
STANDARD_PATH=${FULL_PATH}"vendor/yiisoft/yii2-coding-standards/Yii2"

# Install Yii2 standard
cp -rf ${STANDARD_PATH} ~/.composer/vendor/squizlabs/php_codesniffer/CodeSniffer/Standards/Yii2
~/.composer/vendor/bin/phpcs --config-set default_standard Yii2

# Install Git hooks
cp ${FULL_PATH}"vendor/richweber/yii2-code-sniffer-git-hook/pre-commit" ${FULL_PATH}".git/hooks/pre-commit"
cp ${FULL_PATH}"vendor/richweber/yii2-code-sniffer-git-hook/pre-commit_yii2cs" ${FULL_PATH}".git/hooks/pre-commit_yii2cs"
cp ${FULL_PATH}"vendor/richweber/yii2-code-sniffer-git-hook/.hooks_ignore" ${FULL_PATH}".hooks_ignore"