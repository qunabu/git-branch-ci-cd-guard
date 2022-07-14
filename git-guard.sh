#!/usr/bin/env bash


green='\033[1;32m'
red='\e[31m'
no_color='\033[0m'


branch="$1"
feature_branch="$2"

branch_name=`git rev-parse --abbrev-ref $branch`;

merge_base="$(git merge-base $branch $feature_branch)"
merge_source_current_commit="$(git rev-parse $branch)"


if [ "$merge_base" != "$merge_source_current_commit" ]; then
    echo -e "${red}Branch with name '$branch_name' is not completely merged with $feature_branch.${no_color}";
    exit 1;
else
    echo -e "${green}Branch with name '$branch_name' is merged with $feature_branch, now checking against origin/master${no_color}";
fi

