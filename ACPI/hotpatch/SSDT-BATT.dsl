DefinitionBlock("", "SSDT", 2, "hack", "batt", 0)
{
     
    External(B1SC, IntObj)
    External(B1SS, IntObj)
    //External(\_SB.PCI0, DeviceObj)
    //External(\_SB.PCI0.LPCB, DeviceObj)
    External(\_SB.PCI0.LPCB.EC, DeviceObj)
    External(\_SB.PCI0.LPCB.EC.FBFC, IntObj)
    External(\_SB.PCI0.LPCB.EC.B1ST, IntObj)
    External(\_SB.PCI0.LPCB.EC.BAT1, DeviceObj)
    External(\_SB.PCI0.AMW0, DeviceObj)
    External(\_SB.PCI0.LPCB.CRAF, IntObj)
    External(\_SB.PCI0.LPCB.PLMX, IntObj)
    External(\_SB.PCI0.LPCB.EC.LUXL, IntObj)
    External(\_SB.PCI0.LPCB.EC.LUXH, IntObj)
    External(\_SB.PCI0.LPCB.EC.KBLL, IntObj)
    External(\_SB.PCI0.LPCB.EC.WNON, IntObj)
    External(\_SB.PCI0.LPCB.EC.BTON, IntObj)
    External(\_SB.PCI0.LPCB.EC.P2ON, IntObj)
    External(\_SB.PCI0.LPCB.EC.CDON, IntObj)
    External(\_SB.PCI0.LPCB.EC.PSON, IntObj)
    External(\_SB.PCI0.LPCB.EC.SCEN, IntObj)
    External(\_SB.PCI0.LPCB.EC.USBC, IntObj)
    External(\_SB.PCI0.LPCB.EC.MUTE, IntObj)
    External(\_SB.PCI0.LPCB.EC.LSTE, IntObj)
    External(\_SB.PCI0.LPCB.EC.CCDM, IntObj)
    External(\_SB.PCI0.LPCB.EC.S3UC, IntObj)
    External(\_SB.PCI0.LPCB.EC.S4UC, IntObj)
    External(\_SB.PCI0.LPCB.EC.MHDD, IntObj)
    External(\_SB.PCI0.LPCB.EC.TFAN, IntObj)
    External(\_SB.PCI0.LPCB.EC.TCPU, IntObj)
    External(\_SB.PCI0.LPCB.EC.TGP1, IntObj)
    External(\_SB.PCI0.LPCB.EC.TGP2, IntObj)
    
    External(\_SB.PCI0.LPCB.EC.FANB, IntObj)
    External(\_SB.PCI0.LPCB.EC.FAN1, IntObj)
    External(\_SB.PCI0.LPCB.EC.CYC1, IntObj)
    External(\_SB.PCI0.LPCB.EC.CYC2, IntObj)
    
    External(\_SB.PCI0.LPCB.EC.LCDO, IntObj)
    External(\_SB.PCI0.LPCB.EC.NTEX, IntObj)
    External(\_SB.PCI0.LPCB.EC.ADJF, IntObj)
    External(\_SB.PCI0.LPCB.EC.XFNR, IntObj)
    External(\_SB.PCI0.LPCB.EC.XFN1, IntObj)
    External(\_SB.PCI0.LPCB.EC.TENF, IntObj)
    Scope(\_SB.PCI0.LPCB.EC)
    {    
        // This is an override for battery methods that access EC fields
        // larger than 8-bit.
        OperationRegion (ECF2, EmbeddedControl, Zero, 0x0100)
        Field (ECF2, ByteAcc, Lock, Preserve)
        {
            Offset (0x10),
            ZDC0,8,
            ZDC1,8, //B1DC
            ZFC0,8,
            ZFC1,8, //B1FC
            ZRC0,8,
            ZRC1,8, //B1RC
            ZFV0,8,
            ZFV1,8, //B1FV
            ,16, //CAPW,   16
            ,16, //CAPL,   16,
            ,16, //BGR1,   16,
            ,16, //BGR2,   16,
            ZDG0,8,
            ZDG1,8, //B1DG
            ZCR0,8,
            ZCR1,8, //B1CR
            //...
            Offset (0xF0), 
            ,16, //TSW0,   16
            ,16, //TSW1,   16,
            ,16, //TSW2,   16,
            ,16, //TSW3,   16,
            ,16, //TSW4,   16,
            ,16, //TSW5,   16,
            RPMX,8,
            RPMY,8,//RPM1
            RMPX,8,
            RMPY,8//RPM2
        }
        Method (BAT1._BIF, 0, NotSerialized)  // _BIF: Battery Information
                {
                    Name (BPKG, Package (0x0D)
                    {
                        One, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        One, 
                        0xFFFFFFFF, 
                        Zero, 
                        Zero, 
                        0x64, 
                        Zero, 
                        " ", 
                        " ", 
                        "LI-ION", 
                        "GIGABYTE"
                    })
                    Store ("Aero 15", Index (BPKG, 0x09))
                    Store (B1B2 (ZDC0, ZDC1), Index (BPKG, One))
                    Store (B1B2 (ZFC0, ZFC1), Index (BPKG, 0x02))
                    Store (B1B2 (ZDG0, ZDG1), Index (BPKG, 0x04))
                    If (B1B2 (ZFC0, ZFC1))
                    {
                        Store (B1B2 (ZFC0, ZFC1), FBFC)
                        Store (Divide (B1B2 (ZFC0, ZFC1), 0x0A, ), Index (BPKG, 0x05))
                        Store (Divide (B1B2 (ZFC0, ZFC1), 0x19, ), Index (BPKG, 0x06))
                        Store (Divide (B1B2 (ZFC0, ZFC1), 0x64, ), Index (BPKG, 0x07))
                    }

                    Return (BPKG)
                }
        Method (BAT1._BST, 0, NotSerialized)  // _BST: Battery Status
                {
                    Name (PKG1, Package (0x04)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    })
                    Store (And (B1ST, 0x07), Index (PKG1, Zero))
                    Store (B1B2 (ZCR0, ZCR1), Index (PKG1, One))
                    Store (B1B2 (ZRC0, ZRC1), Index (PKG1, 0x02))
                    Store (Divide (Multiply (B1B2 (ZRC0, ZRC1), FBFC), B1B2 (ZFC0, ZFC1), ), Index (PKG1, 0x02))
                    Store (B1B2 (ZFV0, ZFV1), Index (PKG1, 0x03))
                    Return (PKG1)
                }
         Method (BATS, 0, NotSerialized)
            {
                Store (B1B2 (ZRC0, ZRC1), B1SC)
                Store (B1ST, B1SS)
                Notify (BAT1, 0x80)
                Notify (BAT1, 0x81)
            }
         Scope(\_SB.PCI0.AMW0)
        {
             Method (WMBC, 3, Serialized)
            {
                If (LEqual (Arg1, 0x03))
                {
                    Notify (AMW0, 0xD2)
                    Return (Arg1)
                }
                Else
                {
                    Switch (Arg1)
                    {
                        Case (0xFA)
                        {
                            Return (\_SB.PCI0.LPCB.CRAF)
                        }
                        Case (0xF9)
                        {
                            Return (\_SB.PCI0.LPCB.PLMX)
                        }
                        Case (0xF7)
                        {
                            Return (Add (\_SB.PCI0.LPCB.EC.LUXL, Multiply (\_SB.PCI0.LPCB.EC.LUXH, 0x0100)))
                        }
                       Case (0xF6)
                        {
                            Return (\_SB.PCI0.LPCB.EC.KBLL)
                        }
                        Case (0xC2)
                        {
                            Return (\_SB.PCI0.LPCB.EC.WNON)
                        }
                        Case (0xC1)
                        {
                            Return (\_SB.PCI0.LPCB.EC.BTON)
                        }
                        Case (0xC3)
                        {
                            Return (\_SB.PCI0.LPCB.EC.P2ON)
                        }
                        Case (0xC5)
                        {
                            Return (\_SB.PCI0.LPCB.EC.CDON)
                        }
                        Case (0xCA)
                        {
                            Return (\_SB.PCI0.LPCB.EC.PSON)
                        }
                        Case (0xD1)
                        {
                            Return (XOr (\_SB.PCI0.LPCB.EC.SCEN, One))
                        }
                        Case (0xD0)
                        {
                            Return (\_SB.PCI0.LPCB.EC.USBC)
                        }
                        Case (0xC7)
                        {
                            Return (\_SB.PCI0.LPCB.EC.MUTE)
                        }
                        Case (0xEF)
                        {
                            Return (\_SB.PCI0.LPCB.EC.LSTE)
                        }
                        Case (0xFB)
                        {
                            Return (\_SB.PCI0.LPCB.EC.CCDM)
                        }
                        Case (0x7A)
                        {
                            Return (\_SB.PCI0.LPCB.EC.S3UC)
                        }
                        Case (0x7B)
                        {
                            Return (\_SB.PCI0.LPCB.EC.S4UC)
                        }
                        Case (0x76)
                        {
                            Return (\_SB.PCI0.LPCB.EC.MHDD)
                        }
                        Case (0x7D)
                        {
                            Return (\_SB.PCI0.LPCB.EC.TFAN)
                        }
                        Case (0xE1)
                        {
                            Return (\_SB.PCI0.LPCB.EC.TCPU)
                        }
                        Case (0xE2)
                        {
                            Return (\_SB.PCI0.LPCB.EC.TGP1)
                        }
                        Case (0xE3)
                        {
                            Return (\_SB.PCI0.LPCB.EC.TGP2)
                        }
                        Case (0xE4)
                        {
                            Return (B1B2 (\_SB.PCI0.LPCB.EC.RPMY, \_SB.PCI0.LPCB.EC.RPMX))
                        }
                        Case (0xE5)
                        {
                            Return (B1B2 (\_SB.PCI0.LPCB.EC.RMPY, \_SB.PCI0.LPCB.EC.RMPX))
                        }
                        Case (0x71)
                        {
                            Return (\_SB.PCI0.LPCB.EC.FANB)
                        }
                        Case (0x70)
                        {
                            Return (\_SB.PCI0.LPCB.EC.FAN1)
                        }
                        Case (0x6F)
                        {
                            Return (\_SB.PCI0.LPCB.EC.FAN1)
                        }
                        Case (0x6E)
                        {
                            Return (\_SB.PCI0.LPCB.EC.CYC1)
                        }
                        Case (0x6D)
                        {
                            Return (\_SB.PCI0.LPCB.EC.CYC2)
                        }
                        Case (0xC4)
                        {
                            Return (\_SB.PCI0.LPCB.EC.LCDO)
                        }
                        Case (0x6C)
                        {
                            Return (\_SB.PCI0.LPCB.EC.NTEX)
                        }
                        Case (0x6A)
                        {
                            Return (\_SB.PCI0.LPCB.EC.ADJF)
                        }
                        Case (0x6B)
                        {
                            Return (\_SB.PCI0.LPCB.EC.FAN1)
                        }
                        Case (0x68)
                        {
                            Store (Arg2, \_SB.PCI0.LPCB.EC.XFNR)
                            Sleep (0x64)
                            Return (\_SB.PCI0.LPCB.EC.XFN1)
                        }
                        Case (0x67)
                        {
                            Return (\_SB.PCI0.LPCB.EC.TENF)
                        }
                        Default
                        {
                            Return (Arg2)
                        }
                    }
                }
            }
        }
    }
    Method (B1B2, 2, NotSerialized) { Return (Or (Arg0, ShiftLeft (Arg1, 0x08))) }
}