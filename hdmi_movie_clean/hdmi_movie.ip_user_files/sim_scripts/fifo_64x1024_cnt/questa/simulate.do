onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fifo_64x1024_cnt_opt

do {wave.do}

view wave
view structure
view signals

do {fifo_64x1024_cnt.udo}

run -all

quit -force
