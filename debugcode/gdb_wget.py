gdb.execute("set logging on")
gdb.execute("set logging file gdb.log")
gdb.execute("set breakpoint pending on")
gdb.execute("set height 0")

f = open("wget.map", 'r')
for line in f:
        gdb.execute("b " + line[19:len(line)-1]);
f.close()

gdb.execute("run www.baidu.com");

while 1:
        gdb.execute("bt");
        gdb.execute("c");
