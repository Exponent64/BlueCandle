#!/usr/bin/python3 -I

import sys
from pathlib import Path
from shutil import rmtree
from subprocess import CalledProcessError, run


def main() -> int:
    patches_dir: Path = Path("/root/patches")
    patch_args: list[str] = [
        "--directory=/",
        "--forward",
        "--strip=1",
        "--no-backup-if-mismatch",
        "--verbose",
    ]

    try:
        for patch in sorted(patches_dir.glob("*.patch")):
            run(["/usr/bin/patch", *patch_args, "<", patch], check=True)

        rmtree(patches_dir)

    except (CalledProcessError, FileNotFoundError) as e:
        print(e)
        return 1

    return 0


if __name__ == "__main__":
    sys.exit(main())
