onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fifo_delay_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_delay.udo}

run -all

quit -force
