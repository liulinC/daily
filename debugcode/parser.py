import argparse

VALID_BT_LABEL="main"
SOURCE_LABEL = "at"

def get_function_name(line):
    function = ""
    if " in " not in line:
        function = line.split()[1]
    else:
        function = line.split()[3]

    if SOURCE_LABEL in line:
        source = line.split(SOURCE_LABEL)[-1].strip()
        function = function +  " " + source

    return function


def get_break_point(f):
    line = f.readline()
    lines = []
    while line and line.strip():
        lines.append(line)
        line = f.readline()

    lines = [line for line in lines if "#" in line]
    lines = map(get_function_name,lines)
    lines.reverse()
    return lines

def print_break_point(bt,prebt):
    diff = False
    for idx, ele in enumerate(bt):
        if not diff and len(prebt)>idx and ele.split()[0] == prebt[idx].split()[0] and idx != len(bt) -1:
            print ("\t"),
        else:
            if not diff:
                diff = True
            else:
                for i in range(idx):
                    print("\t"),
            print ele

def get_valid_bt(f):
    bt = get_break_point(f)
#    print bt
    while bt and VALID_BT_LABEL not in bt[0]:
        bt = get_break_point(f)
    return bt

def parse_argument():
    parser = argparse.ArgumentParser()
    parser.add_argument("-i","--input",help="input file to be parsed")

    args = parser.parse_args()
    return args

if __name__ == "__main__":
    args = parse_argument()
    input_to_parse = args.input
    with open(input_to_parse) as f:
        bt = get_valid_bt(f)
        prebt = []
        while bt:
#            print bt
            if len(bt) == 1:
                print bt[0]
            prebt = bt
            bt = get_valid_bt(f)
            print_break_point(bt,prebt)
