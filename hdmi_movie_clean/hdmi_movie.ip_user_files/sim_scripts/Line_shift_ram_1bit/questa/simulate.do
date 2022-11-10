onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Line_shift_ram_1bit_opt

do {wave.do}

view wave
view structure
view signals

do {Line_shift_ram_1bit.udo}

run -all

quit -force
