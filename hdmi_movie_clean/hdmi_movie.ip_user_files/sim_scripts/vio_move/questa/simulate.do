onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib vio_move_opt

do {wave.do}

view wave
view structure
view signals

do {vio_move.udo}

run -all

quit -force
