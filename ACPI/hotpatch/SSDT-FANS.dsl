DefinitionBlock ("", "SSDT", 2, "hack", "FANS", 0x00000000)
{
    External(\_SB.PCI0.AMW0.WMBC, MethodObj)
    Device (SMCD)
    {
        Name (_HID, "FAN00000") 
        Name (TACH, Package ()
        {
            "LeftFAN","FANL",
            "RightFAN","FANR"
        })
        Method (FANL, 0, Serialized)
        {
            Local0 = \_SB.PCI0.AMW0.WMBC(Zero,0xE4,Zero)
            Return (Local0)
        }
        Method (FANR, 0, Serialized)
        {
            Local0 = \_SB.PCI0.AMW0.WMBC(Zero,0xE5,Zero)
            Return (Local0)
        }
    }
}

