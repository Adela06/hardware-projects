@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 1d50d889437c4c229141eb111a52a144 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot testare_behav xil_defaultlib.testare -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0