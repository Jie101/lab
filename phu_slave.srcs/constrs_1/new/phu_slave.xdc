set_property PACKAGE_PIN E11 [get_ports MONI_0]
set_property IOSTANDARD LVCMOS33 [get_ports MONI_0]

set_property PACKAGE_PIN D10 [get_ports MONI_1]
set_property IOSTANDARD LVCMOS33 [get_ports MONI_1]

set_property PACKAGE_PIN C10 [get_ports MONI_2]
set_property IOSTANDARD LVCMOS33 [get_ports MONI_2]

set_property PACKAGE_PIN C12 [get_ports MONI_3]
set_property IOSTANDARD LVCMOS33 [get_ports MONI_3]

# === ANOTHER SLAVE/MASTER
set_property PACKAGE_PIN A12 [get_ports FPGA_PARA_SPI_DI]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_PARA_SPI_DI]

set_property PACKAGE_PIN A13 [get_ports FPGA_PARA_SPI_DO]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_PARA_SPI_DO]

set_property PACKAGE_PIN B13 [get_ports FPGA_PARA_SPI_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_PARA_SPI_CLK]

set_property PACKAGE_PIN B14 [get_ports FPGA_PARA_SPI_CS]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_PARA_SPI_CS]

set_property PACKAGE_PIN G14 [get_ports FPGA_PARA_SPI_DIE]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_PARA_SPI_DIE]




# === CHIP CLK/RST
set_property PACKAGE_PIN C14 [get_ports FPGA_EXT_RESET]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_EXT_RESET]


set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets {MMCM_CLK_0/inst/clk_in1_clk_wiz_0}]
set_property PACKAGE_PIN F11 [get_ports FPGA_EXT_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_EXT_CLK]







# === CONTROL SIGNAL
set_property PACKAGE_PIN L14 [get_ports FPGA_BLEEDER]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_BLEEDER]

# Over Temperture Alarm
set_property PACKAGE_PIN L13 [get_ports FPGA_OTP]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_OTP]

# == SPI/ M3 or Zynq
set_property PACKAGE_PIN H13 [get_ports FPGA_SPI_DI]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SPI_DI]

set_property PACKAGE_PIN H14 [get_ports FPGA_SPI_DO]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SPI_DO]

set_property PACKAGE_PIN J13 [get_ports FPGA_SPI_CLK]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SPI_CLK]

set_property PACKAGE_PIN J14 [get_ports FPGA_SPI_CS]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SPI_CS]


# == DC2DC MODULE
set_property PACKAGE_PIN N14 [get_ports FPGA_SYNC6]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SYNC6]

set_property PACKAGE_PIN P13 [get_ports FPGA_SYNC5]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SYNC5]

set_property PACKAGE_PIN P12 [get_ports FPGA_SYNC4]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SYNC4]

set_property PACKAGE_PIN N11 [get_ports FPGA_SYNC3]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SYNC3]

set_property PACKAGE_PIN P11 [get_ports FPGA_SYNC2]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SYNC2]

set_property PACKAGE_PIN M10 [get_ports FPGA_SYNC1]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SYNC1]


#
set_property PACKAGE_PIN M14 [get_ports FPGA_OUTPUT]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_OUTPUT]

set_property PACKAGE_PIN N10 [get_ports FPGA_RSV_IO2]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_RSV_IO2]

set_property PACKAGE_PIN P10 [get_ports FPGA_RSV_IO1]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_RSV_IO1]

# **** BANK 34

set_property PACKAGE_PIN N4 [get_ports FPGA_RSV_IO5]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_RSV_IO5]

set_property PACKAGE_PIN P4 [get_ports FPGA_RSV_IO4]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_RSV_IO4]

set_property PACKAGE_PIN P5 [get_ports FPGA_RSV_IO3]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_RSV_IO3]


#
set_property PACKAGE_PIN B3 [get_ports FPGA_CREF]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_CREF]

set_property PACKAGE_PIN A2 [get_ports FPGA_VREF]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_VREF]

