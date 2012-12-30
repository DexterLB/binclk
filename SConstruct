# This SConstruct helps build Atmel AVR
# projects easier with the AVR-GCC tools.
#
# It supports C, C++ and Assembly source fules
#
# It contains the following targets:
# scons             : builds everything
# scons elf         : builds only the elf file
# scons hex         : builds the hex file
# scons ehex        : builds the .ee.hex file (eeprom)
# scons disasm      : builds .s (disassembly)
# scons size        : shows size information
# scons writeflash  : uses avrdude to download
#                     the program memory to the MCU
# scons install     : alias for "scons writeflash"

# -------- configuration options ---------

# project name (use a single word, e.g. "myprj")
pname = 'binclk'

# target chip name (as required by avr-gcc, e.g. atmega8)
mcu = 'atmega8'

# chip name used by AVRDUDE (e.g. m8)
programmer_mcu = 'm8'

# source files
# .c, .cpp or .S (NOT .s !!! for asm)
# example: ['main.c', 'foo.c', 'lowlevel.S']
src = ['main.c', 'ds1302/ds1302.c', 'usartprimitive.c']

# additional includes (e.g. -I/path/to/mydir)
inc = []

# additional libraries (e.g. -lmylib)
libs = []

# build directory - all output files will go here
build_dir = 'build'

# optimisation level
# can be 's' (size opt), '1', '2', '3' or '0' (not advised)
optlevel = 's'

# -------- AVRDUDE options ---------
# only fill these in if you're using the writeflash target

# programmer ID, used by AVRDUDE
# examples: 'stk500', 'avr910', 'avrisp', 'pony'
avrdude_prid = 'avr910'

# port - serial or parallel port to which the
# hardware programmer is attached.
# examples: '/dev/ttyS0', '/dev/ttyS1', '/dev/ttyUSB0'
# avrdude_port = '/dev/ttyS1'
avrdude_port = 'COM1'

# -------- compiler flags ---------
# these are the flags passed to the compilers
# caution: cflags are passed to both cc and ++
# but asmflags are all and only passed to as

cflags = '-gdwarf-2 -fpack-struct' \
    + ' -fshort-enums -funsigned-bitfields' \
    + ' -funsigned-char' \
    + ' -Wall'
cppflags = '-fno-exceptions'

asmflags = ''




# ------------ Config done ---------------

# output format for hex
hexformat = 'ihex'

# format the flags
cflags += ' -I. ' + ' '.join(inc) + ' -mmcu=' + mcu \
    + ' -O' + optlevel
asmflags += ' -I. ' + ' '.join(inc) + ' -mmcu=' + mcu
ldflags = '-mmcu=' + mcu

import os, re, SCons.Tool

def toBuildDir(name):
    'prepends the build dir to a path'
    return os.path.join(build_dir, name)

# transform target to full path
target = toBuildDir(pname)

# determine target files
targetelf = target + '.elf'
targethex = target + '.hex'
targeteepromhex = target + '.ee.hex'
targetdisasm = target + '.s'

# transform all sources to full path
src = map(lambda x: toBuildDir(x), src)

# set output to build dir
VariantDir(build_dir, '.', duplicate=0)

# create environment
dummy = Environment()
if re.search('^win', dummy['PLATFORM']):
    print('Detected windows. Using MinGW')
    env = Environment(ENV = os.environ, tools = ['mingw'])
    Tool('mingw')(env)
else:
    env = Environment(ENV = os.environ)
del dummy

env['PROGSUFFIX']   = '.elf'

# executable names
env['CC'] = 'avr-gcc'
env['CXX'] = 'avr-g++'
env['OBJCOPY'] = 'avr-objcopy'
env['OBJDUMP'] = 'avr-objdump'
env['SIZE'] = 'avr-size'

# include dir
env['CPPPATH'] = '/usr/avr/include'

# avrdude executable
env['AVRDUDE'] = 'avrdude'

# old or new avr-size? new one supports the -C
# option for human-readable output, and the old
# one doesn't
oldsize = True

# set flags into the environment
env.Append(CCFLAGS = cflags)
env.Append(CXXFLAGS = cppflags)
env.Append(ASFLAGS = asmflags)
env.Append(LINKFLAGS = ldflags)

# build .elf
env.Program(target = targetelf, source = src)

# build .hex
env.Command(targethex, targetelf
    , env['OBJCOPY'] + ' -O ' + hexformat \
    + ' -j .text -j .data $SOURCE $TARGET')

# build .ee.hex (eeprom)
env.Command(targeteepromhex, targetelf
    , env['OBJCOPY'] + ' -O ' + hexformat \
    + ' -j .eeprom --change-section-lma .eeprom=0' \
    + ' $SOURCE $TARGET')
    
# create disassembly (.s)
env.Command(targetdisasm, targetelf
    , env['OBJDUMP'] + ' -S $SOURCE > $TARGET')
    
# avr-size options
if oldsize:
    copt = ' -A'
else:
    copt = ' -C ' + '--mcu=' + mcu
# display size
env.Command('size', targetelf, env['SIZE'] + copt \
    + ' $SOURCE')
    
# program the flash with avrdude
env.Command('writeflash', targethex, env['AVRDUDE'] \
    + ' -c ' + avrdude_prid + ' -p ' + programmer_mcu \
    + ' -P ' + avrdude_port + ' -e -U flash:w:$SOURCE')

# create target commands
env.Alias('elf', targetelf)
env.Alias('disasm', targetdisasm)
env.Alias('hex', targethex)
env.Alias('ehex', targeteepromhex)
env.Alias('install', 'writeflash')

# default target (scons without parameters)
Default(targetelf
    , targethex, targeteepromhex
    , targetdisasm
    , 'size')

# all done :)
