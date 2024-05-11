from pathlib import Path

import jsbeautifier as js

BASEDIR = Path(__file__).resolve().parent
EXCLUDE = ('ssave', )

OPTS: js.BeautifierOptions = js.default_options()
OPTS.end_with_newline = True
OPTS.wrap_line_length = 80


def check_excluded(path):
    for excl in EXCLUDE:
        if excl in path.name:
            return True
    return False


def collect_all_gml(dir=BASEDIR):
    result = []
    for path in dir.iterdir():
        if path.is_dir():
            result += collect_all_gml(path)
        elif path.name.endswith('.gml'):
            result.append(path)
    return result


def run():
    all_gmls = collect_all_gml()
    all_gmls = [gml for gml in all_gmls if not check_excluded(gml)]
    for path in all_gmls:
        result = js.beautify_file(path, OPTS)
        with path.open('w') as f:
            f.write(result)
    print('All your code is beautified!')


if __name__ == '__main__':
    run()
