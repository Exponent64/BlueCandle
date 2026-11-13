#!/usr/bin/python3 -I

import sys
from os import environ
from pathlib import Path
from re import MULTILINE, PatternError, sub


def main() -> int:
    try:
        os_info_file = Path("/usr/lib/os-release")

        image_name: str = environ["IMAGE_NAME"]
        image_pretty_name: str = "bluecandle"
        image_real_name: str = "BlueCandle"
        home_url: str = "https://github.com/Exponent64/BlueCandle"
        documentation_url: str = "https://github.com/Exponent64/BlueCandle/tree/main/docs"
        support_url: str = "https://github.com/Exponent64/BlueCandle/issues"
        bug_support_url: str = "https://github.com/Exponent64/BlueCandle/issues"

        substitutions: list[tuple[str, str]] = [
            (r"^VARIANT_ID=.*", f"VARIANT_ID={image_name}"),
            (r"^PRETTY_NAME=.*", f'PRETTY_NAME="{image_real_name} (powered by secureblue)"'),
            (r"^NAME=.*", f'NAME="{image_real_name}"'),
            (r"^HOME_URL=.*", f'HOME_URL="{home_url}"'),
            (r"^DOCUMENTATION_URL=.*", f'DOCUMENTATION_URL="{documentation_url}"'),
            (r"^SUPPORT_URL=.*", f'SUPPORT_URL="{support_url}"'),
            (r"^BUG_REPORT_URL=.*", f'BUG_REPORT_URL="{bug_support_url}"'),
            (
                r'^CPE_NAME="cpe:/o:secureblue:secureblue',
                f'CPE_NAME="cpe:/o:Exponent64:{image_real_name}',
            ),
            (r"^DEFAULT_HOSTNAME=.*", f"DEFAULT_HOSTNAME={image_pretty_name}"),
            (r"^ID=secureblue", f"ID={image_pretty_name}"),
            (r'^IMAGE_ID="sericea', f'IMAGE_ID="{image_pretty_name}'),
            (r'-hardened"$', '"'),
        ]

        os_info_contents: str = os_info_file.read_text()
        for pattern, replacement in substitutions:
            os_info_contents = sub(pattern, replacement, os_info_contents, flags=MULTILINE)

        os_info_file.write_text(os_info_contents)

    except (FileNotFoundError, PatternError) as e:
        print(e)
        return 1

    return 0


if __name__ == "__main__":
    sys.exit(main())
