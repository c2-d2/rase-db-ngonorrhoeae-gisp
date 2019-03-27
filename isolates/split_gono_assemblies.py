#! /usr/bin/env python3
"""Split the main N. gonorrhoeae sequence file.

Author: Karel Brinda <kbrinda@hsph.harvard.edu>

Licence: MIT
"""

import argparse
import collections
import os
import re
import sys


def load_tsv_dict(tsv_fo, col1, col2):
    """Load a dictionary from a TSV file (col1 -> col2).
    """
    i = 0
    d = {}
    for l in tsv_fo:
        l = l.strip()
        if len(l) == 0:
            continue
        parts = l.split("\t")
        k = parts[col1]
        v = parts[col2]
        d[k] = v
    return d


def sample_from_header(fah):
    parts = fah.split(".")
    assert len(parts) == 3, str(parts)
    return parts[1]


def split(fa_fo, annotations):
    translation_dict = load_tsv_dict(annotations, 0, 4)

    current_sample = None
    g = None

    unknown_i = 0

    for l in fa_fo:
        l = l.strip()
        if len(l) == 0:
            continue
        if l[0] == ">":
            sample = sample_from_header(l)

            a, c, b = sample.rpartition("_")
            sample = "{}#{}".format(a, b)

            try:
                translation_dict[sample]
            except KeyError:
                unknown_i += 1
                translation_dict[sample] = "_unknown_{}_".format(unknown_i)

            fn = "{}.fa".format(translation_dict[sample])

            if current_sample != sample:
                if g is not None:
                    g.close()
                g = open(fn, "w")
                print("Creating", fn)
                current_sample = sample
        g.write(l + "\n")

    if g is not None:
        g.close()


def main():

    parser = argparse.ArgumentParser(description="")

    parser.add_argument(
        '-m',
        type=argparse.FileType('r'),
        metavar='annotation.tsv',
        dest='annotations',
        help='annotation file',
    )

    parser.add_argument(
        'fa',
        type=argparse.FileType('r'),
        metavar='file.fa',
        help='The gono file',
    )

    args = parser.parse_args()

    split(args.fa, args.annotations)


if __name__ == "__main__":
    main()
