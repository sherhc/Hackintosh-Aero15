/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of iASLaoddLI.aml, Sat Sep  1 23:31:46 2018
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000005B2 (1458)
 *     Revision         0x02
 *     Checksum         0x16
 *     OEM ID           "hack"
 *     OEM Table ID     "PCIList"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "PCIList", 0x00000000)
{
    External (_SB_.PCI0.IGPU, DeviceObj)    // (from opcode)  
    External (_SB_.PCI0.RP01.PXSX, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.RP03.PXSX, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.RP05, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.RP13.PXSX, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.SATA, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.SBUS, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.XHC, DeviceObj)    // (from opcode)

    Method (_SB.PCI0.IGPU._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One)
            {
                 0x03                                           
            })
        }

        Return (Package ()
        {
            "AAPL,slot-name", 
            Buffer ()
            {
                "PCI-Express"
            }, 

            "hda-gfx", 
            Buffer ()
            {
                "onboard-1"
            }
        })
    }


    Method (_SB.PCI0.RP01.PXSX._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One)
            {
                 0x03                                           
            })
        }

        Return (Package ()
        {
            "AAPL,slot-name", 
            Buffer ()
            {
                "PCI-Express"
            }
        })
    }

    Method (_SB.PCI0.RP03.PXSX._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One)
            {
                 0x03                                           
            })
        }

        Return (Package ()
        {
            "AAPL,slot-name", 
            Buffer ()
            {
                "PCI-Express"
            }, 

            "model", 
            Buffer ()
            {
                "Intel Wireless 8265"
            }
        })
    }
    Method (_SB.PCI0.RP05._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One)
            {
                 0x03                                           
            })
        }

        Return (Package ()
        {
            "AAPL,slot-name", 
            Buffer ()
            {
                "M.2 key"
            }, 

            "model", 
            Buffer ()
            {
                "PCI Express Root Port #5"
            }
        })
    }
    Method (_SB.PCI0.RP13.PXSX._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One)
            {
                 0x03                                           
            })
        }

        Return (Package ()
        {
            "AAPL,slot-name", 
            Buffer ()
            {
                "M.2 key"
            }, 

            "model", 
            Buffer ()
            {
                "NVMe SSD Controller SM961/PM961"
            }
        })
    }

    Method (_SB.PCI0.SATA._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One)
            {
                 0x03                                           
            })
        }

        Return (Package ()
        {
            "AAPL,slot-name", 
            Buffer ()
            {
                "PCI-Express"
            }, 

            "model", 
            Buffer ()
            {
                "HM170/QM170 Chipset SATA Controller"
            }
        })
    }
    
    Method (_SB.PCI0.SBUS._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One)
            {
                 0x03                                           
            })
        }

        Return (Package ()
        {
            "AAPL,slot-name", 
            Buffer ()
            {
                "PCI-Express"
            }, 

            "model", 
            Buffer ()
            {
                "100 Series/C230 Series Chipset Family SMBus"
            }
        })
    }
    
    Method (_SB.PCI0.XHC._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One)
            {
                 0x03                                           
            })
        }

        Return (Package ()
        {
            "AAPL,slot-name", 
            Buffer ()
            {
                "PCI-Express"
            }, 

            "model", 
            Buffer ()
            {
                "100 Series/C230 Series Chipset Family USB 3.0 xHCI Controller"
            }        
        })
    }
}

