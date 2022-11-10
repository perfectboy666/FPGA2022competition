onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib clock_manage_opt

do {wave.do}

view wave
view structure
view signals

do {clock_manage.udo}

run -all

quit -force
