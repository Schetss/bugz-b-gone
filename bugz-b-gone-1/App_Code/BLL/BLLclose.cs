using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BLLclose
/// </summary>
public class BLLclose
{
    DALclose DALclose = new DALclose();

    public void closeBug(Bug p_close)
    {
        DALclose.closeBug(p_close);
    }
}