set_property PACKAGE_PIN B2 [get_ports FPGA_SENSE_ERR2]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SENSE_ERR2]

set_property PACKAGE_PIN B1 [get_ports FPGA_SENSE_ERR1]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SENSE_ERR1]


# === SCALE CONTROL
set_property PACKAGE_PIN A3 [get_ports FPGA_X1]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_X1]

set_property PACKAGE_PIN C4 [get_ports FPGA_X2]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_X2]

set_property PACKAGE_PIN A4 [get_ports FPGA_X4]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_X4]

set_property PACKAGE_PIN B5 [get_ports FPGA_X8]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_X8]

set_property PACKAGE_PIN A5 [get_ports FPGA_X16]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_X16]








# === DAC7612/ OVP, OCP
set_property PACKAGE_PIN L2 [get_ports FPGA_SDI_5]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SDI_5]

set_property PACKAGE_PIN L1 [get_ports FPGA_CLK_5]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_CLK_5]

set_property PACKAGE_PIN K4 [get_ports FPGA_LOAD_5]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_LOAD_5]

set_property PACKAGE_PIN K3 [get_ports FPGA_CS_5]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_CS_5]


# === DAC7811/ IntR
set_property PACKAGE_PIN L3 [get_ports FPGA_SCLK_4]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SCLK_4]

set_property PACKAGE_PIN M3 [get_ports FPGA_SDIN_4]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SDIN_4]

set_property PACKAGE_PIN M1 [get_ports FPGA_SYNC_4]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SYNC_4]


# === ADC8813 / V0_MONI, VO_REF_MONI
set_property PACKAGE_PIN E2 [get_ports FPGA_CS_3]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_CS_3]

set_property PACKAGE_PIN F2 [get_ports FPGA_CLK_3]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_CLK_3]

set_property PACKAGE_PIN F1 [get_ports FPGA_ECO_3]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_ECO_3]

set_property PACKAGE_PIN G1 [get_ports FPGA_SDO_3]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SDO_3]

set_property PACKAGE_PIN D3 [get_ports FPGA_SDI_3]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SDI_3]

set_property PACKAGE_PIN F3 [get_ports FPGA_CONVST_3]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_CONVST_3]


# === ADC8813 / I0_MONI, IO_REF_MONI
set_property PACKAGE_PIN H1 [get_ports FPGA_CS_2]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_CS_2]

set_property PACKAGE_PIN J2 [get_ports FPGA_CLK_2]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_CLK_2]

set_property PACKAGE_PIN J1 [get_ports FPGA_ECO_2]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_ECO_2]

set_property PACKAGE_PIN J4 [get_ports FPGA_SDO_2]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SDO_2]

set_property PACKAGE_PIN H2 [get_ports FPGA_SDI_2]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SDI_2]

set_property PACKAGE_PIN J3 [get_ports FPGA_CONVST_2]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_CONVST_2]

# === DAC8812 / V, I
set_property PACKAGE_PIN P3 [get_ports FPGA_CLK_1]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_CLK_1]

set_property PACKAGE_PIN N1 [get_ports FPGA_CS_1]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_CS_1]

set_property PACKAGE_PIN M2 [get_ports FPGA_SDI_1]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_SDI_1]

set_property PACKAGE_PIN P2 [get_ports FPGA_LDAC_1]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_LDAC_1]


# === CONTROL IO
set_property PACKAGE_PIN D2 [get_ports FPGA_OCP]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_OCP]

set_property PACKAGE_PIN D1 [get_ports FPGA_OVP]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_OVP]

set_property PACKAGE_PIN C1 [get_ports FPGA_CV]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_CV]

set_property PACKAGE_PIN C3 [get_ports FPGA_CC]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_CC]

set_property PACKAGE_PIN B6 [get_ports FPGA_RL_C]
set_property IOSTANDARD LVCMOS33 [get_ports FPGA_RL_C]
# = end ==================================================================================

set_property CONFIG_MODE S_SERIAL [current_design]
#revert back to original instance
current_instance -quiet
