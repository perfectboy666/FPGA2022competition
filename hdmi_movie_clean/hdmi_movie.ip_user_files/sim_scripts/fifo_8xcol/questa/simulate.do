onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fifo_8xcol_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_8xcol.udo}

run -all

quit -force
