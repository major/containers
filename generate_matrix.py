#!/usr/bin/env python
"""Generate a matrix for building containers in GitHub actions."""
import glob
import json
import os
import shlex
from subprocess import check_output

GITHUB_SHA = os.environ.get('GITHUB_SHA', "HEAD~2")

# Which files changed between the last run and this one?
git_cmd = f"/usr/bin/git diff-tree --no-commit-id --name-only -r {GITHUB_SHA}"
output = check_output(shlex.split(git_cmd))
changed_files = output.decode().strip().split('\n')

# Get a set of directories that changed since the last commit if they contain
# a Dockerfile.
changed_dirs = list(
    set(
        x.split('/')[0] for x in changed_files
        if os.path.isfile(f"{x.split('/')[0]}/Dockerfile")
    )
)

# If we found no changes in Dockerfile directories, we should build all of the
# containers because the matrix generator or actions YAML may have changed.
if not changed_dirs:
    changed_dirs = [x.split('/')[0] for x in glob.glob("*/Dockerfile")]

output_json = json.dumps(
    {
        "project": changed_dirs,
        # "include": [{"project": x} for x in changed_dirs]
    }
)

print(f"::set-output name=continue::yes")
print(f"::set-output name=matrix::{output_json}")
